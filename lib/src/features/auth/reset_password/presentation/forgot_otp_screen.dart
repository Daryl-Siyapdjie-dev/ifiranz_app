import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../../../../router/app_router.dart';
import '../../../core/infrastructure/constants/app_sizes.dart';
import '../../../core/infrastructure/extensions/localization_extension.dart';
import '../../../core/infrastructure/utils/api_constants.dart';
import '../../../core/infrastructure/utils/common_import.dart';
import '../../../core/presentation/themes/app_colors.dart';
import '../../../core/presentation/widgets/app_bars.dart';
import '../application/reset_password_notifier.dart';
import '../domain/reset_password_request.dart';
import '../shared/providers.dart';

@RoutePage()
class ForgotOTPScreen extends StatefulHookConsumerWidget {
  final bool isPhoneNumber;
  final String? token;
  final String verifier;
  const ForgotOTPScreen(
      {this.isPhoneNumber = true,
      this.token,
      required this.verifier,
      super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotOTPScreenState();
}

class _ForgotOTPScreenState extends ConsumerState<ForgotOTPScreen> {
  bool _disabled = true, restart = false;
  Timer? _timer;
  int _secondsRemaining = 300; // 5 minutes = 300 seconds
  String _otp = "";

  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void startTimer() {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if (_secondsRemaining == 0) {
          _timer!.cancel();
        } else {
          _secondsRemaining--;
        }
      });
    });
  }

  void _onOtpChange(String value, int index) {
    if (value.isNotEmpty && int.tryParse(value) is int) {
      if (index < 5) {
        if (!_disabled) {
          setState(() {
            _disabled = true;
          });
        }

        _focusNodes[index + 1].requestFocus();
      } else {
        // The focus has reached the last digit, we can close the keyboard here.
        setState(() {
          _disabled = false;
        });
        _focusNodes[index].unfocus();
      }
    } else {
      if (index > 0) {
        // The current field is empty, so we move the focus to the previous field.
        _focusNodes[index].unfocus();
        _focusNodes[index - 1].requestFocus();
        if (!_disabled) {
          setState(() {
            _disabled = true;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;

    useEffect(() {
      startTimer();

      return () {
        _timer?.cancel();
      };
    }, []);

    ref.listen<ResetPasswordState>(
      resetPasswordNotifierProvider,
      (previous, next) {
        next.maybeWhen(
          orElse: () {},
          otpVerifiedSuccess: (data) {
            if (data?.datas.valid ?? false) {
              AutoRouter.of(context).popAndPush(
                ResetPasswordRoute(
                  isPhoneNumber: widget.isPhoneNumber,
                  request: ResetPasswordRequest(
                    phoneOrEmail: widget.verifier,
                    token: _otp,
                  ),
                ),
              );
            } else {
              Flushbar(
                message: data?.message ?? "OTP Not valid",
                icon: const Icon(
                  Icons.info,
                  color: AppColors.alertError,
                ),
                borderRadius: BorderRadius.circular(10),
                backgroundColor: AppColors.bgRed,
                messageColor: AppColors.alertError,
                duration:
                    const Duration(seconds: ApiConstants.flushbarDuration),
                margin: const EdgeInsets.all(16),
              ).show(context);
            }
          },
          failed: (errorMessage) {
            Flushbar(
              message: "$errorMessage",
              icon: const Icon(
                Icons.info,
                color: AppColors.alertError,
              ),
              borderRadius: BorderRadius.circular(10),
              backgroundColor: AppColors.bgRed,
              messageColor: AppColors.alertError,
              duration: const Duration(seconds: ApiConstants.flushbarDuration),
              margin: const EdgeInsets.all(16),
            ).show(context);
          },
        );
      },
    );
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ProgressHUD(
        barrierEnabled: true,
        borderWidth: 0,
        child: Builder(
          builder: (_) {
            return Scaffold(
                appBar: simpleBackAppBar(),
                body: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    gapH32,
                    Center(
                      child: Text(
                        context.locale.forgotOtpScreenOtp,
                        style: GoogleFonts.quicksand(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    gapH8,
                    Center(
                      child: Text(
                        context.locale.forgotOtpScreenOtpgetNotificationMessage(
                            widget.isPhoneNumber.toString(), widget.verifier),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 72,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(
                        6,
                        (index) => SizedBox(
                          width: 60.0,
                          child: TextFormField(
                            controller: _otpControllers[index],
                            focusNode: _focusNodes[index],
                            autofocus: index == 0,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            onChanged: (value) => _onOtpChange(value, index),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 20),
                            decoration: const InputDecoration(
                              counterText: '',
                            ),
                          ),
                        ),
                      ),
                    ),
                    gapH32,
                    ElevatedButton(
                      onPressed: _disabled || _secondsRemaining == 0
                          ? null
                          : () {
                              String otpCode = '';
                              for (var controller in _otpControllers) {
                                otpCode += controller.text;
                              }
                              _otp = otpCode;
                              final progress = ProgressHUD.of(_);
                              progress?.show();
                              ref
                                  .read(resetPasswordNotifierProvider.notifier)
                                  .findByOtp(
                                    widget.verifier,
                                    otpCode,
                                  )
                                  .whenComplete(() => progress!.dismiss());
                            },
                      child: Text(
                          context.locale.forgotOtpScreenOtpSendInstruction),
                    ),
                    gapH32,
                    Row(
                      children: [
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: context
                                      .locale.forgotOtpScreenOtpDidRecieveOtp,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              TextSpan(
                                  text: context.locale.forgotOtpScreenOtpResend,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        _secondsRemaining = 30;
                                      });

                                      final progress = ProgressHUD.of(_);
                                      progress?.show();

                                      if (!widget.isPhoneNumber) {
                                        ref
                                            .read(resetPasswordNotifierProvider
                                                .notifier)
                                            .resetPasswordByEmail(
                                                widget.verifier)
                                            .whenComplete(
                                                () => progress!.dismiss());
                                      } else {
                                        ref
                                            .read(resetPasswordNotifierProvider
                                                .notifier)
                                            .resetPasswordByPhoneNumber(
                                                widget.verifier)
                                            .whenComplete(
                                                () => progress!.dismiss());
                                      }
                                    },
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: AppColors.primaryColor))
                            ])),
                        const Spacer(),
                        Text(
                          '$minutes:${seconds.toString().padLeft(2, '0')}',
                          style:
                              const TextStyle(color: AppColors.secondaryColor),
                        ),
                      ],
                    ),
                    gapH32,
                  ],
                ));
          },
        ),
      ),
    );
  }
}

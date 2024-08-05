import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ifiranz_client/src/features/auth/reset_password/application/reset_password_notifier.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';

import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/auth/reset_password/shared/providers.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_constants.dart';

import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../../../core/infrastructure/utils/common_import.dart';
import '../../../core/presentation/widgets/common_textfield.dart';
import '../../../core/presentation/widgets/phone_number_textfield.dart';
import '../../../core/shared/providers.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulHookConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isResetByEmail = true;

  @override
  Widget build(BuildContext context) {
    final emailFocusNode = useFocusNode();
    final phoneNumberFocusNode = useFocusNode();
    final emailController = useTextEditingController();
    final phoneController = useTextEditingController();

    ref.listen<ResetPasswordState>(
      resetPasswordNotifierProvider,
      (previous, next) {
        next.maybeWhen(
          orElse: () {},
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
          otpSendSuccess: (res) {
            if (res.datas.valid ?? false) {
              AutoRouter.of(context).push(
                ForgotOTPRoute(
                  isPhoneNumber: !isResetByEmail,
                  verifier: isResetByEmail
                      ? emailController.text.trim()
                      : phoneController.text.trim(),
                ),
              );
            } else {
              Flushbar(
                message: res.message ?? " ",
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
        );
      },
    );

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Scaffold(
                appBar: simpleBackAppBar(),
                body: Form(
                  key: _formKey,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      gapH32,
                      Center(
                        child: Text(
                          context.locale.fotgotPasswordScreen,
                          style: GoogleFonts.quicksand(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                      gapH8,
                      Center(
                        child: Text(
                          context.locale.fotgotPasswordScreenTitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      gapH32,
                      isResetByEmail
                          ? CommonTextFormField(
                              controller: emailController,
                              focusNode: emailFocusNode,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.emailAddress,
                              isLabelRequired: true,
                              hasLabel: true,
                              hintText: "Email",
                              label: 'Email',
                              validator: ref
                                  .read(formValidationServiceProvider)
                                  .validateEmail,
                            )
                          : PhoneNumberTextFormField(
                              phoneNumberController: phoneController,
                              phoneNumberFocusNode: phoneNumberFocusNode,
                              hasLabel: true,
                              isLabelRequired: true,
                              label: context.locale.phone,
                              onChanged: ({
                                String? phoneCode,
                                String? countryCode,
                                String? countryName,
                                String? phonNumber,
                              }) {
                                if (phoneCode != null) {
                                  setState(() {});
                                }
                              },
                            ),
                      gapH32,
                      ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();

                          if (_formKey.currentState!.validate()) {
                            final progress = ProgressHUD.of(_);
                            progress?.show();

                            if (isResetByEmail) {
                              ref
                                  .read(resetPasswordNotifierProvider.notifier)
                                  .resetPasswordByEmail(
                                      emailController.text.trim())
                                  .whenComplete(() => progress!.dismiss());
                            } else {
                              ref
                                  .read(resetPasswordNotifierProvider.notifier)
                                  .resetPasswordByPhoneNumber(phoneController
                                      .text
                                      .trim()
                                      .replaceAll(" ", ''))
                                  .whenComplete(() => progress!.dismiss());
                            }
                          }
                        },
                        child: Text(
                            context.locale.forgotOtpScreenOtpSendInstruction),
                      ),
                      gapH32,
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                                text: context.locale
                                    .fotgotPasswordScreendontHaveAccount(
                                        isResetByEmail.toString(),
                                        phoneController.text
                                            .trim()
                                            .replaceAll(" ", '')),
                                style: Theme.of(context).textTheme.bodyMedium),
                            TextSpan(
                                text: context.locale
                                    .fotgotPasswordScreenResetOptionMessage(
                                        isResetByEmail.toString()),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    setState(() {
                                      isResetByEmail = !isResetByEmail;
                                    });
                                  },
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: AppColors.primaryColor))
                          ]))
                    ],
                  ),
                ),
              );
            })));
  }
}

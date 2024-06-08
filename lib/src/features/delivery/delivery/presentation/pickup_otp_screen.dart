import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ifiranz_client/src/features/core/domain/enum.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';
import 'package:ifiranz_client/src/features/delivery/delivery/application/pickup_otp_notifier.dart';
import 'package:ifiranz_client/src/features/delivery/delivery/domain/otp_request.dart';
import 'package:ifiranz_client/src/features/delivery/delivery/shared/providers.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../../../core/infrastructure/utils/common_import.dart';

@RoutePage()
class PickUpOtpScreen extends StatefulHookConsumerWidget {
  final Records data;
  const PickUpOtpScreen({super.key, required this.data});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PickUpOtpScreenState();
}

class _PickUpOtpScreenState extends ConsumerState<PickUpOtpScreen> {
  bool _disabled = true, restart = false;

  final List<TextEditingController> _otpControllers = List.generate(6, (_) => TextEditingController());
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
    ref.listen<PickupState>(pickupNotifierProvider, (previous, next) {
      next.maybeWhen(
          orElse: () {},
          failed: (errorMessage) {
            showErrorFlushbar(context, errorMessage ?? "");
          },
          // successully: () {
          //   context.navigateTo(const OrderDeliveryTabRoute());
          // },
          otpVerifiedSuccess: (result) {
            showSuccessFlushbar(context, context.locale.operationSuccess);
            ref.read(firestoreServiceProvider).setLivreurPosition(
                latitude: widget.data.latitude,
                longitude: widget.data.longitude,
                idCommande: widget.data.commande!.id!,
                status: OrderStatus.livre.value);

            context.popRoute();
            context.navigateTo(const OrderLayoutRoute(children: [OrderDeliveryTabRoute()]));
            // ref
            //     .read(pickupNotifierProvider.notifier)
            //     .updateDeliveryOrder(widget.data);
          });
    });
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Scaffold(
                  appBar: simpleBackAppBar(),
                  body: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      gapH32,
                      Center(
                        child: Text(
                          'OTP verification',
                          style: GoogleFonts.quicksand(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blackColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      gapH8,
                      const SizedBox(
                        height: 72,
                      ),
                      Row(
                        children: List.generate(
                          6,
                          (index) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextFormField(
                                controller: _otpControllers[index],
                                focusNode: _focusNodes[index],
                                autofocus: index == 0,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                ],
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                onChanged: (value) => _onOtpChange(value, index),
                                style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20),
                                decoration: const InputDecoration(
                                  counterText: '',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      gapH32,
                      ElevatedButton(
                        onPressed: () {
                          final progress = ProgressHUD.of(_);
                          progress?.show();
                          String otpCode = '';
                          for (var controller in _otpControllers) {
                            otpCode += controller.text;
                          }

                          ref
                              .read(pickupNotifierProvider.notifier)
                              .validateOtpToDelivery(OtpRequest(id: widget.data.id!, value: otpCode))
                              .whenComplete(() => progress?.dismiss());
                        },
                        child: Text(context.locale.submit),
                      ),
                      gapH32,
                    ],
                  ));
            })));
  }
}

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client_request.dart';
import 'package:ifiranz_client/src/features/auth/core/shared/provider.dart';
import 'package:ifiranz_client/src/features/client/home/domain/current_cart_response.dart';
import 'package:ifiranz_client/src/features/client/home/domain/transaction_response.dart';
import 'package:ifiranz_client/src/features/client/home/shared/providers.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/cashout_model.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/initiate_request.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/transaction_request.dart';
import 'package:ifiranz_client/src/features/client/payment/share/providers.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/common_textfield.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/phone_number.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';
import 'package:ifiranz_client/src/router/app_router.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:lottie/lottie.dart';

import '../../../core/infrastructure/utils/common_import.dart';
import '../../../core/presentation/themes/app_colors.dart';
import '../../payment/domain/verify_transaction_request.dart';

@RoutePage()
class OrderTabScreen extends StatefulHookConsumerWidget {
  final CashoutModel? operatorInfo;

  const OrderTabScreen({
    super.key,
    this.operatorInfo,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderTabScreenState();
}

class _OrderTabScreenState extends ConsumerState<OrderTabScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _remeberMe = false;

  BuildContext? _context;

  @override
  void initState() {
    ref
        .read(getCurrentClientProvider.notifier)
        .getCurrentClient(ClientRequest(value: SharedPref.getEmail()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);

    final getCurrentClient = ref.watch(getCurrentClientProvider);
    final emailFocus = useFocusNode();
    final phoneFocus = useFocusNode();
    final nameFocus = useFocusNode();
    final checkBoxFocusNode = useFocusNode();
    final emailController =
        useTextEditingController(text: getCurrentClient.value?.user);
    final phoneController = useTextEditingController();
    final isoCode = useTextEditingController();
    final nameController =
        useTextEditingController(text: getCurrentClient.value?.nom);

    useEffect(() {
      emailController.text =
          getCurrentClient.value?.user ?? emailController.text;
      phoneController.text =
          getCurrentClient.value?.tel ?? phoneController.text;
      nameController.text = getCurrentClient.value?.nom ?? nameController.text;

      return;
    }, [getCurrentClient.hasValue]);

    ref.listen(paymentProvider, (prev, curr) {
      if (_context == null) return;

      final progress = ProgressHUD.of(_context!);

      curr.maybeWhen(
          orElse: () => null,
          initiated: (res) {
            if (_context == null) return;
            PhoneNumberUtil.normalizePhoneNumber(
              isoCode: isoCode.text.trim(),
              phoneNumber: phoneController.text.trim(),
            ).then((phone) {
              progress?.show();
              ref.read(paymentProvider.notifier).finalyse(TransactionRequest(
                  quoteId: res.quoteId,
                  customerPhonenumber: phone,
                  customerEmailaddress: cart.client?.user,
                  customerName: nameController.text,
                  customerAddress: cart.client?.adresse,
                  serviceNumber:
                      trouverNumeroTelephone(widget.operatorInfo!.serviceId!),
                  trid: ""));
            });
          },
          finalyse: (res) {
            progress?.dismiss();
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => PaymentValidationWidget(res: res));
          },
          success: () async {
            ref.read(cartProvider.notifier).getCurrentCart();
            showSuccessFlushbar(context, "Payment success");
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => Dialog(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Lottie.asset('assets/json/succes_lottie.json'),
                            const Text('Payment was success'),
                            gapH20,
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();

                                  context.navigateTo(
                                      const OrderClientDeliveriesRoute());
                                },
                                child: const Text('Ok')),
                            gapH10,
                          ],
                        ),
                      ),
                    ));
          },
          error: (errorMessage) {
            progress?.dismiss();
            showErrorFlushbar(context, "$errorMessage");
          });
    });

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              if (mounted && _context is! BuildContext) {
                _context = _;
              }

              return Scaffold(
                appBar: CustomAppBar(
                  title: context.locale.editPaymentInfo,
                  canPop: true,
                ),
                body: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              gapH32,
                              PhoneNumberWidget(
                                controller: phoneController,
                                isoCode: isoCode,
                              ),
                              gapH20,
                              CommonTextFormField(
                                controller: emailController,
                                focusNode: emailFocus,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                hintText: 'Email',
                                textInputAction: TextInputAction.done,
                                isEnabled: true,
                                textInputType: TextInputType.text,
                                hasLabel: true,
                                label: 'Email',
                                obscureText: false,
                              ),
                              gapH20,
                              CommonTextFormField(
                                controller: nameController,
                                focusNode: nameFocus,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                hintText: context.locale.name,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.text,
                                isLabelRequired: true,
                                hasLabel: true,
                                validator: ref
                                    .read(formValidationServiceProvider)
                                    .validateFirstName,
                                label: context.locale.name,
                              ),
                              gapH20,
                              gapH10,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                      checkColor:
                                          MaterialStateColor.resolveWith(
                                        (states) => AppColors.whiteColor,
                                      ),
                                      fillColor: MaterialStateColor.resolveWith(
                                        (states) {
                                          if (states.contains(
                                              MaterialState.selected)) {
                                            return AppColors.primaryColor;
                                          }
                                          return AppColors.greyBackground;
                                        },
                                      ),
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.black),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    )),
                                    child: Checkbox(
                                      value: _remeberMe,
                                      focusNode: checkBoxFocusNode,
                                      onChanged: (newValue) {
                                        checkBoxFocusNode.requestFocus();
                                        setState(() {
                                          _remeberMe = !_remeberMe;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _remeberMe = !_remeberMe;
                                        });
                                      },
                                      child: Text(
                                        context.locale.checkPrivate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              gapH32,
                              gapH32,
                              ElevatedButton(
                                onPressed: !_remeberMe ||
                                        widget.operatorInfo is! CashoutModel
                                    ? null
                                    : () {
                                        if (_formKey.currentState!.validate() &&
                                            _remeberMe) {
                                          PhoneNumberUtil.normalizePhoneNumber(
                                            isoCode: isoCode.text.trim(),
                                            phoneNumber:
                                                phoneController.text.trim(),
                                          ).then((value) {
                                            final progress = ProgressHUD.of(_);
                                            progress?.show();

                                            ref
                                                .read(paymentProvider.notifier)
                                                .initTranstion(InitiateRequest(
                                                    command: cart.id,
                                                    paymentMethod: widget
                                                        .operatorInfo?.id));
                                          });
                                        }
                                      },
                                child: Text(context.locale.pay),
                              ),
                              gapH30,
                            ]))),
                  ),
                ),
              );
            })));
  }
}

String trouverNumeroTelephone(int code) {
  switch (code) {
    case 90010:
      return "697707102"; // Express Union
    case 100238:
      return "242254751"; // Yommee
    case 20053:
      return "677389120"; // MTN
    case 50053:
      return "697707102"; // Orange
    default:
      return "Code non reconnu";
  }
}

class PaymentValidationWidget extends StatefulHookConsumerWidget {
  final TransactionResponse res;

  const PaymentValidationWidget({super.key, required this.res});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PaymentValidationWidgetState();
}

class _PaymentValidationWidgetState
    extends ConsumerState<PaymentValidationWidget> {
  Timer? _timer;
  int _secondsRemaining = 15, initial = 15; // 5 minutes = 300 seconds

  void startTimer() {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if (_secondsRemaining == 0) {
          _timer!.cancel();
          _secondsRemaining = initial;
        } else {
          _secondsRemaining--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);

    ref.listen(paymentProvider, (prev, curr) {
      curr.maybeWhen(
          orElse: () => null,
          failed: (errorMessage) {
            Navigator.of(context).pop();
            showErrorFlushbar(context, "$errorMessage");
          },
          error: (errorMessage) {
            startTimer();
            showErrorFlushbar(context, "$errorMessage");
          });
    });

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Dialog(
                  child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(context.locale.validatePaymentTitle),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(context.locale.validatePaymentOrange),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(context.locale.validatePaymentMTN),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(context.locale.validatePaymentSubTitle),
                      ),
                      gapH20,
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                                onPressed: () {
                                  context.popRoute();
                                },
                                child: Text(
                                  context.locale.annuler,
                                  style: Theme.of(context).textTheme.bodySmall,
                                )),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: (_timer?.isActive ?? false)
                                  ? null
                                  : () {
                                      final progress2 = ProgressHUD.of(_);
                                      progress2?.show();
                                      ref
                                          .read(paymentProvider.notifier)
                                          .verifyTransaction(
                                              VerifyTransactionRequest(
                                                  commandId: cart.id!,
                                                  trid: widget.res.trid!,
                                                  marchand: cart
                                                          .greatMontantTotal() -
                                                      cart.montantLivraison!,
                                                  deliver:
                                                      cart.montantLivraison!))
                                          .whenComplete(() {
                                        progress2?.dismiss();
                                      });
                                    },
                              child: Text(
                                  '${_secondsRemaining != initial && _secondsRemaining != 0 ? '${_secondsRemaining}s' : ''} Vérifier'),
                            ),
                          ),
                        ],
                      ),
                      gapH12
                    ],
                  ),
                ),
              ));
            })));
  }
}

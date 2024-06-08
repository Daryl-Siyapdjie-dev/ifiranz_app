import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/string_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/find_authority_role.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/phone_number.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:libphonenumber/libphonenumber.dart';

import '../../../../router/app_router.dart';
import '../../../core/infrastructure/constants/app_sizes.dart';
import '../../../core/infrastructure/extensions/theme_extension.dart';
import '../../../core/infrastructure/utils/api_constants.dart';
import '../../../core/infrastructure/utils/common_import.dart';
import '../../../core/presentation/themes/app_colors.dart';
import '../../../core/presentation/widgets/common_textfield.dart';
import '../../../core/shared/providers.dart';
import '../application/auth_notifier.dart';
import '../shared/providers.dart';

@RoutePage()
class SignInScreen extends StatefulHookConsumerWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isPhone = true;
  bool _remeberMe = true;

  @override
  Widget build(BuildContext context) {
    final phoneNumberOrEmailFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();
    final checkBoxFocusNode = useFocusNode();
    final phoneOrEmailController = useTextEditingController();
    final isoCode = useTextEditingController();
    final passwordController = useTextEditingController();

    ref.listen<AuthState>(
      authNotifierProvider,
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
          authenticate: (value) async {
            ref.read(notificationServiceProvider).init();

            if ((SharedPref.getHasEndAccountCreationPhone() is String)) {
              AutoRouter.of(context).push(const RegisterAdditionalInfoRoute());
              return;
            }

            Flushbar(
              message: context.locale.loginScreenSucces,
              icon: const Icon(
                Icons.info,
                color: AppColors.alertSuccess,
              ),
              borderRadius: BorderRadius.circular(10),
              backgroundColor: AppColors.bgGreen,
              messageColor: AppColors.alertSuccess,
              margin: const EdgeInsets.all(16),
              duration: const Duration(seconds: ApiConstants.flushbarDuration),
            ).show(context).then((_) {
              Map<String, dynamic> decodedToken = JwtDecoder.decode(value!);
              SharedPref.setEmail(decodedToken['sub']);
              if (findAuthorityRole((decodedToken['authorities'] as List).map((e) => Map<String, dynamic>.from(e)).toList()) == Authories.merchant) {
                AutoRouter.of(context).pushAndPopUntil(const MainAppMarchandRoute(), predicate: (predicate) => false);
              } else if (findAuthorityRole((decodedToken['authorities'] as List).map((e) => Map<String, dynamic>.from(e)).toList()) ==
                  Authories.delivery) {
                AutoRouter.of(context).pushAndPopUntil(const MainAppLivreurRoute(), predicate: (predicate) => false);
              } else {
                AutoRouter.of(context).pushAndPopUntil(const MainAppRoute(), predicate: (predicate) => false);
              }
            });
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
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              context.locale.loginScreenTitle,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                          gapH10,
                          Center(
                            child: Text(
                              context.locale.loginScreenDescription,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 12,
                                  ),
                            ),
                          ),
                          gapH32,
                          gapH10,
                          isPhone
                              ? PhoneNumberWidget(controller: phoneOrEmailController, isoCode: isoCode)
                              : CommonTextFormField(
                                  controller: phoneOrEmailController,
                                  focusNode: phoneNumberOrEmailFocusNode,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  hintText: 'Email',
                                  textInputAction: TextInputAction.done,
                                  validator: ref.read(formValidationServiceProvider).validateEmail,
                                  textInputType: TextInputType.text,
                                  isLabelRequired: true,
                                  hasLabel: true,
                                  label: 'Email',
                                  obscureText: false,
                                ),
                          gapH20,
                          CommonTextFormField(
                            controller: passwordController,
                            focusNode: passwordFocusNode,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            hintText: context.locale.password,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.text,
                            isLabelRequired: true,
                            hasLabel: true,
                            validator: ref.read(formValidationServiceProvider).validatePassword,
                            label: context.locale.password,
                            obscureText: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  checkBoxFocusNode.requestFocus();
                                  setState(() {
                                    _remeberMe = !_remeberMe;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: _remeberMe,
                                        focusNode: checkBoxFocusNode,
                                        onChanged: (newValue) {
                                          checkBoxFocusNode.requestFocus();
                                          setState(() {
                                            _remeberMe = !_remeberMe;
                                            // ref
                                            //     .read(
                                            //         sharedPrefsRepositoryProvider)
                                            //     .saveBool(
                                            //         SharedPrefsConstants
                                            //             .rememberMe,
                                            //         _remeberMe);
                                          });
                                        },
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        context.locale.loginScreenRememeberMe,
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  AutoRouter.of(context).push(
                                    const ForgotPasswordRoute(),
                                  );
                                },
                                overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return AppColors.primaryColor.withOpacity(.1);
                                  }
                                  return Colors.transparent;
                                }),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    context.locale.forgotPassword,
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: AppColors.primaryColor,
                                          fontSize: 12,
                                        ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              phoneOrEmailController.clear();

                              setState(() {
                                isPhone = !isPhone;
                              });
                            },
                            child: Text(context.locale.connectWithEmailOrPhoneNumber(isPhone.toString()),
                                style: context.theme.textTheme.bodyMedium?.copyWith(
                                  fontSize: 12,
                                  color: AppColors.greyLight,
                                )),
                          ),
                          gapH10,
                          ElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();

                              if (_formKey.currentState!.validate()) {
                                if (isPhone) {
                                  PhoneNumberUtil.normalizePhoneNumber(
                                    isoCode: isoCode.text.trim(),
                                    phoneNumber: phoneOrEmailController.text.trim(),
                                  ).then((phone) {
                                    final progress = ProgressHUD.of(_);
                                    progress?.show();

                                    ref
                                        .read(authNotifierProvider.notifier)
                                        .loginUser(
                                          phone!,
                                          passwordController.text,
                                        )
                                        .whenComplete(() {
                                      progress!.dismiss();
                                    });
                                  });
                                } else {
                                  final progress = ProgressHUD.of(_);
                                  progress?.show();
                                  ref
                                      .read(authNotifierProvider.notifier)
                                      .loginUser(
                                        isPhone ? phoneOrEmailController.text.removeAllSpace() : phoneOrEmailController.text.trim().toLowerCase(),
                                        passwordController.text,
                                      )
                                      .whenComplete(() {
                                    progress!.dismiss();
                                  });
                                }
                              }
                            },
                            child: const Text('Login'),
                          ),
                          gapH30,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(child: Divider(color: AppColors.greyLight)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  context.locale.orLoginWith,
                                  style: context.theme.textTheme.bodyMedium?.copyWith(
                                    fontSize: 12,
                                    color: AppColors.greyLight,
                                  ),
                                ),
                              ),
                              const Expanded(child: Divider(color: AppColors.greyLight)),
                            ],
                          ),
                          gapH30,
                          OutlinedButton.icon(
                              onPressed: () => _loginWithGoogle(_),
                              icon: const Icon(
                                FontAwesomeIcons.google,
                                size: 18,
                                color: AppColors.greyLight,
                              ),
                              label: Text(context.locale.signinWithGoogle)),
                          gapH30,
                          Center(
                            child: Text(
                              context.locale.loginScreenhanAnAccount,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.greyLight,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => context.pushRoute(const RegisterRoute()),
                            child: Text(
                              context.locale.loginScreenSignUp,
                              style: context.theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: AppColors.greyDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _loginWithGoogle(BuildContext context) {
    final progress = ProgressHUD.of(context);
    progress?.show();

    ref.read(authNotifierProvider.notifier).loginWithGoogle().whenComplete(() {
      progress!.dismiss();
    });
  }
}

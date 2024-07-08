import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:libphonenumber/libphonenumber.dart';

import '../../../../router/app_router.dart';
import '../../../core/domain/api_failure.dart';
import '../../../core/infrastructure/constants/app_sizes.dart';
import '../../../core/infrastructure/extensions/localization_extension.dart';
import '../../../core/infrastructure/extensions/theme_extension.dart';
import '../../../core/infrastructure/services/local/shared_pref.dart';
import '../../../core/infrastructure/utils/api_constants.dart';
import '../../../core/infrastructure/utils/common_import.dart';
import '../../../core/presentation/themes/app_colors.dart';
import '../../../core/presentation/widgets/common_textfield.dart';
import '../../../core/presentation/widgets/phone_number.dart';
import '../../../core/presentation/widgets/toats.dart';
import '../../../core/shared/providers.dart';
import '../domain/profile_response.dart';
import '../shared/providers.dart';

@RoutePage()
class RegisterScreen extends StatefulHookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final String _phoneCode = "00237";

  final String _cmPhoneCode = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailFocusNode = useFocusNode();
    final phoneNumberFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();
    final confirmPasswordFocusNode = useFocusNode();

    final emailController = useTextEditingController();
    final nameController = useTextEditingController();
    final lastnameController = useTextEditingController();
    final addressController = useTextEditingController();
    final phoneController = useTextEditingController();
    final phoneCodeController = useTextEditingController();
    final isoCode = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final profile = ref.watch(profileFutureProvider);

    ref.listen(
      registerNotifierProvider,
      (previous, next) {
        next.maybeMap(
            orElse: () {},
            failed: (error) {
              Flushbar(
                message: "${error.errorMessage}",
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
            },
            success: (_) {
              SharedPref.setHasEndAccountCreationPhone(
                  _phoneCode.replaceAll("+", "00"));
              SharedPref.setEmail(emailController.text.trim());
              showSuccessFlushbar(context, context.locale.operationSuccess)
                  .then((value) {
                AutoRouter.of(context).pushAndPopUntil(const SignInRoute(),
                    predicate: (predicate) => false);
              });
            });
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
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        switch (profile) {
                          AsyncError(:final ApiFailure error) => Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('An error occured: ${error.message}'),
                                  IconButton(
                                      onPressed: () => ref.refresh(
                                          profileFutureProvider.future),
                                      icon: const Icon(Icons.refresh))
                                ],
                              ),
                            ),
                          AsyncData() => Container(),
                          _ => const LinearProgressIndicator(),
                        },
                        if (profile.isRefreshing)
                          const LinearProgressIndicator(),
                        Center(
                          child: Text(
                            context.locale.registerScreenCreateAccount,
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
                            context.locale.registerScreensubTitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 12,
                                ),
                          ),
                        ),
                        gapH32,
                        gapH10,
                        CommonTextFormField(
                          controller: nameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          isLabelRequired: false,
                          hasLabel: true,
                          hintText: context.locale.name,
                          label: context.locale.name,
                          validator: ref
                              .read(formValidationServiceProvider)
                              .validateFirstName,
                        ),
                        gapH20,
                        CommonTextFormField(
                          controller: lastnameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          isLabelRequired: false,
                          hasLabel: true,
                          hintText: context.locale.lastname,
                          label: context.locale.lastname,
                          validator: ref
                              .read(formValidationServiceProvider)
                              .validateLastName,
                        ),
                        gapH20,
                        CommonTextFormField(
                          controller: addressController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          isLabelRequired: false,
                          hasLabel: true,
                          hintText: context.locale.address,
                          label: context.locale.address,
                          validator: ref
                              .read(formValidationServiceProvider)
                              .validateSimple,
                        ),
                        gapH20,
                        CommonTextFormField(
                          controller: emailController,
                          // focusNode: emailFocusNode,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.emailAddress,
                          isLabelRequired: false,
                          hasLabel: true,
                          hintText: 'Email',
                          label: 'Email',
                          validator: emailController.text.isNotEmpty
                              ? ref
                                  .read(formValidationServiceProvider)
                                  .validateEmail
                              : (String? val) {
                                  return;
                                },
                        ),
                        gapH20,
                        PhoneNumberWidget(
                          controller: phoneController,
                          isoCode: isoCode,
                          phoneCode: phoneCodeController,
                        ),
                        gapH20,
                        CommonTextFormField(
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          isLabelRequired: true,
                          hasLabel: true,
                          hintText: context.locale.password,
                          label: context.locale.password,
                          validator: ref
                              .read(formValidationServiceProvider)
                              .validatePassword,
                          obscureText: true,
                        ),
                        gapH20,
                        CommonTextFormField(
                          controller: confirmPasswordController,
                          focusNode: confirmPasswordFocusNode,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          isLabelRequired: true,
                          hasLabel: true,
                          hintText: context.locale.confirmPassword,
                          label: context.locale.confirmPassword,
                          obscureText: true,
                          validator: (pass) => ref
                              .read(formValidationServiceProvider)
                              .validateConfirmPassword(
                                  pass, passwordController.text.trim()),
                        ),
                        gapH20,
                        ElevatedButton(
                          onPressed: profile.isLoading || profile.hasError
                              ? null
                              : () {
                                  FocusScope.of(context).unfocus();

                                  if (_formKey.currentState!.validate()) {
                                    PhoneNumberUtil.normalizePhoneNumber(
                                      isoCode: isoCode.text.trim(),
                                      phoneNumber: phoneController.text.trim(),
                                    ).then((res) async {
                                      final progress = ProgressHUD.of(_);

                                      progress?.show();
                                      ref
                                          .read(
                                              registerNotifierProvider.notifier)
                                          .register(
                                              name: nameController.text,
                                              lastname: nameController.text,
                                              address: addressController.text,
                                              countryCode:
                                                  phoneCodeController.text,
                                              profile: profile.value!,
                                              phoneNumber: res!,
                                              email: emailController.text
                                                  .trim()
                                                  .toLowerCase(),
                                              password: passwordController.text,
                                              confirmPassword:
                                                  confirmPasswordController
                                                      .text)
                                          .then((value) => progress!.dismiss())
                                          .whenComplete(
                                              () => progress!.dismiss());
                                    });
                                  }
                                },
                          child: Text(context.locale.loginScreenSignUp),
                        ),
                        gapH30,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(
                                child: Divider(color: AppColors.greyLight)),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                context.locale.orLoginWith,
                                style: context.theme.textTheme.bodyMedium
                                    ?.copyWith(
                                  fontSize: 12,
                                  color: AppColors.greyLight,
                                ),
                              ),
                            ),
                            const Expanded(
                                child: Divider(color: AppColors.greyLight)),
                          ],
                        ),
                        gapH30,
                        OutlinedButton.icon(
                          onPressed: () =>
                              _registerWithGoogle(_, profile.value),
                          icon: const Icon(
                            FontAwesomeIcons.google,
                            size: 18,
                            color: AppColors.greyLight,
                          ),
                          label: Text(context.locale.registerWithGoogle),
                        ),
                        gapH30,
                        Center(
                          child: Text(
                            context.locale.dontHaveAccount,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.greyLight,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.popRoute();
                          },
                          child: Text(
                            context.locale.signUP,
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: AppColors.greyDark,
                            ),
                          ),
                        )
                      ],
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

  void _registerWithGoogle(BuildContext context, ProfileResponse? profile) {
    if (profile == null) return;
    final progress = ProgressHUD.of(context);
    progress?.show();

    ref
        .read(registerNotifierProvider.notifier)
        .registerWithGoogle(profile)
        .whenComplete(() {
      progress!.dismiss();
    });
  }
}

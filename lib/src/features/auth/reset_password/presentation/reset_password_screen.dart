import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ifiranz_client/src/features/auth/reset_password/application/reset_password_notifier.dart';
import 'package:ifiranz_client/src/features/auth/reset_password/domain/reset_password_request.dart';
import 'package:ifiranz_client/src/features/auth/reset_password/shared/providers.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_constants.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';

import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../../../core/infrastructure/utils/common_import.dart';
import '../../../core/presentation/widgets/common_textfield.dart';
import '../../../core/shared/providers.dart';

@RoutePage()
class ResetPasswordScreen extends StatefulHookConsumerWidget {
  final ResetPasswordRequest request;
  final bool isPhoneNumber;
  const ResetPasswordScreen(
      {required this.request, required this.isPhoneNumber, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final passwordFocusNode = useFocusNode();
    final confirmPasswordFocusNode = useFocusNode();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

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
          successully: () {
            AutoRouter.of(context).push(const MainAppRoute());
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
                          context.locale.resetPasswordScreenCreateNewpassword,
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
                          context.locale.resetPasswordScreenTitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      gapH32,
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
                      gapH32,
                      ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();

                          if (_formKey.currentState!.validate()) {
                            final progress = ProgressHUD.of(_);
                            progress?.show();
                            if (widget.isPhoneNumber) {
                              ref
                                  .read(resetPasswordNotifierProvider.notifier)
                                  .resetPasswordWithPhoneNumber(widget.request
                                      .copyWith(
                                          password:
                                              passwordController.text.trim()))
                                  .then((value) => progress!.dismiss())
                                  .whenComplete(() => progress!.dismiss());
                            } else {
                              ref
                                  .read(resetPasswordNotifierProvider.notifier)
                                  .resetPasswordWithEmail(widget.request
                                      .copyWith(
                                          password:
                                              passwordController.text.trim()))
                                  .then((value) => progress!.dismiss())
                                  .whenComplete(() => progress!.dismiss());
                            }
                          }
                        },
                        child: Text(context.locale.resetPassword),
                      ),
                      gapH32,
                    ],
                  ),
                ));
          })),
    );
  }
}

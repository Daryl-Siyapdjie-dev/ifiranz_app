import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../../../../router/app_router.dart';
import '../../../core/infrastructure/constants/app_sizes.dart';
import '../../../core/infrastructure/extensions/localization_extension.dart';
import '../../../core/infrastructure/services/local/shared_pref.dart';
import '../../../core/infrastructure/utils/api_constants.dart';
import '../../../core/infrastructure/utils/common_import.dart';
import '../../../core/presentation/themes/app_colors.dart';
import '../../../core/presentation/widgets/common_textfield.dart';
import '../../../core/shared/providers.dart';
import '../domain/add_client_request.dart';
import '../shared/providers.dart';

@RoutePage()
class RegisterAdditionalInfoScreen extends StatefulHookConsumerWidget {
  const RegisterAdditionalInfoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegisterAdditionalInfoScreenState();
}

class _RegisterAdditionalInfoScreenState
    extends ConsumerState<RegisterAdditionalInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nomController = useTextEditingController();
    final prenomController = useTextEditingController();
    final adresseController = useTextEditingController();
    final localisationGpsController = useTextEditingController();

    final nomFocusNode = useFocusNode();
    final prenomFocusNode = useFocusNode();
    final adresseFocusNode = useFocusNode();
    final localisationGpsFocusNode = useFocusNode();

    ref.listen(
      additionalInfoNotifierProvider,
      (previous, next) {
        next.maybeMap(
            orElse: () {},
            error: (error) {
              Flushbar(
                message: error.error.toString(),
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
            data: (_) {
              SharedPref.clearHasEndAccountCreationPhone();
              AutoRouter.of(context).pushAndPopUntil(const MainAppRoute(),
                  predicate: (predicate) => false);
            });
      },
    );

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Scaffold(
                appBar: AppBar(
                    title: Text(context.locale.registerAdditionnalInfoScreen)),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        gapH20,
                        CommonTextFormField(
                          controller: nomController,
                          focusNode: nomFocusNode,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          isLabelRequired: true,
                          hasLabel: true,
                          hintText: context.locale.name,
                          label: context.locale.name,
                          validator: (value) => ref
                              .read(formValidationServiceProvider)
                              .validateSimple(value),
                        ),
                        gapH20,
                        CommonTextFormField(
                          controller: prenomController,
                          focusNode: prenomFocusNode,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          isLabelRequired: true,
                          hasLabel: true,
                          hintText: context.locale.lastname,
                          label: context.locale.lastname,
                          validator: (value) => ref
                              .read(formValidationServiceProvider)
                              .validateSimple(value),
                        ),
                        gapH20,
                        CommonTextFormField(
                          controller: adresseController,
                          focusNode: adresseFocusNode,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          isLabelRequired: true,
                          hasLabel: true,
                          hintText: context.locale.address,
                          label:
                              context.locale.registerAdditionnalAddressDistrict,
                          validator: (value) => ref
                              .read(formValidationServiceProvider)
                              .validateSimple(value),
                        ),
                        gapH20,
                        CommonTextFormField(
                          controller: localisationGpsController,
                          focusNode: localisationGpsFocusNode,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          isLabelRequired: true,
                          hasLabel: true,
                          hintText: context
                              .locale.registerAdditionnalLocationNeighborhood,
                          label: context.locale.registerAdditionnalLocation,
                          validator: (value) => ref
                              .read(formValidationServiceProvider)
                              .validateSimple(value),
                        ),
                        gapH20,
                        ElevatedButton(
                          onPressed: () => _registerAdditionalInfo(
                              _,
                              AddClientRequest(
                                  adresse: adresseController.text.trim(),
                                  nom: nomController.text.trim(),
                                  prenom: prenomController.text.trim(),
                                  phoneNumber: SharedPref
                                      .getHasEndAccountCreationPhone()!,
                                  localisationGps:
                                      localisationGpsController.text.trim(),
                                  user: SharedPref.getEmail()!)),
                          child: Text(context.locale.submit),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })));
  }

  void _registerAdditionalInfo(BuildContext context, AddClientRequest request) {
    if (_formKey.currentState!.validate()) {}

    final progress = ProgressHUD.of(context);
    progress?.show();

    ref
        .read(additionalInfoNotifierProvider.notifier)
        .registerUserAdditionalInfo(request: request)
        .then((value) {})
        .whenComplete(() {
      progress!.dismiss();
    });
  }
}

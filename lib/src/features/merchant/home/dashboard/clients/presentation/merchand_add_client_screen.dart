import 'package:auto_route/auto_route.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ifiranz_client/src/features/auth/register/domain/add_merchant_client_request.dart';
import 'package:ifiranz_client/src/features/auth/register/shared/providers.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/string_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/common_textfield.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/phone_number_textfield.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';
import 'package:ifiranz_client/src/features/merchant/core/presentation/widget/order_drawer_widget.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/clients/shared/providers.dart';

import '../../../../../core/infrastructure/services/local/shared_pref.dart';
import '../../../../../core/infrastructure/utils/common_import.dart';

@RoutePage()
class CreateMerchandAddScreen extends StatefulHookConsumerWidget {
  const CreateMerchandAddScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateMerchandAddScreenState();
}

class _CreateMerchandAddScreenState
    extends ConsumerState<CreateMerchandAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffold = GlobalKey<ScaffoldState>();
  String _phoneCode = "00237";

  @override
  Widget build(BuildContext context) {
    final nomController = useTextEditingController();
    final emailController = useTextEditingController();
    final prenomController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    final adresseController = useTextEditingController();
    final localisationGpsController = useTextEditingController();

    final nomFocusNode = useFocusNode();
    final emailFocusNode = useFocusNode();
    final prenomFocusNode = useFocusNode();
    final phoneNumberFocusNode = useFocusNode();
    final adresseFocusNode = useFocusNode();
    final localisationGpsFocusNode = useFocusNode();

    ref.listen(
      additionalInfoNotifierProvider,
      (previous, next) {
        next.maybeMap(
            orElse: () {},
            error: (error) {
              showErrorFlushbar(context, error.error.toString());
            },
            data: (res) {
              ref
                  .read(merchandClientsNotifierProvider.notifier)
                  .createClient(res.value);

              showSuccessFlushbar(
                  context, context.locale.merchandAddCientScreenAddSucces);
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
                key: _scaffold,
                drawer: const OrdinaryDrawerWidget(),
                appBar: CustomMarchandAppBar(
                  title: context.locale.addClient,
                  scaffoldKey: _scaffold,
                  actionnable: true,
                ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            controller: emailController,
                            focusNode: emailFocusNode,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.text,
                            isLabelRequired: true,
                            hasLabel: true,
                            hintText: 'Email',
                            label: 'Email',
                            validator: (value) => ref
                                .read(formValidationServiceProvider)
                                .validateEmail(value),
                          ),
                          gapH20,
                          CommonTextFormField(
                            controller: prenomController,
                            focusNode: prenomFocusNode,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.text,
                            isLabelRequired: true,
                            hasLabel: true,
                            hintText: context.locale.surname,
                            label: context.locale.surname,
                            validator: (value) => ref
                                .read(formValidationServiceProvider)
                                .validateSimple(value),
                          ),
                          gapH20,
                          PhoneNumberTextFormField(
                            phoneNumberController: phoneNumberController,
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
                                setState(() {
                                  _phoneCode = phoneCode;
                                });
                              }
                            },
                          ),
                          gapH20,
                          CommonTextFormField(
                            controller: adresseController,
                            focusNode: adresseFocusNode,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.text,
                            isLabelRequired: true,
                            hasLabel: true,
                            label: context.locale.address,
                            hintText: context
                                .locale.registerAdditionnalAddressDistrict,
                            validator: (value) => ref
                                .read(formValidationServiceProvider)
                                .validateSimple(value),
                          ),
                          gapH20,
                          CommonTextFormField(
                            controller: localisationGpsController,
                            focusNode: localisationGpsFocusNode,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                                AddMerchantClientRequest(
                                  name: nomController.text.trim(),
                                  email: emailController.text.trim(),
                                  phone: _phoneCode.replaceAll('+', '00') +
                                      phoneNumberController.text
                                          .trim()
                                          .removeAllSpace(),
                                  marchant: SharedPref.getLocalUser()!,
                                )),
                            child: Text(context.locale.submit),
                          ),
                        ]),
                  ),
                ),
              );
            })));
  }

  void _registerAdditionalInfo(
      BuildContext context, AddMerchantClientRequest request) {
    if (_formKey.currentState!.validate()) {}

    final progress = ProgressHUD.of(context);
    progress?.show();

    ref
        .read(additionalInfoNotifierProvider.notifier)
        .addCustomer(request: request)
        .then((value) {})
        .whenComplete(() {
      progress!.dismiss();
    });
  }
}

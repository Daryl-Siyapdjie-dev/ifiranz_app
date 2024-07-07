import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import '../../../auth/core/shared/provider.dart';
import '../../../core/domain/paginated_request.dart';
import '../../../core/infrastructure/constants/app_sizes.dart';
import '../../../core/infrastructure/extensions/localization_extension.dart';
import '../../../core/presentation/themes/app_colors.dart';
import '../../../core/presentation/widgets/app_bars.dart';
import '../../../core/presentation/widgets/common_textfield.dart';
import '../../../core/presentation/widgets/toats.dart';
import '../../../core/shared/providers.dart';
import '../domain/add_colis_request.dart';
import '../../core/presentation/widget/order_drawer_widget.dart';
import '../../products/shared/types_providers.dart';
import 'package:libphonenumber/libphonenumber.dart';

import '../../../client/home/domain/quartier.dart';
import '../../../client/home/shared/providers.dart';
import '../../../core/infrastructure/utils/common_import.dart';
import '../../../core/presentation/widgets/phone_number.dart';
import '../shared/colis_providers.dart';

@RoutePage()
class CreateNewColisScreen extends StatefulHookConsumerWidget {
  const CreateNewColisScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateNewColisScreenState();
}

class _CreateNewColisScreenState extends ConsumerState<CreateNewColisScreen> {
  PaginatedRequest params = PaginatedRequest(page: 0, size: 40);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Quartier? quartier;

  @override
  void initState() {
    ref.read(merchandTypesNotifierProvider.notifier).getAllTypes(params);
    ref.read(findQuartierPoductsProvider.notifier).findProductQuartier();

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final name = useTextEditingController();
    final nameFocus = useFocusNode();

    final clientName = useTextEditingController();
    final clientNameFocus = useFocusNode();

    final clientPhone = useTextEditingController();
    final clientPhoneFocus = useFocusNode();
    final isoCode = useTextEditingController();

    final localisationGps = useTextEditingController();
    final localisationGpsFocus = useFocusNode();

    final description = useTextEditingController();
    final descriptionFocus = useFocusNode();

    final dueAmount = useTextEditingController();
    final dueAmountFocus = useFocusNode();

    final price = useTextEditingController();
    final priceFocus = useFocusNode();

    final allQuartier = ref.watch(findQuartierPoductsProvider);

    final merchand = ref.watch(currentMarchandNotifierProvider);

    ref.listen(merchandColisNotifierProvider, (prev, next) {
      next.maybeWhen(
          orElse: () => null,
          data: (res) {
            if (res.actionError is String && !res.isActionLoading) {
              return showErrorFlushbar(context, res.actionError!);
            } else if (res.actionError == null && !res.isActionLoading) {
              showSuccessFlushbar(context, 'Operation successful')
                  .then((value) => context.popRoute());
            }
          },
          error: (e, s) {
            showErrorFlushbar(context, e.toString());
          });
    });

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Scaffold(
                key: _scaffoldKey,
                drawer: const OrdinaryDrawerWidget(),
                appBar: CustomMarchandAppBar(
                  title: 'Create new colis',
                  scaffoldKey: _scaffoldKey,
                  actionnable: true,
                ),
                body: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 23),
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            gapH10,
                            gapH4,
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonTextFormField(
                                    controller: clientName,
                                    focusNode: clientNameFocus,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    hintText: 'Client name',
                                    textInputAction: TextInputAction.done,
                                    textInputType: TextInputType.text,
                                    isLabelRequired: true,
                                    hasLabel: true,
                                    validator: ref
                                        .read(formValidationServiceProvider)
                                        .validateSimple,
                                    label: 'Client name',
                                    obscureText: false,
                                  ),
                                  gapH20,
                                  PhoneNumberWidget(
                                      controller: clientPhone,
                                      isoCode: isoCode),
                                  gapH20,
                                  CommonTextFormField(
                                    controller: name,
                                    focusNode: nameFocus,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    hintText: context.locale.designation,
                                    textInputAction: TextInputAction.done,
                                    textInputType: TextInputType.text,
                                    isLabelRequired: true,
                                    hasLabel: true,
                                    validator: ref
                                        .read(formValidationServiceProvider)
                                        .validateSimple,
                                    label: context.locale.designation,
                                    obscureText: false,
                                  ),
                                  gapH20,
                                  RichText(
                                    text: TextSpan(
                                        text: context.locale
                                            .foodDetailsScreenSelectQuartier,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,
                                              color: AppColors.greyLight,
                                            ),
                                        children: [
                                          TextSpan(
                                            text: ' *',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: AppColors.alertError,
                                                ),
                                          )
                                        ]),
                                  ),
                                  gapH4,
                                  allQuartier.maybeWhen(
                                    orElse: () => Container(),
                                    error: (e, s) => IconButton(
                                        onPressed: () => ref
                                            .read(merchandTypesNotifierProvider
                                                .notifier)
                                            .getAllTypes(params),
                                        icon: const Icon(Icons.refresh)),
                                    loading: () =>
                                        const LinearProgressIndicator(),
                                    data: (res) => res.data.isEmpty
                                        ? Container()
                                        : CustomDropdown<
                                            Quartier>.searchRequest(
                                            futureRequest: ref
                                                .watch(
                                                    productsRepositoryProvider)
                                                .findFilterAllQuartierByPatter,
                                            decoration:
                                                const CustomDropdownDecoration(
                                                    closedShadow: [
                                                  BoxShadow(
                                                      color: Colors.white,
                                                      spreadRadius: 3),
                                                ],
                                                    closedFillColor: AppColors
                                                        .bgGreyContainer),
                                            hintText: context.locale
                                                .foodDetailsScreenSelectQuartier,
                                            headerBuilder: (context, val) =>
                                                Text("${val.designation}"),
                                            items: allQuartier.value?.data
                                                .map((e) => e as Quartier)
                                                .toList(),
                                            listItemBuilder:
                                                (context, q, val, func) =>
                                                    Text('${q.designation}'),
                                            onChanged: (value) {
                                              quartier = value;
                                              setState(() {});
                                            },
                                          ),
                                  ),
                                ]),
                            gapH20,
                            CommonTextFormField(
                              controller: price,
                              focusNode: priceFocus,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              hintText:
                                  context.locale.createNewColisScreenDueAmount,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.text,
                              isLabelRequired: true,
                              hasLabel: true,
                              validator: ref
                                  .read(formValidationServiceProvider)
                                  .validateNumber,
                              label:
                                  context.locale.createNewColisScreenDueAmount,
                              obscureText: false,
                            ),
                            // gapH20,
                            // CommonTextFormField(
                            //   controller: localisationGps,
                            //   focusNode: localisationGpsFocus,
                            //   autovalidateMode:
                            //       AutovalidateMode.onUserInteraction,
                            //   hintText: context
                            //       .locale.foodDetailsScreenAddGPSLocation,
                            //   textInputAction: TextInputAction.done,
                            //   textInputType: TextInputType.text,
                            //   isLabelRequired: true,
                            //   hasLabel: true,
                            //   validator: ref
                            //       .read(formValidationServiceProvider)
                            //       .validateSimple,
                            //   label: context
                            //       .locale.foodDetailsScreenAddGPSLocation,
                            //   obscureText: false,
                            // ),
                            gapH20,
                            CommonTextFormField(
                              controller: description,
                              maxLines: 7,
                              minLines: 5,
                              focusNode: descriptionFocus,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              hintText: "Description",
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.text,
                              isLabelRequired: true,
                              hasLabel: true,
                              validator: ref
                                  .read(formValidationServiceProvider)
                                  .validateSimple,
                              label: "Description",
                              obscureText: false,
                            ),
                            gapH20,
                          ],
                        )),
                    gapH20,
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12)),
                        onPressed: () {
                          FocusScope.of(context).unfocus();

                          if (_formKey.currentState!.validate() &&
                              quartier != null &&
                              merchand.hasValue) {
                            PhoneNumberUtil.normalizePhoneNumber(
                              isoCode: isoCode.text.trim(),
                              phoneNumber: clientPhone.text.trim(),
                            ).then((phone) {
                              final progress = ProgressHUD.of(_);
                              progress?.show();

                              ref
                                  .read(merchandColisNotifierProvider.notifier)
                                  .createColis(
                                    AddColisRequest(
                                      designation: name.text.trim(),
                                      clientName: clientName.text.trim(),
                                      clientPhone: phone!,
                                      quartier: quartier!,
                                      modePayement: 'Cash',
                                      localisationGps: null,
                                      description: description.text.trim(),
                                      dueAmount:
                                          double.parse(price.text.trim()),
                                    ),
                                  )
                                  .whenComplete(() => progress?.dismiss());
                            });
                          }
                        },
                        child: const Text('Submit')),
                    gapH20
                  ],
                ),
              );
            })));
  }
}

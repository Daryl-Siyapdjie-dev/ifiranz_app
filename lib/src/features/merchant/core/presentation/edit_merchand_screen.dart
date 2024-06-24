import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ifiranz_client/src/features/auth/core/shared/provider.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/core/domain/enum.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/media_query_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/common_textfield.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';
import 'package:ifiranz_client/src/features/merchant/core/shared/provider.dart';
import 'package:ifiranz_client/src/features/merchant/products/infrastructure/services/image_picker_service.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/infrastructure/utils/common_import.dart';

@RoutePage()
class EditMerchandScreen extends StatefulHookConsumerWidget {
  const EditMerchandScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditMerchandScreenState();
}

class _EditMerchandScreenState extends ConsumerState<EditMerchandScreen> {
  final _formKey = GlobalKey<FormState>();

  File? _profile;
  @override
  Widget build(BuildContext context) {
    final merchand = ref.watch(currentMarchandNotifierProvider);
    final merchandFinded =
        ref.watch(findMarchandByIdProvider(merchand.value!.id!));
    final designation =
        useTextEditingController(text: merchand.value?.designation);
    final designationFocus = useFocusNode();
    final adresse = useTextEditingController(text: merchand.value?.adresse);
    final adresseFocus = useFocusNode();
    final telOne = useTextEditingController(text: merchand.value?.telephone1);
    final telOneFocus = useFocusNode();
    final telTwo = useTextEditingController(text: merchand.value?.telephone2);
    final telTwoFocus = useFocusNode();
    final type = useTextEditingController(text: merchand.value?.type);

    ref.listen(merchandNotifierProvider, (prev, next) {
      next.maybeWhen(
          orElse: () => null,
          successully: () {
            ref
                .read(currentMarchandNotifierProvider.notifier)
                .getCurrentMarchand();
            showSuccessFlushbar(context, 'Operation successful');
          },
          failed: (e) {
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
                appBar: simpleBackAndTextAppBar('Edit Info'),
                body: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 23),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40 - 24),
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              width: context.proportionnalHeight(86),
                              height: context.proportionnalHeight(86),
                              child: !merchand.hasValue && _profile is! File
                                  ? Container()
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: _profile is File
                                          ? Image.file(_profile!)
                                          : CachedNetworkImage(
                                              imageUrl: merchand.value?.url ??
                                                  "http://via.placeholder.com/350x150",
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        value: downloadProgress
                                                            .progress),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                    ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: SizedBox(
                                width: 27,
                                height: 27,
                                child: IconButton.filled(
                                  padding: EdgeInsets.zero,
                                  style: IconButton.styleFrom(
                                      backgroundColor: AppColors.greyLight),
                                  onPressed: () {
                                    showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (ctx) => Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16),
                                                    topRight:
                                                        Radius.circular(16))),
                                            child: SingleChildScrollView(
                                                child: Column(children: [
                                              ListTile(
                                                onTap: () async {
                                                  ref
                                                      .read(
                                                          imagePickerServiceProvider)
                                                      .pickImage(
                                                          ImageSource.camera)
                                                      .then((value) {
                                                    if (value is! File) return;
                                                    Navigator.of(context).pop();

                                                    final progress =
                                                        ProgressHUD.of(_);

                                                    progress?.show();

                                                    ref
                                                        .read(
                                                            merchandNotifierProvider
                                                                .notifier)
                                                        .updateProfile(
                                                            id: merchand
                                                                .value!.id!,
                                                            image: value)
                                                        .whenComplete(() {
                                                      progress?.dismiss();
                                                      setState(() {
                                                        _profile = value;
                                                      });
                                                    });
                                                  });
                                                },
                                                leading: const Icon(
                                                    CupertinoIcons.camera_fill,
                                                    color: AppColors
                                                        .greyTextTitleColor),
                                                title: const Text(
                                                  "Take a picture",
                                                  style: TextStyle(
                                                    color: AppColors
                                                        .greyTextTitleColor,
                                                  ),
                                                ),
                                              ),
                                              ListTile(
                                                onTap: () async {
                                                  ref
                                                      .read(
                                                          imagePickerServiceProvider)
                                                      .pickImage(
                                                          ImageSource.gallery)
                                                      .then((value) {
                                                    if (value is! File) return;
                                                    Navigator.of(context).pop();

                                                    final progress =
                                                        ProgressHUD.of(_);
                                                    progress?.show();
                                                    ref
                                                        .read(
                                                            merchandNotifierProvider
                                                                .notifier)
                                                        .updateProfile(
                                                            id: merchand
                                                                .value!.id!,
                                                            image: value)
                                                        .whenComplete(() {
                                                      setState(() {
                                                        _profile = value;
                                                      });

                                                      progress?.dismiss();
                                                    });
                                                  });
                                                },
                                                leading: const Icon(
                                                    CupertinoIcons.photo,
                                                    color: AppColors
                                                        .greyTextTitleColor),
                                                title: const Text(
                                                  "Pick from gallery",
                                                  style: TextStyle(
                                                    color: AppColors
                                                        .greyTextTitleColor,
                                                  ),
                                                ),
                                              ),
                                              gapH20
                                            ]))));
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            gapH10,
                            gapH20,
                            CommonTextFormField(
                              controller: designation,
                              focusNode: designationFocus,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              hintText: 'Designation',
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.text,
                              isLabelRequired: true,
                              hasLabel: true,
                              validator: ref
                                  .read(formValidationServiceProvider)
                                  .validateSimple,
                              label: 'Designation',
                              obscureText: false,
                            ),
                            gapH20,
                            CommonTextFormField(
                              controller: telOne,
                              focusNode: telOneFocus,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              hintText: 'Tel1',
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.number,
                              isLabelRequired: true,
                              hasLabel: true,
                              validator: ref
                                  .read(formValidationServiceProvider)
                                  .validateNumber,
                              label: 'Tel1',
                              obscureText: false,
                            ),
                            gapH20,
                            CommonTextFormField(
                              controller: telTwo,
                              focusNode: telTwoFocus,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              hintText: 'Tel2',
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.number,
                              isLabelRequired: true,
                              hasLabel: true,
                              label: 'Tel2',
                              obscureText: false,
                            ),
                            gapH20,
                            CommonTextFormField(
                              controller: adresse,
                              focusNode: adresseFocus,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              hintText: 'Address',
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.text,
                              isLabelRequired: true,
                              hasLabel: true,
                              validator: ref
                                  .read(formValidationServiceProvider)
                                  .validateSimple,
                              label: 'Address',
                              obscureText: false,
                            ),
                            gapH20,
                            CustomDropdown(
                              hintText: 'Type de marchant',
                              validator: ref
                                  .read(formValidationServiceProvider)
                                  .validateSimple,
                              decoration: CustomDropdownDecoration(
                                  closedShadow: [
                                    const BoxShadow(
                                        color: Colors.white, spreadRadius: 5),
                                  ],
                                  closedBorder:
                                      Border.all(color: AppColors.bgGreyD),
                                  closedBorderRadius: BorderRadius.circular(8),
                                  hintStyle: Theme.of(context)
                                      .inputDecorationTheme
                                      .hintStyle,
                                  listItemStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                  headerStyle: GoogleFonts.urbanist(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                            color: AppColors.blackColor,
                                          )
                                          .color),
                                  closedFillColor: Theme.of(context)
                                      .inputDecorationTheme
                                      .fillColor),
                              items: MerchantTypes.values
                                  .map((e) => e.value)
                                  .toList(),
                              onChanged: (e) {
                                type.text = e;
                                setState(() {});
                              },
                            ),
                          ],
                        ))
                  ],
                ),
                bottomNavigationBar: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10)),
                      onPressed: merchandFinded.isLoading
                          ? null
                          : () async {
                              if (_formKey.currentState!.validate() &&
                                  merchandFinded.hasValue &&
                                  merchand.hasValue) {
                                final progress = ProgressHUD.of(_);
                                progress?.show();

                                ref
                                    .read(merchandNotifierProvider.notifier)
                                    .update(merchandFinded.value!.copyWith(
                                      designation: designation.text.trim(),
                                      type: type.text.trim(),
                                      telephone1: telOne.text.trim(),
                                      telephone2: telTwo.text.trim(),
                                    ))
                                    .whenComplete(() => progress?.dismiss());
                              } else if (merchandFinded.hasError) {
                                return ref.refresh(findMarchandByIdProvider(
                                        merchand.value!.id!)
                                    .future);
                              }
                            },
                      child: const Text('Submit')),
                ),
              );
            })));
  }
}

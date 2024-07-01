import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ifiranz_client/src/features/auth/core/shared/provider.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/media_query_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/common_textfield.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';
import 'package:ifiranz_client/src/features/merchant/core/presentation/widget/order_drawer_widget.dart';
import 'package:ifiranz_client/src/features/merchant/products/domain/type/type_response.dart';
import 'package:ifiranz_client/src/features/merchant/products/infrastructure/services/image_picker_service.dart';
import 'package:ifiranz_client/src/features/merchant/products/shared/products_providers.dart';
import 'package:ifiranz_client/src/features/merchant/products/shared/types_providers.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/infrastructure/utils/common_import.dart';

@RoutePage()
class CreateNewProductScreen extends StatefulHookConsumerWidget {
  const CreateNewProductScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateNewProductScreenState();
}

class _CreateNewProductScreenState extends ConsumerState<CreateNewProductScreen> {
  PaginatedRequest params = PaginatedRequest(page: 0, size: 40);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    ref.read(merchandTypesNotifierProvider.notifier).getAllTypes(params);

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final name = useTextEditingController();
    final nameFocus = useFocusNode();
    final codeFocus = useFocusNode();
    final price = useTextEditingController();
    final priceFocus = useFocusNode();

    final type = useState<TypeResponse?>(null);
    final image = useState<File?>(null);

    final types = ref.watch(merchandTypesNotifierProvider);

    final merchand = ref.watch(currentMarchandNotifierProvider);

    ref.listen(merchandProductsNotifierProvider, (prev, next) {
      next.maybeWhen(
          orElse: () => null,
          data: (res) {
            if (res.actionError is String && !res.isActionLoading) {
              return showErrorFlushbar(context, res.actionError!);
            } else if (res.actionError == null && !res.isActionLoading) {
              showSuccessFlushbar(context, 'Operation successful').then((value) => context.popRoute());
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
                  title: 'Create new product',
                  scaffoldKey: _scaffoldKey,
                  actionnable: true,
                ),
                body: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 23),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40 - 24),
                      child: Row(
                        children: [
                          Container(
                            width: context.proportionnalHeight(106),
                            height: context.proportionnalHeight(76),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.bgGreyLike),
                            child: image.value is File
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      image.value!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : SvgPicture.asset('assets/images/line-md_image.svg'),
                          ),
                          gapW25,
                          SizedBox(
                            width: 27,
                            height: 27,
                            child: IconButton.filled(
                              padding: EdgeInsets.zero,
                              style: IconButton.styleFrom(backgroundColor: AppColors.greyLight),
                              onPressed: () {
                                showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (_) => Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  onTap: () async {
                                                    ref.read(imagePickerServiceProvider).pickImage(ImageSource.camera).then((value) {
                                                      image.value = value;
                                                      Navigator.of(context).pop();
                                                    });
                                                  },
                                                  leading: const Icon(CupertinoIcons.camera_fill, color: AppColors.greyTextTitleColor),
                                                  title: const Text(
                                                    "Take a picture",
                                                    style: TextStyle(
                                                      color: AppColors.greyTextTitleColor,
                                                    ),
                                                  ),
                                                ),
                                                ListTile(
                                                  onTap: () async {
                                                    ref.read(imagePickerServiceProvider).pickImage(ImageSource.gallery).then((value) {
                                                      image.value = value;
                                                      Navigator.of(context).pop();
                                                    });
                                                  },
                                                  leading: const Icon(CupertinoIcons.photo_fill, color: AppColors.greyTextTitleColor),
                                                  title: const Text(
                                                    "Chose in gallery",
                                                    style: TextStyle(
                                                      color: AppColors.greyTextTitleColor,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 20)
                                              ],
                                            ),
                                          ),
                                        ));
                              },
                              icon: const Icon(Icons.add),
                            ),
                          )
                        ],
                      ),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            gapH10,
                            // Row(
                            //   children: [
                            //     const Spacer(),
                            //     Expanded(
                            //       child: ElevatedButton(
                            //           style: ElevatedButton.styleFrom(
                            //               padding: const EdgeInsets.symmetric(
                            //                   vertical: 6, horizontal: 0)),
                            //           onPressed: () {
                            //             context.pushRoute(
                            //                 const ManageTypesRoute());
                            //           },
                            //           child: const Text('Manage Types')),
                            //     ),
                            //   ],
                            // ),
                            gapH4,
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              RichText(
                                text: TextSpan(
                                    text: 'Type product',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                          color: AppColors.greyLight,
                                        ),
                                    children: [
                                      TextSpan(
                                        text: ' *',
                                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                              color: AppColors.alertError,
                                            ),
                                      )
                                    ]),
                              ),
                              gapH4,
                              types.maybeWhen(
                                  orElse: () => Container(),
                                  error: (e, s) => IconButton(
                                      onPressed: () => ref.read(merchandTypesNotifierProvider.notifier).getAllTypes(params),
                                      icon: const Icon(Icons.refresh)),
                                  loading: () => const LinearProgressIndicator(),
                                  data: (res) => res.data.isEmpty
                                      ? Container()
                                      : CustomDropdown<TypeResponse>.search(
                                          hintText: 'Type',
                                          decoration: CustomDropdownDecoration(
                                              closedShadow: [
                                                const BoxShadow(color: Colors.white, spreadRadius: 5),
                                              ],
                                              closedBorder: Border.all(color: AppColors.bgGreyD),
                                              closedBorderRadius: BorderRadius.circular(8),
                                              hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                                              headerStyle: GoogleFonts.urbanist(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium!
                                                      .copyWith(
                                                        color: AppColors.blackColor,
                                                      )
                                                      .color),
                                              closedFillColor: Theme.of(context).inputDecorationTheme.fillColor),
                                          items: res.data as List<TypeResponse>,
                                          listItemBuilder: (context, q, val, func) => Text(q.designation),
                                          headerBuilder: (context, val) => Text(val.designation),
                                          onChanged: (elt) {
                                            setState(() {
                                              type.value = elt;
                                            });
                                          })),
                            ]),
                            gapH20,
                            CommonTextFormField(
                              controller: name,
                              focusNode: nameFocus,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              hintText: 'Name',
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.text,
                              isLabelRequired: true,
                              hasLabel: true,
                              validator: ref.read(formValidationServiceProvider).validateSimple,
                              label: 'Name',
                              obscureText: false,
                            ),
                            gapH20,
                            CommonTextFormField(
                              controller: price,
                              focusNode: priceFocus,
                              prefixIcon: const Padding(
                                padding: EdgeInsets.only(top: 14, left: 10),
                                child: Text('XAF'),
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              hintText: 'Price',
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.number,
                              isLabelRequired: true,
                              hasLabel: true,
                              validator: ref.read(formValidationServiceProvider).validateNumber,
                              label: 'Price',
                              obscureText: false,
                            ),
                          ],
                        )),
                    gapH20,
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (image.value is! File) {
                            showErrorFlushbar(context, 'Image is required');
                          }

                          if (_formKey.currentState!.validate() && image.value is File && type.value != null && merchand.hasValue) {
                            final progress = ProgressHUD.of(_);
                            progress?.show();

                            ref
                                .read(merchandProductsNotifierProvider.notifier)
                                .createProduct(
                                    ProductModel(
                                      marchand: merchand.value!,
                                      type: ProductType.fromJson(type.value!.toJson()),
                                      designation: name.text.trim(),
                                      prix: num.parse(price.text.trim()),
                                      note: 0,
                                      rang: 0,
                                    ),
                                    image.value!)
                                .whenComplete(() => progress?.dismiss());
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

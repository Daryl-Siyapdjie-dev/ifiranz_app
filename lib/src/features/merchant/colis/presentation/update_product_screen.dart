import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ifiranz_client/src/features/auth/core/shared/provider.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/media_query_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/common_textfield.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';
import 'package:ifiranz_client/src/features/merchant/products/domain/type/type_response.dart';
import 'package:ifiranz_client/src/features/merchant/products/infrastructure/services/image_picker_service.dart';
import 'package:ifiranz_client/src/features/merchant/products/shared/products_providers.dart';
import 'package:ifiranz_client/src/features/merchant/products/shared/types_providers.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/infrastructure/utils/common_import.dart';
import '../../core/presentation/widget/order_drawer_widget.dart';

@RoutePage()
class UpdateProductScreen extends StatefulHookConsumerWidget {
  final ProductModel data;
  const UpdateProductScreen({
    super.key,
    required this.data,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends ConsumerState<UpdateProductScreen> {
  PaginatedRequest params = PaginatedRequest(page: 0, size: 40);

  @override
  void initState() {
    ref.read(merchandTypesNotifierProvider.notifier).getAllTypes(params);
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final name = useTextEditingController(text: widget.data.designation);
    final nameFocus = useFocusNode();
    final code = useTextEditingController(text: widget.data.code);
    final description = useTextEditingController(text: widget.data.description);
    final codeFocus = useFocusNode();
    final descriptionFocus = useFocusNode();
    final price = useTextEditingController(text: widget.data.prix?.toString());
    final priceFocus = useFocusNode();

    final image = useState<File?>(null);

    final types = ref.watch(merchandTypesNotifierProvider);

    final type = useState<TypeResponse?>(TypeResponse.fromJson(widget.data.type?.toJson() ?? {}));

    final productFinded = ref.watch(findByIdProductsNotifierProvider(widget.data.id!));

    ref.listen(merchandProductsNotifierProvider, (prev, next) {
      next.maybeWhen(
          orElse: () => null,
          data: (res) {
            if (res.actionError is String && !res.isActionLoading) {
              return showErrorFlushbar(context, res.actionError!);
            } else if (res.actionError == null && (res.actionError == null && prev?.value?.isActionLoading == true)) {
              showSuccessFlushbar(context, context.locale.operationSuccess).then((value) => context.popRoute());
            }
          },
          error: (e, s) {
            showErrorFlushbar(context, e.toString());
          });
    });

    return ProgressHUD(
        barrierEnabled: true,
        borderWidth: 0,
        child: Builder(builder: (_) {
          return Scaffold(
            key: _scaffoldKey,
            drawer: const OrdinaryDrawerWidget(),
            appBar: CustomMarchandAppBar(
              title: context.locale.merchandUpdateProdut,
              actionnable: true,
              scaffoldKey: _scaffoldKey,
            ),
            body: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: ListView(
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
                              : CachedNetworkImage(
                                  imageUrl: widget.data.url ?? "http://via.placeholder.com/350x150",
                                  progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                                    child: CircularProgressIndicator(value: downloadProgress.progress),
                                  ),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
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
                                                title: Text(
                                                  context.locale.takePicture,
                                                  style: const TextStyle(
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
                                                title: Text(
                                                  context.locale.chooseInGallery,
                                                  style: const TextStyle(
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
                          gapH4,
                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            RichText(
                              text: TextSpan(
                                  text: context.locale.merchandProductType,
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
                                        hintText: context.locale.merchandProductType,
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
                                        initialItem: type.value,
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
                            hintText: context.locale.name,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.text,
                            isLabelRequired: true,
                            hasLabel: true,
                            validator: ref.read(formValidationServiceProvider).validateSimple,
                            label: context.locale.name,
                            obscureText: false,
                          ),
                          gapH20,
                          CommonTextFormField(
                            controller: code,
                            focusNode: codeFocus,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            hintText: 'Code',
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.number,
                            isLabelRequired: true,
                            hasLabel: true,
                            validator: ref.read(formValidationServiceProvider).validateNumber,
                            label: 'Code',
                            obscureText: false,
                          ),
                          gapH20,
                          CommonTextFormField(
                            controller: description,
                            focusNode: descriptionFocus,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            hintText: 'Description',
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.number,
                            isLabelRequired: true,
                            minLines: 5,
                            maxLines: 9,
                            hasLabel: true,
                            label: 'Description',
                            obscureText: false,
                          ),
                          gapH20,
                          Row(
                            children: [
                              Expanded(
                                child: CommonTextFormField(
                                  controller: price,
                                  focusNode: priceFocus,
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.only(top: 14, left: 6),
                                    child: Text('XAF'),
                                  ),
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  hintText: context.locale.price,
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.number,
                                  isLabelRequired: true,
                                  hasLabel: true,
                                  validator: ref.read(formValidationServiceProvider).validateNumber,
                                  label: context.locale.price,
                                  obscureText: false,
                                ),
                              ),
                              const Spacer()
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 10)),
                  onPressed: productFinded.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();
                          final merchand = ref.read(currentMarchandNotifierProvider);

                          if (_formKey.currentState!.validate() && productFinded.hasValue && merchand.hasValue) {
                            final progress = ProgressHUD.of(_);
                            progress?.show();

                            ref
                                .read(merchandProductsNotifierProvider.notifier)
                                .updateProduct(
                                    productFinded.value!.copyWith(
                                        marchand: merchand.value!,
                                        type: ProductType.fromJson(type.value!.toJson()),
                                        designation: name.text.trim(),
                                        prix: num.parse(price.text.trim()),
                                        code: code.text.trim(),
                                        description: description.text.trim()),
                                    image.value)
                                .whenComplete(() => progress?.dismiss());
                          } else if (productFinded.hasError) {
                            return ref.refresh(findByIdProductsNotifierProvider(widget.data.id!).future);
                          }
                        },
                  child: Text(context.locale.submit)),
            ),
          );
        }));
  }
}

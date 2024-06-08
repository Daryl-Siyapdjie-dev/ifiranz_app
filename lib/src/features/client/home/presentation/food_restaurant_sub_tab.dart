import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/client/home/shared/providers.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/media_query_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/common_import.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/no_data.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/product_item.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/refeshing_indicator.dart';
import 'package:ifiranz_client/src/features/merchant/products/domain/type/type_response.dart';
import 'package:ifiranz_client/src/features/merchant/products/shared/types_providers.dart';
import 'package:url_launcher/url_launcher.dart';

// FIXME: Fix comments on this page
@RoutePage()
class FoodRestaurantScreen extends StatefulHookConsumerWidget {
  final Merchant marchant;

  const FoodRestaurantScreen({super.key, required this.marchant});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FoodRestaurantScreenState();
}

class _FoodRestaurantScreenState extends ConsumerState<FoodRestaurantScreen> {
  PaginatedRequest params = PaginatedRequest(page: 0, size: 7);

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     Future.microtask(() {
  //       ref.read(merchantProductNotifier.notifier).fetchProducts([
  //         FilterOptional(
  //             aliasKey: "marchand.user",
  //             key: "code",
  //             value: widget.marchant.user,
  //             type: "EQUAL")
  //       ], params);
  //     });
  //   });

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(merchantProductNotifier);
    final search = useTextEditingController();
    final controller = useScrollController();
    final filterSearchs = useState<List<FilterOptional>>([
      FilterOptional(
        aliasKey: "marchand.user",
        key: "code",
        value: widget.marchant.user,
        type: "EQUAL",
      ),
      FilterOptional(
          value: search.text, type: "LIKE", key: "designation", applyAnd: true),
    ]);

    // controller.addListener(() async {
    //   if (controller.position.maxScrollExtent == controller.position.pixels) {
    //     if (ref.watch(merchantProductNotifier).hasValue &&
    //         (ref.watch(merchantProductNotifier).value!.hasMore) &&
    //         !(ref.watch(merchantProductNotifier).value!.isLoadingMore)) {
    //       await ref.read(merchantProductNotifier.notifier).fetchProducts([
    //         FilterOptional(
    //             aliasKey: "marchand.user",
    //             key: "code",
    //             value: widget.marchant.user,
    //             type: "EQUAL")
    //       ], params.copyWith(page: params.page + 1), isMore: true).whenComplete(
    //           () {
    //         if (!(ref
    //             .watch(merchantProductNotifier)
    //             .value!
    //             .hasErrorOnLoadMore)) {
    //           setState(() {
    //             params = params.copyWith(page: params.page + 1);
    //           });
    //         }
    //       });
    //     }
    //   }
    // });

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Scaffold(
                appBar: const CustomAppBar(isHome: true),
                body: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  controller: controller,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(14),
                                bottomRight: Radius.circular(14)),
                            child: SizedBox(
                              height: context.proportionnalHeight(149),
                              width: double.infinity,
                              child: CachedNetworkImage(
                                imageUrl: widget.marchant.url ??
                                    "http://via.placeholder.com/350x150",
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.only(left: 12, top: 14),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.greyBackground),
                            child: InkWell(
                              onTap: context.popRoute,
                              child: const Icon(
                                Icons.arrow_back,
                                size: 16,
                              ),
                            )),
                      ],
                    ),
                    gapH6,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.marchant.designation ?? '',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          "info",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                    gapH6,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                'Location',
                                style: TextStyle(fontSize: 10),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    size: 14,
                                    Icons.place,
                                    color: AppColors.primaryColor,
                                  ),
                                  gapW4,
                                  Text(
                                    (widget.marchant.adresse ?? ""),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            color: AppColors.primaryColor,
                                            fontSize: 10),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                'Call now',
                                style: TextStyle(fontSize: 10),
                              ),
                              Column(
                                children: [
                                  if (widget.marchant.telephone1 != null) gapH6,
                                  if (widget.marchant.telephone1 != null)
                                    InkWell(
                                      onTap: () async {
                                        final Uri telLaunchUri = Uri(
                                          scheme: 'tel',
                                          path: widget.marchant.telephone1,
                                        );
                                        if (!await launchUrl(telLaunchUri)) {
                                          throw Exception(
                                              'Could not launch $telLaunchUri');
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            size: 14,
                                            Icons.phone,
                                            color: AppColors.secondaryColor,
                                          ),
                                          gapW4,
                                          Text(
                                            widget.marchant.telephone1 ?? "",
                                            style: const TextStyle(
                                                color: AppColors.secondaryColor,
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (widget.marchant.telephone2 != null) gapH6,
                                  if (widget.marchant.telephone2 != null)
                                    InkWell(
                                      onTap: () async {
                                        final Uri telLaunchUri = Uri(
                                          scheme: 'tel',
                                          path: widget.marchant.telephone2,
                                        );
                                        if (!await launchUrl(telLaunchUri)) {
                                          throw Exception(
                                              'Could not launch $telLaunchUri');
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            size: 14,
                                            Icons.phone,
                                            color: AppColors.secondaryColor,
                                          ),
                                          gapW4,
                                          Text(
                                            widget.marchant.telephone2 ?? "",
                                            style: const TextStyle(
                                                color: AppColors.secondaryColor,
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    gapH25,
                    Row(
                      children: [
                        Expanded(
                            child: TextField(
                          controller: search,
                          style: Theme.of(context).textTheme.bodyMedium,
                          onEditingComplete: () {
                            if (search.text.isEmpty) return;
                            FocusScope.of(context).unfocus();
                            final progress = ProgressHUD.of(_);
                            progress?.show();
                            // ref
                            //     .read(productNotifier.notifier)
                            //     .findProductByDesignation(filterSearchs.value
                            //         .map((element) =>
                            //             element.key == "designation"
                            //                 ? element.copyWith(
                            //                     value: search.text.trim())
                            //                 : element)
                            //         .toList())
                            //     .whenComplete(() async {
                            //   progress!.dismiss();
                            //   search.clear();
                            // });
                          },
                          decoration: InputDecoration(
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColors.greyTextColor),
                              prefixIcon: const Icon(Icons.search),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 9.5),
                              isDense: true,
                              hintText: 'Search product'),
                        )),
                        gapW18,
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.bgGreyIcon,
                              borderRadius: BorderRadius.circular(8)),
                          child: IconButton(
                              style: IconButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 11, horizontal: 14),
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => SearchFilterWidget(
                                          merchant: widget.marchant,
                                        ));
                              },
                              icon: SvgPicture.asset(
                                  'assets/icons/icon-park-outline_setting-config.svg')),
                        )
                      ],
                    ),
                    gapH10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Recommended Meals',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const Spacer(),
                          ],
                        ),
                        gapH8,
                        RefeshingIndicator(
                          isRefetching: products.isRefreshing ||
                              products.isLoading ||
                              products.isReloading,
                          child: products.when(
                              error: (error, _) => Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: SelectableText(error.toString()),
                                  )),
                              loading: () => SizedBox(
                                    height: context.screenHeight * .3,
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                              data: (response) {
                                return response.data.isEmpty
                                    ? const NoData(
                                        text: "No Data found",
                                      )
                                    : MasonryGridView.count(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: response.data.length,
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 16,
                                        crossAxisSpacing: 16,
                                        itemBuilder: (context, index) {
                                          return ProductItem(
                                              meal: response.data[index]);
                                        },
                                      );
                              }),
                        )
                      ],
                    ),
                    gapH16,
                    if (((ref.watch(merchantProductNotifier).value?.hasMore ??
                            false) ||
                        (ref
                                .watch(merchantProductNotifier)
                                .value
                                ?.isLoadingMore ??
                            false)))
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    if ((ref
                            .watch(merchantProductNotifier)
                            .value
                            ?.hasErrorOnLoadMore ??
                        false))
                      Center(
                        child: IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: () async {
                            // await ref
                            //     .read(merchantProductNotifier.notifier)
                            //     .fetchProducts([
                            //   FilterOptional(
                            //       aliasKey: "marchand.user",
                            //       key: "code",
                            //       value: widget.marchant.user ??
                            //           "marchand@gmail.com",
                            //       type: "EQUAL")
                            // ], params.copyWith(page: params.page + 1),
                            //         isMore: true).whenComplete(() {
                            //   if (!(ref
                            //       .watch(merchantProductNotifier)
                            //       .value!
                            //       .hasErrorOnLoadMore)) {
                            //     setState(() {
                            //       params =
                            //           params.copyWith(page: params.page + 1);
                            //     });
                            //   }
                            // });
                          },
                        ),
                      ),
                    gapH64
                  ],
                ),
              );
            })));
  }
}

class SearchFilterWidget extends ConsumerStatefulWidget {
  final Merchant merchant;
  const SearchFilterWidget({
    super.key,
    required this.merchant,
  });

  @override
  ConsumerState createState() => _SearchFilterWidgetState();
}

class _SearchFilterWidgetState extends ConsumerState<SearchFilterWidget> {
  PaginatedRequest params = PaginatedRequest(page: 0, size: 40);
  TypeResponse? type;
  Merchant? marchand;

  @override
  void initState() {
    ref.read(merchandTypesNotifierProvider.notifier).getAllTypes(params);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final types = ref.watch(merchandTypesNotifierProvider);

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Dialog(
                backgroundColor: AppColors.whiteColor,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Type de produits'),
                          gapH4,
                          types.maybeWhen(
                              orElse: () => Container(),
                              error: (e, s) => IconButton(
                                  onPressed: () => ref
                                      .read(merchandTypesNotifierProvider
                                          .notifier)
                                      .getAllTypes(params),
                                  icon: const Icon(Icons.refresh)),
                              loading: () => const LinearProgressIndicator(),
                              data: (res) => res.data.isEmpty
                                  ? Container()
                                  : CustomDropdown<TypeResponse>.search(
                                      hintText: 'Type de produits',
                                      decoration: CustomDropdownDecoration(
                                          closedShadow: [
                                            const BoxShadow(
                                                color: Colors.white,
                                                spreadRadius: 5),
                                          ],
                                          closedBorder: Border.all(
                                              color: AppColors.bgGreyD),
                                          closedBorderRadius:
                                              BorderRadius.circular(8),
                                          hintStyle: Theme.of(context)
                                              .inputDecorationTheme
                                              .hintStyle,
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
                                      items: res.data as List<TypeResponse>,
                                      listItemBuilder:
                                          (context, q, val, func) =>
                                              Text(q.designation),
                                      headerBuilder: (context, val) =>
                                          Text(val.designation),
                                      onChanged: (elt) {
                                        setState(() {
                                          type = elt;
                                        });
                                      })),
                          gapH12,
                          ElevatedButton(
                              onPressed: (type is! TypeResponse)
                                  ? null
                                  : () {
                                      FocusScope.of(context).unfocus();
                                      final progress = ProgressHUD.of(_);
                                      progress?.show();
                                      // ref
                                      //     .read(
                                      //         merchantProductNotifier.notifier)
                                      //     .findProductByDesignation([
                                      //   FilterOptional(
                                      //       aliasKey: "marchand.user",
                                      //       key: "code",
                                      //       value: widget.merchant.user ??
                                      //           "marchand@gmail.com",
                                      //       type: "EQUAL"),
                                      //   FilterOptional(
                                      //       type: "EQUAL",
                                      //       key: "code",
                                      //       value: type!.designation,
                                      //       aliasKey: "type.designation",
                                      //       applyAnd: true),
                                      // ]).whenComplete(() {
                                      //   progress!.dismiss();
                                      //   Navigator.of(context).pop();
                                      // });
                                    },
                              child: const Text('Search'))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })));
  }
}

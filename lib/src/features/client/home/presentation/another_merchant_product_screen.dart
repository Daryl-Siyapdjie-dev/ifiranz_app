import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../router/app_router.dart';
import '../../../core/domain/paginated_request.dart';
import '../../../core/domain/paginated_response.dart';
import '../../../core/infrastructure/constants/app_sizes.dart';
import '../../../core/infrastructure/extensions/localization_extension.dart';
import '../../../core/infrastructure/extensions/media_query_extension.dart';
import '../../../core/infrastructure/utils/common_import.dart';
import '../../../core/presentation/themes/app_colors.dart';
import '../../../core/presentation/widgets/app_bars.dart';
import '../../../core/presentation/widgets/no_data.dart';
import '../../../core/presentation/widgets/product_item.dart';
import '../../../core/presentation/widgets/product_skeleton.dart';
import '../../../core/presentation/widgets/refeshing_indicator.dart';
import '../domain/filter_optional.dart';
import '../domain/product_model.dart';
import '../shared/providers.dart';

@RoutePage()
class AnotherMerchantProductScreen extends StatefulHookConsumerWidget {
  final int merchantId;
  const AnotherMerchantProductScreen({super.key, required this.merchantId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AnotherMerchantProductScreenState();
}

class _AnotherMerchantProductScreenState
    extends ConsumerState<AnotherMerchantProductScreen> {
  PaginatedRequest params = PaginatedRequest(page: 0, size: 6);

  final List<FilterOptional> promotionRequests = [
    FilterOptional(
      key: 'inPromotion',
      value: true,
      type: "EQUAL",
    )
  ];
  final List<FilterOptional> requests = [
    FilterOptional(
      key: 'validationStatus',
      value: "ACCEPTED",
      type: "EQUAL",
      applyAnd: true,
    )
  ];

  final List<FilterOptional> filterRequest = [
    FilterOptional(
      key: 'validationStatus',
      value: "ACCEPTED",
      type: "EQUAL",
      applyAnd: true,
    )
  ];
  bool isAll = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _onTabsRouterChange();
    });
    super.initState();
  }

  Future _onTabsRouterChange() async {
    final localPage = PaginatedRequest(page: 0, size: 6);
    // await ref
    //     .read(promotionnalProductsNotifierProvider.notifier)
    //     .findPromotions(filterRequest);
    // if (isAll) {

    await ref.read(merchantProductNotifier.notifier).fetchMerchantProducts(
        requests, localPage, widget.merchantId.toString());
    // } else {
    //   await ref.read(getTop10ProductsProductsNotifier.notifier).fetchMerchantProducts();
    // }
    setState(() {
      params = localPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeIndex = useState(0);

    final pageContoller = usePageController(viewportFraction: .87);
    final controller = useScrollController();

    final products = ref.watch(merchantProductNotifier);
    final top10Products = ref.watch(getTop10ProductsProductsNotifier);

    final promotionProducts = ref
        .watch(promotionnalProductsNotifierProvider.notifier)
        .findPromotions(promotionRequests);

    useEffect(() {
      void pageChangeListener() {
        final currentPage = pageContoller.page?.round();
        if (currentPage is int && currentPage != pageContoller.page) {
          activeIndex.value = currentPage;
        }
      }

      pageContoller.addListener(pageChangeListener);

      return () {
        pageContoller.removeListener(pageChangeListener);
      };
    }, [pageContoller]);

    controller.addListener(() async {
      if (controller.position.maxScrollExtent == controller.position.pixels &&
          isAll) {
        if (ref.watch(merchantProductNotifier).hasValue &&
            (ref.watch(merchantProductNotifier).value!.hasMore) &&
            !(ref.watch(merchantProductNotifier).value!.isLoadingMore)) {
          await ref
              .read(merchantProductNotifier.notifier)
              .fetchMerchantProducts(
                  requests,
                  params.copyWith(page: params.page + 1),
                  widget.merchantId.toString(),
                  isMore: true)
              .whenComplete(() {
            if (!(ref
                .watch(merchantProductNotifier)
                .value!
                .hasErrorOnLoadMore)) {
              setState(() {
                params = params.copyWith(page: params.page + 1);
              });
            }
          });
        }
      }
    });

    return RefreshIndicator(
      onRefresh: _onTabsRouterChange,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(isHome: false),
        body: ListView(
          controller: controller,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 24),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.greyBackground),
                  child: InkWell(
                    onTap: context.popRoute,
                    child: SvgPicture.asset('assets/icons/back.svg'),
                  ),
                ),
              ],
            ),
            switch (promotionProducts) {
              AsyncError(:final error) => IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    return ref.read(promotionnalProductsNotifierProvider);
                  },
                ),
              AsyncData(:final PaginatedResponse<ProductModel> value) =>
                value.data.isEmpty
                    ? Container()
                    : Container(
                        height: 172,
                        margin: const EdgeInsets.only(
                          top: AppSizes.p12,
                        ),
                        child: PageView.builder(
                            itemCount: value.totalPages,
                            controller: pageContoller,
                            itemBuilder: (_, index) => Row(
                                  children: [
                                    Expanded(
                                        child: mainItem(
                                            context,
                                            index != activeIndex.value,
                                            value.data[index])),
                                    gapW20
                                  ],
                                ))),
              _ => Container(),
            },
            gapH25,
            // Center(
            //   child: Text(widget.infra.designation,
            //       style: Theme.of(context).textTheme.headlineMedium),
            // ),
            gapH25,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (!isAll)
                        Text(
                          context.locale.clientHomeTabTopRatedArticles,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            setState(() {
                              isAll = !isAll;
                            });
                            _onTabsRouterChange();
                          },
                          child: !isAll
                              ? Text(context.locale.clientHomeTabShowAll)
                              : Text(
                                  context.locale.clientHomeTabShowTopProducts)),
                    ],
                  ),
                  gapH8,
                  !isAll
                      ? top10Products.when(
                          error: (error, _) => Center(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  children: [
                                    TextButton.icon(
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                AppColors.primaryColor),
                                        onPressed: () {
                                          _onTabsRouterChange();
                                        },
                                        icon: const Icon(Icons.refresh,
                                            color: AppColors.whiteColor),
                                        label: Text(
                                          context.locale.refresh,
                                          style: const TextStyle(
                                              color: AppColors.whiteColor),
                                        )),
                                  ],
                                ),
                              )),
                          loading: () => MasonryGridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 6,
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                itemBuilder: (context, index) {
                                  return skeletonProduct(context);
                                },
                              ),
                          data: (response) {
                            return response.data.isEmpty
                                ? NoData(
                                    text:
                                        context.locale.clientHomeTabNoDataFound,
                                  )
                                : RefeshingIndicator(
                                    isRefetching: response.isRefetching,
                                    child: MasonryGridView.count(
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
                                    ),
                                  );
                          })
                      : products.when(
                          error: (error, _) => Center(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  children: [
                                    SelectableText(error.toString()),
                                    TextButton.icon(
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                AppColors.primaryColor),
                                        onPressed: () {
                                          _onTabsRouterChange();
                                        },
                                        icon: const Icon(Icons.refresh,
                                            color: AppColors.whiteColor),
                                        label: const Text(
                                          'Refresh',
                                          style: TextStyle(
                                              color: AppColors.whiteColor),
                                        )),
                                  ],
                                ),
                              )),
                          loading: () => MasonryGridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 6,
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                itemBuilder: (context, index) {
                                  return skeletonProduct(context);
                                },
                              ),
                          data: (response) {
                            return response.data.isEmpty
                                ? NoData(
                                    text:
                                        context.locale.clientHomeTabNoDataFound,
                                  )
                                : RefeshingIndicator(
                                    isRefetching: response.isRefetching,
                                    child: MasonryGridView.count(
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
                                    ),
                                  );
                          })
                ],
              ),
            ),
            gapH10,
            if (isAll &&
                ref.watch(merchantProductNotifier).hasValue &&
                ((ref.watch(merchantProductNotifier).value?.hasMore ?? false) ||
                    (ref.watch(merchantProductNotifier).value?.isLoadingMore ??
                        false)))
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (isAll &&
                ref.watch(merchantProductNotifier).hasValue &&
                (ref.watch(merchantProductNotifier).value?.hasErrorOnLoadMore ??
                    false))
              Center(
                child: IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () async {
                    await ref
                        .read(merchantProductNotifier.notifier)
                        .fetchMerchantProducts(
                            requests,
                            params.copyWith(page: params.page + 1),
                            widget.merchantId.toString(),
                            isMore: true)
                        .whenComplete(() {
                      if (!(ref
                          .watch(merchantProductNotifier)
                          .value!
                          .hasErrorOnLoadMore)) {
                        setState(() {
                          params = params.copyWith(page: params.page + 1);
                        });
                      }
                    });
                  },
                ),
              ),
            gapH64
          ],
        ),
      ),
    );
  }

  Widget mainItem(BuildContext context, bool isMin, ProductModel data) {
    return GestureDetector(
      onTap: () {
        context.pushRoute(FoodDetailsRoute(item: data));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(isMin ? 8 : 16),
        height: isMin ? context.proportionnalHeight(135) : null,
        // width: context.screenWidth / 1.15,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text.rich(
                      style: const TextStyle(color: AppColors.whiteColor),
                      TextSpan(children: [
                        TextSpan(text: data.promotionMessage),
                      ])),
                  gapH8,
                  Text(
                    '${data.priceReductionPercentage!} %',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: isMin ? 12 : 24,
                        decoration: TextDecoration.none, //
                        color: AppColors.primaryColor,
                        shadows: const [
                          Shadow(
                              offset: Offset(-1.5, -1.5), color: Colors.white),
                          Shadow(
                              offset: Offset(1.5, -1.5), color: Colors.white),
                          Shadow(offset: Offset(1.5, 1.5), color: Colors.white),
                          Shadow(
                              offset: Offset(-1.5, 1.5), color: Colors.white),
                        ]),
                  ),
                  gapH6,
                  Container(
                    alignment: Alignment.topLeft,
                    constraints:
                        const BoxConstraints.tightForFinite(width: 150),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 7, horizontal: 16),
                            minimumSize: const Size.fromHeight(24),
                            backgroundColor: AppColors.whiteColor),
                        onPressed: () {
                          context.pushRoute(FoodDetailsRoute(item: data));
                        },
                        child: Text(
                            context.locale.clientHomeTabMainItemOrderNow,
                            style:
                                const TextStyle(color: AppColors.blackColor))),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: CachedNetworkImage(
                imageUrl: data.url ??
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Barbieri_-_ViaSophia25668.jpg/220px-Barbieri_-_ViaSophia25668.jpg",
                width: context.proportionnalHeight(150),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

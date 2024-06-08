import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ifiranz_client/src/features/client/home/shared/providers.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/media_query_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/no_data.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/product_item.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/product_skeleton.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/refeshing_indicator.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../../../core/domain/paginated_response.dart';
import '../../../core/infrastructure/utils/common_import.dart';
import '../domain/filter_optional.dart';
import '../domain/product_model.dart';

@RoutePage()
class HomeTabScreen extends StatefulHookConsumerWidget {
  const HomeTabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends ConsumerState<HomeTabScreen> {
  PaginatedRequest params = PaginatedRequest(page: 0, size: 6);
  final List<FilterOptional> requests = [
    FilterOptional(
      key: 'isEnabled',
      value: true,
      type: "EQUAL",
    )
  ];

  final List<FilterOptional> filterRequest = [
    FilterOptional(
      key: 'inPromotion',
      value: true,
      type: "EQUAL",
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
    await ref.read(promotionnalProductsNotifierProvider.notifier).findPromotions(filterRequest);
    if (isAll) {
      await ref.read(productsNotifierProvider.notifier).fetchProducts(localPage, requests);
    } else {
      await ref.read(getTop10ProductsProductsNotifier.notifier).fetchProducts();
    }
    setState(() {
      params = localPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeIndex = useState(0);

    final pageContoller = usePageController(viewportFraction: .87);
    final controller = useScrollController();

    final products = ref.watch(productsNotifierProvider);
    final top10Products = ref.watch(getTop10ProductsProductsNotifier);

    final promotionProducts = ref.watch(promotionnalProductsNotifierProvider);

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
      if (controller.position.maxScrollExtent == controller.position.pixels && isAll) {
        if (ref.watch(productsNotifierProvider).hasValue &&
            (ref.watch(productsNotifierProvider).value!.hasMore) &&
            !(ref.watch(productsNotifierProvider).value!.isLoadingMore)) {
          await ref
              .read(productsNotifierProvider.notifier)
              .fetchProducts(params.copyWith(page: params.page + 1), requests, isMore: true)
              .whenComplete(() {
            if (!(ref.watch(productsNotifierProvider).value!.hasErrorOnLoadMore)) {
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
        appBar: const CustomAppBar(isHome: true),
        body: ListView(
          controller: controller,
          children: [
            switch (promotionProducts) {
              AsyncError(:final error) => IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    return ref.read(promotionnalProductsNotifierProvider);
                  },
                ),
              AsyncData(:final PaginatedResponse<ProductModel> value) => value.data.isEmpty
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
                                  mainItem(context, index != activeIndex.value, value.data[index]),
                                  const Spacer(),
                                ],
                              ))),
              _ => Container(
                  height: 172,
                  margin: const EdgeInsets.only(
                    top: AppSizes.p12,
                  ),
                  child: PageView.builder(itemCount: 1, controller: pageContoller, itemBuilder: (_, index) => skeletonpromotionProduct(context))),
            },
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
                          child: !isAll ? Text(context.locale.clientHomeTabShowAll) : Text(context.locale.clientHomeTabShowTopProducts)),
                    ],
                  ),
                  gapH8,
                  !isAll
                      ? top10Products.when(
                          error: (error, _) => Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  children: [
                                    TextButton.icon(
                                        style: TextButton.styleFrom(backgroundColor: AppColors.primaryColor),
                                        onPressed: () {
                                          _onTabsRouterChange();
                                        },
                                        icon: const Icon(Icons.refresh, color: AppColors.whiteColor),
                                        label: Text(
                                          context.locale.refresh,
                                          style: const TextStyle(color: AppColors.whiteColor),
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
                                    text: context.locale.clientHomeTabNoDataFound,
                                  )
                                : RefeshingIndicator(
                                    isRefetching: response.isRefetching,
                                    child: MasonryGridView.count(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: response.data.length,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 16,
                                      itemBuilder: (context, index) {
                                        return ProductItem(meal: response.data[index]);
                                      },
                                    ),
                                  );
                          })
                      : products.when(
                          error: (error, _) => Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  children: [
                                    SelectableText(error.toString()),
                                    TextButton.icon(
                                        style: TextButton.styleFrom(backgroundColor: AppColors.primaryColor),
                                        onPressed: () {
                                          _onTabsRouterChange();
                                        },
                                        icon: const Icon(Icons.refresh, color: AppColors.whiteColor),
                                        label: const Text(
                                          'Refresh',
                                          style: TextStyle(color: AppColors.whiteColor),
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
                                    text: context.locale.clientHomeTabNoDataFound,
                                  )
                                : RefeshingIndicator(
                                    isRefetching: response.isRefetching,
                                    child: MasonryGridView.count(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: response.data.length,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 16,
                                      itemBuilder: (context, index) {
                                        return ProductItem(meal: response.data[index]);
                                      },
                                    ),
                                  );
                          })
                ],
              ),
            ),
            gapH10,
            if (isAll &&
                ref.watch(productsNotifierProvider).hasValue &&
                ((ref.watch(productsNotifierProvider).value?.hasMore ?? false) ||
                    (ref.watch(productsNotifierProvider).value?.isLoadingMore ?? false)))
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (isAll && ref.watch(productsNotifierProvider).hasValue && (ref.watch(productsNotifierProvider).value?.hasErrorOnLoadMore ?? false))
              Center(
                child: IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () async {
                    await ref
                        .read(productsNotifierProvider.notifier)
                        .fetchProducts(params.copyWith(page: params.page + 1), requests, isMore: true)
                        .whenComplete(() {
                      if (!(ref.watch(productsNotifierProvider).value!.hasErrorOnLoadMore)) {
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
        width: context.screenWidth / 1.15,
        decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(16)),
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
                          Shadow(offset: Offset(-1.5, -1.5), color: Colors.white),
                          Shadow(offset: Offset(1.5, -1.5), color: Colors.white),
                          Shadow(offset: Offset(1.5, 1.5), color: Colors.white),
                          Shadow(offset: Offset(-1.5, 1.5), color: Colors.white),
                        ]),
                  ),
                  gapH6,
                  Container(
                    alignment: Alignment.topLeft,
                    constraints: const BoxConstraints.tightForFinite(width: 150),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                            minimumSize: const Size.fromHeight(24),
                            backgroundColor: AppColors.whiteColor),
                        onPressed: () {
                          context.pushRoute(FoodDetailsRoute(item: data));
                        },
                        child: Text(context.locale.clientHomeTabMainItemOrderNow, style: const TextStyle(color: AppColors.blackColor))),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: CachedNetworkImage(
                imageUrl: data.url!,
                width: context.proportionnalHeight(150),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../domain/infrastructur_model.dart';
import '../shared/providers.dart';
import '../../../core/domain/paginated_request.dart';
import '../../../core/infrastructure/extensions/localization_extension.dart';
import '../../../core/presentation/themes/app_colors.dart';
import '../../../core/presentation/widgets/app_bars.dart';
import '../../../core/presentation/widgets/no_data.dart';
import '../../../core/presentation/widgets/product_skeleton.dart';
import '../../../../router/app_router.dart';

import '../../../core/domain/paginated_response.dart';
import '../../../core/infrastructure/utils/common_import.dart';
import '../domain/filter_optional.dart';

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
  final List<FilterOptional> restoRequests = [
    FilterOptional(
      key: 'type',
      value: "RESTAURANT",
      type: "EQUAL",
      applyAnd: true,
    )
  ];
  final List<FilterOptional> shopRequests = [
    FilterOptional(
      key: 'type',
      value: "SHOP",
      type: "EQUAL",
      applyAnd: true,
    )
  ];
  final List<FilterOptional> supermarketRequests = [
    FilterOptional(
      key: 'type',
      value: "SUPERMARKET",
      type: "EQUAL",
      applyAnd: true,
    )
  ];

  final List<FilterOptional> promotionRequests = [
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
    final localPage = PaginatedRequest(page: 0, size: 10);
    // await ref
    //     .read(promotionnalProductsNotifierProvider.notifier)
    //     .findPromotions(filterRequest);
    // if (isAll) {
    await ref
        .read(restaurantsNotifierProvider.notifier)
        .fetchRestaurants(localPage, restoRequests);
    await ref
        .read(shopsNotifierProvider.notifier)
        .fetchRestaurants(localPage, shopRequests);
    await ref
        .read(supermarketNotifierProvider.notifier)
        .fetchRestaurants(localPage, supermarketRequests);
    await ref
        .read(promotionnalProductsNotifierProvider.notifier)
        .findPromotions(promotionRequests);
    // await ref
    //     .read(infrasNotifierProvider.notifier)
    //     .fetchRestaurants(localPage, restoRequests);
    // } else {
    //   await ref.read(getTop10ProductsProductsNotifier.notifier).fetchProducts();
    // }
    setState(() {
      params = localPage;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeIndex = useState(0);

    final pageContoller = usePageController(viewportFraction: .87);
    final controller = useScrollController();

    final products = ref.watch(productsNotifierProvider);
    // final restaurants = ref.watch(infrasNotifierProvider);
    final supermarkets = ref.watch(supermarketNotifierProvider);
    final infras = ref.watch(restaurantsNotifierProvider);
    final shops = ref.watch(shopsNotifierProvider);
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
      if (controller.position.maxScrollExtent == controller.position.pixels &&
          isAll) {
        if (ref.watch(productsNotifierProvider).hasValue &&
            (ref.watch(productsNotifierProvider).value!.hasMore) &&
            !(ref.watch(productsNotifierProvider).value!.isLoadingMore)) {
          await ref
              .read(productsNotifierProvider.notifier)
              .fetchProducts(params.copyWith(page: params.page + 1), requests,
                  isMore: true)
              .whenComplete(() {
            if (!(ref
                .watch(productsNotifierProvider)
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

    final search = useTextEditingController();
    return RefreshIndicator(
      onRefresh: _onTabsRouterChange,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(isHome: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(
                    children: [
                      TextField(
                        style: Theme.of(context).textTheme.bodyMedium,
                        controller: search,
                        onEditingComplete: () async {},
                        decoration: InputDecoration(
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: AppColors.greyTextColor),
                            suffixIcon: const Icon(Icons.search),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 9.5, horizontal: 16.0),
                            isDense: true,
                            hintText: 'Rechercher'),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        // height: 80.0,
                        // width: 70.0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 11.0),
                        decoration: BoxDecoration(
                          color: AppColors.bgGrey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: promotionProducts.when(
                          data: (response) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Offres",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(fontSize: 16),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // context.pushRoute(
                                        //     MerchantPerType(
                                        //     merchants: response.data[index]));
                                      },
                                      child: const Row(
                                        children: [
                                          Text("Tout"),
                                          SizedBox(width: 10.0),
                                          Icon(
                                            FontAwesomeIcons.chevronRight,
                                            size: 18.0,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                response.data.isEmpty
                                    ? NoData(
                                        text: context
                                            .locale.clientHomeTabNoDataFound,
                                      )
                                    : SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                                response.data.length,
                                                (index) => GestureDetector(
                                                      onTap: () async {
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    100));
                                                        context.pushRoute(
                                                            FoodDetailsRoute(
                                                                item: response
                                                                        .data[
                                                                    index]));
                                                      },
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .only(left: 7.0),
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    15.0,
                                                                vertical: 11.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              AppColors.bgGreen,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                                child: Text("${response.data[index].designation}"
                                                                            .length <
                                                                        20
                                                                    ? "${response.data[index].designation}"
                                                                    : "${"${response.data[index].designation}".substring(0, 20)} ...")),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "-${response.data[index].priceReductionPercentage}%"),
                                                                const SizedBox(
                                                                    width: 8),
                                                                Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      10,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      10,
                                                                  decoration: BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image:
                                                                              NetworkImage(response.data[index].url ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Barbieri_-_ViaSophia25668.jpg/220px-Barbieri_-_ViaSophia25668.jpg"))),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ))),
                                      ),
                              ],
                            );
                          },
                          error: (error, _) => Center(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            itemCount: 3,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            itemBuilder: (context, index) {
                              return skeletonProduct(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                mainItem(infras, "Restaurants"),
                mainItem(supermarkets, "Supermarchés"),
                mainItem(shops, "Boutiques"),
                mainItem(infras, "Mieux Notes"),
                mainItem(infras, "Plus Vendu"),
                Text(
                  "Restaurants",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 16),
                ),
                const SizedBox(height: 10.0),
                infras.when(
                  data: (response) {
                    return response.data.isEmpty
                        ? NoData(
                            text: context.locale.clientHomeTabNoDataFound,
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: response.data.length,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () async {
                                    await Future.delayed(
                                        const Duration(milliseconds: 100));
                                    context.pushRoute(MerchantProductRoute(
                                        infra: response.data[index]));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 100.0,
                                        margin:
                                            const EdgeInsets.only(right: 16.0),
                                        decoration: BoxDecoration(
                                            color: AppColors.bgGreyLike,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(response
                                                        .data[index]
                                                        .url
                                                        .isNotEmpty
                                                    ? response.data[index].url
                                                    : "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Barbieri_-_ViaSophia25668.jpg/220px-Barbieri_-_ViaSophia25668.jpg"))),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 7.0),
                                                  decoration: BoxDecoration(
                                                      color: AppColors.bgYellow,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  child: const Center(
                                                      child: Text(
                                                          'Livraison gratuite')),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  margin: const EdgeInsets.only(
                                                      right: 10.0),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(),
                                                      shape: BoxShape.circle),
                                                  child: const Icon(
                                                    FontAwesomeIcons.heart,
                                                    size: 17.0,
                                                  ),
                                                )
                                              ],
                                            ),
                                            // Center(child: Text("Image"))
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 16.0,
                                            bottom: 18.0,
                                            top: 6.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 35,
                                                  width: 35,
                                                  margin: const EdgeInsets.only(
                                                      right: 24, left: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/fake_profile.png"),
                                                    ),
                                                  ),
                                                ),
                                                Text(response
                                                    .data[index].designation),
                                              ],
                                            ),
                                            // Row(
                                            //   crossAxisAlignment: CrossAxisAlignment.start,
                                            //   children: [
                                            //     const Icon(
                                            //       FontAwesomeIcons.star,
                                            //       size: 17.0,
                                            //     ),
                                            //     const SizedBox(width: 8.0),
                                            //     Text(
                                            //       response.data[index].designation,
                                            //       style: const TextStyle(fontSize: 14.0),
                                            //     ),
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                  },
                  error: (error, _) => const Center(),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mainItem(AsyncValue<PaginatedResponse<InfrastructurModel>> merchant,
      String title) {
    return merchant.when(
      data: (response) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 16),
                  ),
                  InkWell(
                    onTap: () async {
                      // await Future.delayed(const Duration(seconds: 1));
                      context.pushRoute(MerchantPerTypeRoute(
                          merchants:
                              response.data as List<InfrastructurModel>));
                    },
                    child: const Row(
                      children: [
                        Text("Tout"),
                        SizedBox(width: 10.0),
                        Icon(
                          FontAwesomeIcons.chevronRight,
                          size: 18.0,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            response.data.isEmpty
                ? NoData(
                    text: context.locale.clientHomeTabNoDataFound,
                  )
                : SizedBox(
                    height: 120.0,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: response.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: InkWell(
                              onTap: () async {
                                // await Future.delayed(const Duration(seconds: 1));
                                context.pushRoute(MerchantProductRoute(
                                    infra: response.data[index]));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // padding: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      color: AppColors.bgGrey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SizedBox(
                                      height: 66.0,
                                      width: 85.0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          response.data[index].url.isNotEmpty
                                              ? response.data[index].url
                                              : "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Barbieri_-_ViaSophia25668.jpg/220px-Barbieri_-_ViaSophia25668.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  SizedBox(
                                    width: 90.0,
                                    child: Text(
                                      response.data[index].designation,
                                      style: const TextStyle(fontSize: 14.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
            const SizedBox(height: 25),
          ],
        );
      },
      error: (error, _) => Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SelectableText(error.toString()),
            TextButton.icon(
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.primaryColor),
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
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../router/app_router.dart';
import '../../../client/home/domain/product_model.dart';
import '../../../client/home/shared/providers.dart';
import '../../../core/domain/paginated_request.dart';
import '../../../core/infrastructure/constants/app_sizes.dart';
import '../../../core/infrastructure/extensions/localization_extension.dart';
import '../../../core/infrastructure/extensions/string_extension.dart';
import '../../../core/infrastructure/utils/common_import.dart';
import '../../../core/presentation/themes/app_colors.dart';
import '../../../core/presentation/widgets/app_bars.dart';
import '../../../core/presentation/widgets/no_data.dart';
import '../../../core/presentation/widgets/product_skeleton.dart';
import '../../../core/presentation/widgets/refeshing_indicator.dart';
import '../../../core/presentation/widgets/toats.dart';
import '../../core/presentation/widget/order_drawer_widget.dart';
import '../shared/products_providers.dart';

@RoutePage()
class ProductsTabScreen extends StatefulHookConsumerWidget {
  const ProductsTabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductsTabScreenState();
}

class _ProductsTabScreenState extends ConsumerState<ProductsTabScreen> {
  PaginatedRequest params = PaginatedRequest(page: 0, size: 20);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _onTabsRouterChange();
    });
    super.initState();
  }

  Future _onTabsRouterChange() async {
    final localPage = PaginatedRequest(page: 0, size: 20);
    await ref
        .read(merchandProductsNotifierProvider.notifier)
        .getAllProducts(localPage);

    setState(() {
      params = localPage;
    });

    // await ref
    // .read(merchantProductNotifier.notifier)
    // .fetchMerchantProducts(localPage);
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(merchandProductsNotifierProvider);
    final controller = useScrollController();

    ref.listen(merchandProductsNotifierProvider, (prev, next) {
      next.maybeWhen(
          orElse: () => null,
          data: (res) {
            if (res.actionError is String &&
                !res.isActionLoading &&
                prev?.value?.isActionLoading == true) {
              return showErrorFlushbar(context, res.actionError!);
            } else if (res.actionError == null &&
                (res.actionError == null &&
                    prev?.value?.isActionLoading == true)) {
              showSuccessFlushbar(context, context.locale.operationSuccess);
            }
          },
          error: (e, s) {
            showErrorFlushbar(context, e.toString());
          });
    });

    controller.addListener(() async {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (ref.watch(merchandProductsNotifierProvider).hasValue &&
            (ref.watch(merchandProductsNotifierProvider).value!.hasMore) &&
            !(ref
                .watch(merchandProductsNotifierProvider)
                .value!
                .isLoadingMore)) {
          await ref
              .read(merchandProductsNotifierProvider.notifier)
              .getAllProducts(params.copyWith(page: params.page + 1),
                  isMore: true)
              .whenComplete(() {
            if (!(ref
                .watch(merchandProductsNotifierProvider)
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

    return Scaffold(
      key: _scaffoldKey,
      drawer: const OrdinaryDrawerWidget(),
      appBar: CustomMarchandAppBar(
        scaffoldKey: _scaffoldKey,
        isHome: true,
        actionnable: true,
        canPop: false,
        title: context.locale.myProducts,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          context.pushRoute(const CreateNewProductRoute());
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: ListView(
        controller: controller,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          gapH8,
          products.when(
              error: (error, _) => Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SelectableText(error.toString()),
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
                        text: context.locale.noDataText,
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
                            return articleItem(
                              response.data[index],
                            );
                          },
                        ),
                      );
              }),
          gapH10,
          if (((products.value?.hasMore ?? false) ||
              (products.value?.isLoadingMore ?? false)))
            const Center(
              child: CircularProgressIndicator(),
            ),
          if ((products.value?.hasErrorOnLoadMore ?? false))
            Center(
              child: IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () async {
                  await ref
                      .read(merchandProductsNotifierProvider.notifier)
                      .getAllProducts(params.copyWith(page: params.page + 1),
                          isMore: true)
                      .whenComplete(() {
                    if (!(ref
                        .watch(merchandProductsNotifierProvider)
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
    );
  }

  Widget articleItem(ProductModel item) {
    return GestureDetector(
      onTap: () {
        context.pushRoute(MerchandProductDetailRoute(item: item));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.whiteColor,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, -8),
              blurRadius: 24,
              color: AppColors.primaryShadow,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      gapH16,
                      Container(
                        constraints: const BoxConstraints(
                          minHeight: 96,
                          maxHeight: 204,
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              item.url ?? "http://via.placeholder.com/350x150",
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Container(
                            alignment: Alignment.center,
                            height: 50,
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                          errorWidget: (context, url, error) =>
                              const Center(child: Icon(Icons.error)),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: -5,
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        context.pushRoute(UpdateProductRoute(data: item));
                      },
                      icon: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.bgGreyLike,
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 12,
                            color: AppColors.greyTextColor,
                          )),
                    ),
                  ),
                  Positioned(
                    top: -5,
                    right: 40,
                    child: IconButton(
                      onPressed: () {
                        _showDeleteConfirmationDialog(context, item);
                      },
                      icon: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.bgGreyLike,
                          ),
                          child: const Icon(
                            Icons.delete,
                            size: 12,
                            color: AppColors.greyTextColor,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.bgGreyItem,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            (item.designation ?? "").capitalize(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColors.alertWarning,
                            ),
                            const SizedBox(width: 1),
                            Text(
                              item.rang.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // gapH4,
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //   child: Text(item.),
                  // ),
                  gapH4,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.prix?.toString() ?? "0",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 17,
                        ),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, ProductModel item) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: ProgressHUD(
                  barrierEnabled: true,
                  borderWidth: 0,
                  child: Builder(
                    builder: (_) {
                      return AlertDialog(
                        backgroundColor: AppColors.whiteColor,
                        title: Text(context.locale.deleteConfirmationTitle),
                        content: Text(
                          context.locale.deleteConfirmationContent,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        actions: [
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text(
                                    context.locale.deleteConfirmationCancel,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    final progress = ProgressHUD.of(_);
                                    progress?.show();

                                    ref
                                        .read(merchandProductsNotifierProvider
                                            .notifier)
                                        .deleteProdcuct(item.id!)
                                        .whenComplete(() {
                                      context.popRoute();
                                      progress?.dismiss();
                                    });
                                  },
                                  child: Text(
                                      context.locale.deleteConfirmationAction),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  )));
        });
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ifiranz_client/src/features/client/home/shared/providers.dart';

import '../../../../router/app_router.dart';
import '../../../core/domain/paginated_request.dart';
import '../../../core/domain/paginated_response.dart';
import '../../../core/infrastructure/constants/app_sizes.dart';
import '../../../core/infrastructure/extensions/localization_extension.dart';
import '../../../core/infrastructure/utils/common_import.dart';
import '../../../core/presentation/themes/app_colors.dart';
import '../../../core/presentation/widgets/no_data.dart';
import '../../../core/presentation/widgets/product_skeleton.dart';
import '../domain/product_model.dart';

@RoutePage()
class SearchProductResultScreen extends StatefulHookConsumerWidget {
  final AsyncData<PaginatedResponse<ProductModel>> products;
  final String productName;
  const SearchProductResultScreen({
    super.key,
    required this.products,
    required this.productName,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchProductResultScreenState();
}

class _SearchProductResultScreenState
    extends ConsumerState<SearchProductResultScreen> {
  PaginatedRequest params = PaginatedRequest(page: 0, size: 10);
  bool isAll = true;
  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();
    controller.addListener(() async {
      if (controller.position.maxScrollExtent == controller.position.pixels &&
          isAll) {
        if (ref.watch(searchProductNotifier).hasValue &&
            (ref.watch(searchProductNotifier).value!.hasMore) &&
            !(ref.watch(searchProductNotifier).value!.isLoadingMore)) {
          await ref
              .read(searchProductNotifier.notifier)
              .findProductByName(
                  params.copyWith(page: params.page + 1), widget.productName)
              .whenComplete(() {
            if (!(ref.watch(searchProductNotifier).value!.hasErrorOnLoadMore)) {
              setState(() {
                params = params.copyWith(page: params.page + 1);
              });
            }
          });
        }
      }
    });

    return ProgressHUD(
      barrierEnabled: true,
      borderWidth: 0,
      child: Builder(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.productName),
              leading: IconButton(
                onPressed: context.popRoute,
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.greyBackground,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/back.svg',
                  ),
                ),
              ),
            ),
            body: widget.products.when(
              data: (response) {
                return response.data.isEmpty
                    ? NoData(
                        text: context.locale.clientHomeTabNoDataFound,
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        controller: controller,
                        itemCount: response.data.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        separatorBuilder: (context, i) => gapH16,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {
                              context.pushRoute(
                                  FoodDetailsRoute(item: response.data[index]));
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.bgGrey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SizedBox(
                                    height: 150,
                                    width: 150,
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
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          response.data[index].designation,
                                          style: const TextStyle(fontSize: 16),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      gapH10,
                                      Text(
                                        "${response.data[index].salePrice.toInt()} XAF",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.blackColor,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      gapH20,
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10)),
                                        onPressed: () {
                                          context.pushRoute(FoodDetailsRoute(
                                              item: response.data[index]));
                                        },
                                        child: Text(context
                                            .locale.foodDetailsScreenAddToCart),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
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
                          // _onTabsRouterChange();
                        },
                        icon: const Icon(Icons.refresh,
                            color: AppColors.whiteColor),
                        label: const Text(
                          'Refresh',
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
          );
        },
      ),
    );
  }
}

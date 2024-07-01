import 'package:auto_route/auto_route.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/string_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/no_data.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/product_skeleton.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/refeshing_indicator.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';
import 'package:ifiranz_client/src/features/merchant/core/presentation/widget/order_drawer_widget.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../../../core/domain/enum.dart';
import '../../../core/infrastructure/utils/common_import.dart';
import '../shared/colis_providers.dart';

@RoutePage()
class ColisTabScreen extends StatefulHookConsumerWidget {
  const ColisTabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ColisTabScreenState();
}

class _ColisTabScreenState extends ConsumerState<ColisTabScreen> {
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
    await ref.read(merchandColisNotifierProvider.notifier).getAllProducts(localPage);

    setState(() {
      params = localPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(merchandColisNotifierProvider);
    final controller = useScrollController();

    ref.listen(merchandColisNotifierProvider, (prev, next) {
      next.maybeWhen(
          orElse: () => null,
          data: (res) {
            if (res.actionError is String && !res.isActionLoading && prev?.value?.isActionLoading == true) {
              return showErrorFlushbar(context, res.actionError!);
            } else if (res.actionError == null && (res.actionError == null && prev?.value?.isActionLoading == true)) {
              showSuccessFlushbar(context, context.locale.operationSuccess);
            }
          },
          error: (e, s) {
            showErrorFlushbar(context, e.toString());
          });
    });

    controller.addListener(() async {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (ref.watch(merchandColisNotifierProvider).hasValue &&
            (ref.watch(merchandColisNotifierProvider).value!.hasMore) &&
            !(ref.watch(merchandColisNotifierProvider).value!.isLoadingMore)) {
          await ref
              .read(merchandColisNotifierProvider.notifier)
              .getAllProducts(params.copyWith(page: params.page + 1), isMore: true)
              .whenComplete(() {
            if (!(ref.watch(merchandColisNotifierProvider).value!.hasErrorOnLoadMore)) {
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
        title: context.locale.colis,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          context.pushRoute(const CreateNewColisRoute());
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
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: response.data.length,
                          itemBuilder: (context, index) {
                            return commandeItem(
                              response.data[index],
                            );
                          },
                        ),
                      );
              }),
          gapH10,
          if (((products.value?.hasMore ?? false) || (products.value?.isLoadingMore ?? false)))
            const Center(
              child: CircularProgressIndicator(),
            ),
          if ((products.value?.hasErrorOnLoadMore ?? false))
            Center(
              child: IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () async {
                  await ref
                      .read(merchandColisNotifierProvider.notifier)
                      .getAllProducts(params.copyWith(page: params.page + 1), isMore: true)
                      .whenComplete(() {
                    if (!(ref.watch(merchandColisNotifierProvider).value!.hasErrorOnLoadMore)) {
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

  Container buildStatusContainer(OrderStatus status) {
    final color = AppColors.getColorForOrderStatus(status);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: AppColors.primaryShadow,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Text(status.name.capitalize().toString(), style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.whiteColor)),
    );
  }

  Widget commandeItem(Commande record) {
    return InkWell(
      onTap: () {
        // context.pushRoute(DeliveryOrderDetailRoute(data: record));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.bgGreyContainer,
          boxShadow: const [
            BoxShadow(
              color: AppColors.containerShadow,
              offset: Offset(0, 8),
              blurRadius: 24,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '#${record.code ?? ""}',
                        style: const TextStyle(color: AppColors.blackColor),
                      ),
                      gapW10,
                      buildStatusContainer(
                        OrderStatus.values
                            .firstWhere((e) => e.value.toLowerCase() == record.statut?.toLowerCase(), orElse: () => OrderStatus.accepte),
                      ),
                    ],
                  ),
                  gapH4,
                  Row(
                    children: [
                      Text(
                        "${context.locale.address}:",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.greyTextColor),
                      ),
                      gapW10,
                      Expanded(
                        child: Text('${record.localisationGps}'.capitalize(),
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.blackColor)),
                      ),
                    ],
                  ),
                  gapH2,
                  Row(
                    children: [
                      Text(
                        "${context.locale.designation}:",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.greyTextColor),
                      ),
                      gapW10,
                      Expanded(
                        child: Text(record.designation?.capitalize() ?? "", style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ],
                  ),
                  gapH2,
                  Row(
                    children: [
                      Text(
                        "${context.locale.amount}:",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.greyTextColor),
                      ),
                      gapW10,
                      Expanded(
                        child: Text('${record.dueAmount ?? 0} XAF', style: Theme.of(context).textTheme.bodySmall),
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

  void _showDeleteConfirmationDialog(BuildContext context, Commande item) {
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
                                    Navigator.of(context).pop(); // Close the dialog
                                  },
                                  child: Text(
                                    context.locale.deleteConfirmationCancel,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    final progress = ProgressHUD.of(_);
                                    progress?.show();

                                    // ref.read(merchandColisNotifierProvider.notifier).deleteProdcuct(item.id!).whenComplete(() {
                                    //   context.popRoute();
                                    //   progress?.dismiss();
                                    // });
                                  },
                                  child: Text(context.locale.deleteConfirmationAction),
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

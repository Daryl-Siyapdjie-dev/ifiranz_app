import 'package:auto_route/auto_route.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ifiranz_client/src/features/client/delivery/shared/providers.dart';
import 'package:ifiranz_client/src/features/core/domain/enum.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/string_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/common_import.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/no_data.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/refeshing_indicator.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../../../core/infrastructure/services/local/shared_pref.dart';
import '../../../core/presentation/widgets/app_bars.dart';
import '../../../delivery/orders/domain/delivery_models.dart';
import '../../home/domain/filter_optional.dart';

@RoutePage()
class PendingDeliveriesScreen extends StatefulHookConsumerWidget {
  const PendingDeliveriesScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PendingDeliveriesScreenState();
}

class _PendingDeliveriesScreenState extends ConsumerState<PendingDeliveriesScreen> {
  PaginatedRequest params = PaginatedRequest(page: 0, size: 20);
  PaginatedRequest paramsAll = PaginatedRequest(page: 0, size: 20);
  List<FilterOptional> filter = [
    FilterOptional.fromJson({"key": "code", "aliasKey": "client.user", "value": SharedPref.getEmail(), "type": "EQUAL", "applyAnd": true}),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _onTabsRouterChange();
    });
    super.initState();
  }

  Future _onTabsRouterChange() async {
    final localPage = PaginatedRequest(page: 0, size: 20);
    await ref.read(clientDeliveryOrdersNotifierProvider.notifier).fetchDeliveryOrders(params: localPage, filterOptions: filter);
    await ref.read(clientAllDeliveryOrdersNotifierProvider.notifier).fetchDeliveryOrders(params: localPage, filterOptions: filter, isAll: true);
    setState(() {
      params = localPage;
      paramsAll = localPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deliveryOrders = ref.watch(clientDeliveryOrdersNotifierProvider);
    final allDeliveryOrders = ref.watch(clientAllDeliveryOrdersNotifierProvider);
    final pendingController = useScrollController();
    final allController = useScrollController();
    final tabBarcontroller = useTabController(initialLength: 2);

    pendingController.addListener(() async {
      if (pendingController.position.maxScrollExtent == pendingController.position.pixels) {
        if (ref.watch(clientDeliveryOrdersNotifierProvider).hasValue &&
            (ref.watch(clientDeliveryOrdersNotifierProvider).value!.hasMore) &&
            !(ref.watch(clientDeliveryOrdersNotifierProvider).value!.isLoadingMore)) {
          await ref
              .read(clientDeliveryOrdersNotifierProvider.notifier)
              .fetchDeliveryOrders(params: params.copyWith(page: params.page + 1), isMore: true)
              .whenComplete(() {
            if (!(ref.watch(clientDeliveryOrdersNotifierProvider).value!.hasErrorOnLoadMore)) {
              setState(() {
                params = params.copyWith(page: params.page + 1);
              });
            }
          });
        }
      }
    });

    allController.addListener(() async {
      if (allController.position.maxScrollExtent == allController.position.pixels) {
        if (ref.watch(clientAllDeliveryOrdersNotifierProvider).hasValue &&
            (ref.watch(clientAllDeliveryOrdersNotifierProvider).value!.hasMore) &&
            !(ref.watch(clientAllDeliveryOrdersNotifierProvider).value!.isLoadingMore)) {
          await ref
              .read(clientAllDeliveryOrdersNotifierProvider.notifier)
              .fetchDeliveryOrders(params: paramsAll.copyWith(page: paramsAll.page + 1), isMore: true, isAll: true)
              .whenComplete(() {
            if (!(ref.watch(clientAllDeliveryOrdersNotifierProvider).value!.hasErrorOnLoadMore)) {
              setState(() {
                paramsAll = paramsAll.copyWith(page: paramsAll.page + 1);
              });
            }
          });
        }
      }
    });

    Widget pendingView() {
      return deliveryOrders.when(
        data: (response) {
          return response.data.isEmpty
              ? NoData(
                  text: context.locale.clientHomeTabNoDataFound,
                )
              : RefeshingIndicator(
                  isRefetching: response.isRefetching,
                  child: ListView(
                    controller: pendingController,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      ...response.data.map((e) => orderItem(e)).toList(),
                      gapH10,
                      if (((ref.watch(clientDeliveryOrdersNotifierProvider).value?.hasMore ?? false) ||
                          (ref.watch(clientDeliveryOrdersNotifierProvider).value?.isLoadingMore ?? false)))
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      if ((ref.watch(clientDeliveryOrdersNotifierProvider).value?.hasErrorOnLoadMore ?? false))
                        Center(
                          child: IconButton(
                            icon: const Icon(Icons.refresh),
                            onPressed: () async {
                              await ref
                                  .read(clientDeliveryOrdersNotifierProvider.notifier)
                                  .fetchDeliveryOrders(params: params.copyWith(page: params.page + 1), isMore: true)
                                  .whenComplete(() {
                                if (!(ref.watch(clientDeliveryOrdersNotifierProvider).value!.hasErrorOnLoadMore)) {
                                  setState(() {
                                    params = params.copyWith(page: params.page + 1);
                                  });
                                }
                              });
                            },
                          ),
                        ),
                    ],
                  ),
                );
        },
        error: (error, _) => Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: IconButton(onPressed: () => _onTabsRouterChange(), icon: const Icon(Icons.refresh)),
        )),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    Widget allView() {
      return allDeliveryOrders.when(
        data: (response) {
          return response.data.isEmpty
              ? NoData(
                  text: context.locale.clientHomeTabNoDataFound,
                )
              : RefeshingIndicator(
                  isRefetching: response.isRefetching,
                  child: ListView(
                    controller: allController,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      ...response.data.map((e) => orderItem(e)).toList(),
                      gapH10,
                      if (((ref.watch(clientAllDeliveryOrdersNotifierProvider).value?.hasMore ?? false) ||
                          (ref.watch(clientAllDeliveryOrdersNotifierProvider).value?.isLoadingMore ?? false)))
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      if ((ref.watch(clientAllDeliveryOrdersNotifierProvider).value?.hasErrorOnLoadMore ?? false))
                        Center(
                          child: IconButton(
                            icon: const Icon(Icons.refresh),
                            onPressed: () async {
                              await ref
                                  .read(clientAllDeliveryOrdersNotifierProvider.notifier)
                                  .fetchDeliveryOrders(params: paramsAll.copyWith(page: paramsAll.page + 1), isMore: true)
                                  .whenComplete(() {
                                if (!(ref.watch(clientAllDeliveryOrdersNotifierProvider).value!.hasErrorOnLoadMore)) {
                                  setState(() {
                                    paramsAll = paramsAll.copyWith(page: paramsAll.page + 1);
                                  });
                                }
                              });
                            },
                          ),
                        ),
                    ],
                  ),
                );
        },
        error: (error, _) => Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: IconButton(onPressed: () => _onTabsRouterChange(), icon: const Icon(Icons.refresh)),
        )),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Scaffold(
                  appBar: CustomAppBar(
                    canPop: false,
                    appBar: TabBar(
                      controller: tabBarcontroller,
                      tabs: [
                        Tab(text: context.locale.pending),
                        Tab(text: context.locale.all),
                      ],
                    ),
                  ),
                  body: TabBarView(controller: tabBarcontroller, children: [pendingView(), allView()]));
            })));
  }

  Widget orderItem(Records record) {
    return InkWell(
      onTap: () {
        context.pushRoute(ClientDeliveryOrderDetailRoute(data: record, isPendingDeliveries: true));
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
                  OrderStatus.values.firstWhere((e) => e.value.toLowerCase() == record.statut?.toLowerCase(), orElse: () => OrderStatus.accepte),
                ),
              ],
            ),
            gapH4,
            Row(
              children: [
                Text(
                  "${context.locale.ditance}:",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.greyTextColor),
                ),
                gapW10,
                Expanded(
                  child: Text('${record.commande?.localisationGps} to ${record.commande?.client?.adresse}'.capitalize(),
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
                  child: Text(record.commande?.designation?.capitalize() ?? "", style: Theme.of(context).textTheme.bodySmall),
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
                  child: Text('${record.commande?.montant ?? 0} XAF', style: Theme.of(context).textTheme.bodySmall),
                ),
              ],
            ),
          ],
        ),
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
}

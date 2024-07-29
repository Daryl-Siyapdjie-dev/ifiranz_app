import 'package:auto_route/auto_route.dart';

import '../../../../../../router/app_router.dart';
import '../../../../../core/domain/enum.dart';
import '../../../../../core/domain/paginated_request.dart';
import '../../../../../core/infrastructure/constants/app_sizes.dart';
import '../../../../../core/infrastructure/extensions/localization_extension.dart';
import '../../../../../core/infrastructure/extensions/string_extension.dart';
import '../../../../../core/infrastructure/utils/common_import.dart';
import '../../../../../core/presentation/themes/app_colors.dart';
import '../../../../../core/presentation/widgets/app_bars.dart';
import '../../../../../core/presentation/widgets/no_data.dart';
import '../../../../../delivery/orders/domain/delivery_models.dart';
import '../../../../core/presentation/widget/order_drawer_widget.dart';
import '../shared/providers.dart';

@RoutePage()
class MerchandDashboardDashboardDeliveryScreen
    extends StatefulHookConsumerWidget {
  const MerchandDashboardDashboardDeliveryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MerchandDashboardDashboardDeliveryScreenState();
}

class _MerchandDashboardDashboardDeliveryScreenState
    extends ConsumerState<MerchandDashboardDashboardDeliveryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PaginatedRequest params = PaginatedRequest(page: 0, size: 10);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.microtask(() {
        ref
            .refresh(merchantDeliveriesNotifier.notifier)
            .getMerchantDeliveries(params);
      });
    });

    super.initState();
  }

  // merchandDashBoardDeliveryNotifierProvider -> merchantDeliveriesNotifier

  @override
  Widget build(BuildContext context) {
    final orders = ref.watch(merchantDeliveriesNotifier);
    final controller = useScrollController();
    final isFilter = useState(false);

    controller.addListener(() async {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (ref.watch(merchantDeliveriesNotifier).hasValue &&
            (ref.watch(merchantDeliveriesNotifier).value!.hasMore) &&
            !(ref.watch(merchantDeliveriesNotifier).value!.isLoadingMore)) {
          await ref
              .read(merchantDeliveriesNotifier.notifier)
              .getMerchantDeliveries(params.copyWith(page: params.page + 1),
                  isMore: true)
              .whenComplete(() {
            if (!(ref
                .watch(merchantDeliveriesNotifier)
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
      onRefresh: () => ref
          .read(merchantDeliveriesNotifier.notifier)
          .getMerchantDeliveries(PaginatedRequest(page: 0, size: 10)),
      child: Scaffold(
          key: _scaffoldKey,
          appBar: CustomMarchandAppBar(
            title: context.locale.merchandHomeScreenDeliveries,
            actionnable: false,
          ),
          body: orders.when(
            data: (response) {
              return response.data.isEmpty
                  ? Column(
                      children: [
                        if (isFilter.value) ...[
                          TextButton.icon(
                              style: TextButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 0)),
                              onPressed: () {
                                isFilter.value = false;
                                ref
                                    .refresh(
                                        merchantDeliveriesNotifier.notifier)
                                    .getMerchantDeliveries(
                                        params.copyWith(page: 0));
                              },
                              icon: const Icon(Icons.close,
                                  color: AppColors.primaryColor),
                              label: Text(
                                context.locale.clearFilter,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.primaryColor),
                              )),
                        ],
                        NoData(
                          text: context.locale.clientHomeTabNoDataFound,
                        ),
                      ],
                    )
                  : ListView(
                      controller: controller,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        if (isFilter.value) ...[
                          TextButton.icon(
                              style: TextButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 0)),
                              onPressed: () {
                                isFilter.value = false;
                                ref
                                    .refresh(
                                        merchantDeliveriesNotifier.notifier)
                                    .getMerchantDeliveries(
                                        params.copyWith(page: 0));
                              },
                              icon: const Icon(Icons.close,
                                  color: AppColors.primaryColor),
                              label: Text(
                                context.locale.clearFilter,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.primaryColor),
                              )),
                        ],
                        ...response.data
                            .map((e) => orderItem(context, e))
                            .toList(),
                        gapH10,
                        if (((ref
                                    .watch(merchantDeliveriesNotifier)
                                    .value
                                    ?.hasMore ??
                                false) ||
                            (ref
                                    .watch(merchantDeliveriesNotifier)
                                    .value
                                    ?.isLoadingMore ??
                                false)))
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        if ((ref
                                .watch(merchantDeliveriesNotifier)
                                .value
                                ?.hasErrorOnLoadMore ??
                            false))
                          Center(
                            child: IconButton(
                              icon: const Icon(Icons.refresh),
                              onPressed: () async {
                                await ref
                                    .read(merchantDeliveriesNotifier.notifier)
                                    .getMerchantDeliveries(
                                        params.copyWith(page: params.page + 1),
                                        isMore: true)
                                    .whenComplete(() {
                                  if (!(ref
                                      .watch(merchantDeliveriesNotifier)
                                      .value!
                                      .hasErrorOnLoadMore)) {
                                    setState(() {
                                      params = params.copyWith(
                                          page: params.page + 1);
                                    });
                                  }
                                });
                              },
                            ),
                          ),
                        gapH64
                      ],
                    );
            },
            error: (error, _) => Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SelectableText(error.toString()),
            )),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          drawer: const OrdinaryDrawerWidget()),
    );
  }

  Widget orderItem(BuildContext _, Records record) {
    return InkWell(
      onTap: () {
        context.pushRoute(MerchandOrderDetailsRoute(data: record));
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
                  OrderStatus.values.firstWhere(
                      (e) =>
                          e.value.toLowerCase() == record.statut?.toLowerCase(),
                      orElse: () => OrderStatus.accepte),
                ),
              ],
            ),
            gapH4,
            Row(
              children: [
                Text(
                  "${context.locale.deliveryAddress}:",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.greyTextColor),
                ),
                gapW10,
                Expanded(
                  child: Text('${record.localisationGps}',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.blackColor)),
                ),
              ],
            ),
            gapH2,
            Row(
              children: [
                Text(
                  "${context.locale.designation}:",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.greyTextColor),
                ),
                gapW10,
                Expanded(
                  child: Text(
                    record.designation?.capitalize() ?? "",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            gapH2,
            Row(
              children: [
                Text(
                  "${context.locale.amount}:",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.greyTextColor),
                ),
                gapW10,
                Expanded(
                  child: Text('${record.dueAmount ?? 0} XAF',
                      style: Theme.of(context).textTheme.bodySmall),
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
      child: Text(status.name.capitalize().toString(),
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.whiteColor)),
    );
  }
}

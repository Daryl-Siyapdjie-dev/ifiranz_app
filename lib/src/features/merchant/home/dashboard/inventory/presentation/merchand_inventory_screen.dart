import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:intl/intl.dart';

import '../../../../../../router/app_router.dart';
import '../../../../../core/domain/paginated_request.dart';
import '../../../../../core/infrastructure/constants/app_sizes.dart';
import '../../../../../core/infrastructure/extensions/string_extension.dart';
import '../../../../../core/infrastructure/utils/common_import.dart';
import '../../../../../core/presentation/themes/app_colors.dart';
import '../../../../../core/presentation/widgets/app_bars.dart';
import '../../../../../core/presentation/widgets/no_data.dart';
import '../../../../../core/presentation/widgets/refeshing_indicator.dart';
import '../../../../../delivery/orders/domain/delivery_models.dart';
import '../../../../../delivery/orders/presentation/widget/delivery_drawer_widget.dart';
import '../../../../core/presentation/widget/date_picker.dart';
import '../../clients/shared/providers.dart';
import '../../delivery/shared/providers.dart';
import '../domain/inventory.dart';
import '../shared/providers.dart';

@RoutePage()
class MerchandInventoryScreen extends StatefulHookConsumerWidget {
  const MerchandInventoryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MerchandInventoryScreenState();
}

class _MerchandInventoryScreenState
    extends ConsumerState<MerchandInventoryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PaginatedRequest params = PaginatedRequest(page: 0, size: 7);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.microtask(() {
        ref
            .read(merchandDashBoardDeliveryNotifierProvider.notifier)
            .getMerchandOrders(params);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orders = ref.watch(merchandDashBoardDeliveryNotifierProvider);
    final controller = useScrollController();

    controller.addListener(() async {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (ref.watch(merchandDashBoardDeliveryNotifierProvider).hasValue &&
            (ref
                .watch(merchandDashBoardDeliveryNotifierProvider)
                .value!
                .hasMore) &&
            !(ref
                .watch(merchandDashBoardDeliveryNotifierProvider)
                .value!
                .isLoadingMore)) {
          await ref
              .read(merchandDashBoardDeliveryNotifierProvider.notifier)
              .getMerchandOrders(params.copyWith(page: params.page + 1),
                  isMore: true)
              .whenComplete(() {
            if (!(ref
                .watch(merchandDashBoardDeliveryNotifierProvider)
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
          .read(merchandDashBoardDeliveryNotifierProvider.notifier)
          .getMerchandOrders(PaginatedRequest(page: 0, size: params.size)),
      child: Scaffold(
          key: _scaffoldKey,
          appBar: CustomMarchandAppBar(
              title: 'Inventory',
              action: IconButton(
                  onPressed: () {
                    // showDialog(
                    //     context: context,
                    //     builder: (context) => CustomDateRangePickerDialog(
                    //         filterCallback: ref
                    //             .read(
                    //                 merchandDashBoardDeliveryNotifierProvider.notifier)
                    //             .filterDeliveryOrders));
                  },
                  icon: const Icon(
                    Icons.tune,
                    color: AppColors.variantGreenColor,
                  ))),
          body: orders.when(
            data: (response) {
              return response.data.isEmpty
                  ? const NoData(
                      text: "No Data found",
                    )
                  : RefeshingIndicator(
                      isRefetching: response.isRefetching,
                      child: ListView(
                        controller: controller,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        children: [
                          ...response.data.map((e) => orderItem(e)).toList(),
                          gapH10,
                          if (((ref
                                      .watch(
                                          merchandDashBoardDeliveryNotifierProvider)
                                      .value
                                      ?.hasMore ??
                                  false) ||
                              (ref
                                      .watch(
                                          merchandDashBoardDeliveryNotifierProvider)
                                      .value
                                      ?.isLoadingMore ??
                                  false)))
                            const Center(
                              child: CircularProgressIndicator(),
                            ),
                          if ((ref
                                  .watch(
                                      merchandDashBoardDeliveryNotifierProvider)
                                  .value
                                  ?.hasErrorOnLoadMore ??
                              false))
                            Center(
                              child: IconButton(
                                icon: const Icon(Icons.refresh),
                                onPressed: () async {
                                  await ref
                                      .read(
                                          merchandDashBoardDeliveryNotifierProvider
                                              .notifier)
                                      .getMerchandOrders(
                                          params.copyWith(
                                              page: params.page + 1),
                                          isMore: true)
                                      .whenComplete(() {
                                    if (!(ref
                                        .watch(
                                            merchandDashBoardDeliveryNotifierProvider)
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
                      ),
                    );
            },
            error: (error, _) => Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  ref
                      .read(merchandClientsNotifierProvider.notifier)
                      .fetchMerchantClients(params.copyWith(page: 0));
                },
              ),
            )),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          drawer: const DeliveryDrawerWidget()),
    );
  }

  Widget orderItem(Records record) {
    return InkWell(
      onTap: () {
        context.pushRoute(MerchandInventoryDetailsRoute(data: record));
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
              ],
            ),
            gapH4,
            Row(
              children: [
                Text(
                  "Client:",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.greyTextColor),
                ),
                gapW10,
                Expanded(
                  child: Text((record.clientName ?? " ").capitalize(),
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
                  "Designation:",
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
                  "Amount:",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.greyTextColor),
                ),
                gapW10,
                Expanded(
                  child: Text(
                      '${record.dueAmount! + record.montantLivraison!} XAF',
                      style: Theme.of(context).textTheme.bodySmall),
                ),
              ],
            ),
            gapH2,
            Row(
              children: [
                Text(
                  "Date:",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.greyTextColor),
                ),
                gapW10,
                Expanded(
                  child: Text(
                      DateFormat('yyyy-MM-dd | hh:mm').format(
                        DateTime.parse(record.dateCreate!),
                      ),
                      style: Theme.of(context).textTheme.bodySmall),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ifiranz_client/src/features/core/domain/enum.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/string_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_constants.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/common_import.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/no_data.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';
import 'package:ifiranz_client/src/features/delivery/orders/presentation/widget/delivery_drawer_widget.dart';
import 'package:ifiranz_client/src/features/delivery/orders/shared/providers.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

@RoutePage()
class DashboardDeliveryTabScreen extends StatefulHookConsumerWidget {
  const DashboardDeliveryTabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardDeliveryTabScreenState();
}

class _DashboardDeliveryTabScreenState extends ConsumerState<DashboardDeliveryTabScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PaginatedRequest params = PaginatedRequest(page: 0, size: 7);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.microtask(() {
        ref.read(deliveryDashboardOrdersNotifierProvider.notifier).fetchDeliveryOrders(params);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deliveryOrders = ref.watch(deliveryDashboardOrdersNotifierProvider);
    final controller = useScrollController();
    ref.listen(
      deliveryDashboardOrdersNotifierProvider,
      (previous, next) {
        next.maybeWhen(
          orElse: () {},
          data: (res) {
            if (res.actionError is String) {
              Flushbar(
                message: "${res.actionError}",
                icon: const Icon(
                  Icons.info,
                  color: AppColors.alertError,
                ),
                borderRadius: BorderRadius.circular(10),
                backgroundColor: AppColors.bgRed,
                messageColor: AppColors.alertError,
                duration: const Duration(seconds: ApiConstants.flushbarDuration),
                margin: const EdgeInsets.all(16),
              ).show(context);
            }
          },
        );
      },
    );

    controller.addListener(() async {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (ref.watch(deliveryDashboardOrdersNotifierProvider).hasValue &&
            (ref.watch(deliveryDashboardOrdersNotifierProvider).value!.hasMore) &&
            !(ref.watch(deliveryDashboardOrdersNotifierProvider).value!.isLoadingMore)) {
          await ref
              .read(deliveryDashboardOrdersNotifierProvider.notifier)
              .fetchDeliveryOrders(params.copyWith(page: params.page + 1), isMore: true)
              .whenComplete(() {
            if (!(ref.watch(deliveryDashboardOrdersNotifierProvider).value!.hasErrorOnLoadMore)) {
              setState(() {
                params = params.copyWith(page: params.page + 1);
              });
            }
          });
        }
      }
    });
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Scaffold(
                  key: _scaffoldKey,
                  appBar: CustomDeliveryAppBar(
                    title: context.locale.orders,
                    canPop: true,
                    scaffoldKey: _scaffoldKey,
                  ),
                  body: deliveryOrders.when(
                    data: (response) {
                      return response.data.isEmpty
                          ? NoData(
                              text: context.locale.noDataText,
                            )
                          : ListView(
                              controller: controller,
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              children: [
                                ...response.data.map((e) => orderItem(_, e)).toList(),
                                if (deliveryOrders.value?.hasErrorOnLoadMore == true)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {
                                          ref
                                              .read(deliveryDashboardOrdersNotifierProvider.notifier)
                                              .fetchDeliveryOrders(params.copyWith(page: params.page));
                                        },
                                        icon: const Icon(Icons.refresh),
                                      ),
                                    ),
                                  ),
                                if ((deliveryOrders.value?.data.length ?? 0) % params.size == 0)
                                  const Padding(
                                    padding: EdgeInsets.only(top: 8.0, bottom: 25),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                if (deliveryOrders.value?.hasErrorOnLoadMore == true)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {
                                          ref
                                              .read(deliveryDashboardOrdersNotifierProvider.notifier)
                                              .fetchDeliveryOrders(params.copyWith(page: params.page));
                                        },
                                        icon: const Icon(Icons.refresh),
                                      ),
                                    ),
                                  )
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
                  drawer: const DeliveryDrawerWidget());
            })));
  }

  Widget orderItem(BuildContext _, Records record) {
    return InkWell(
      onTap: () {
        context.pushRoute(DeliveryOrderDetailRoute(data: record, isOnlyDetail: true));
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
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#${record.code ?? ""}',
                  style: const TextStyle(color: AppColors.blackColor),
                ),
                buildStatusContainer(
                  (OrderStatus.values.firstWhere((e) => e.value.toLowerCase() == record.statut?.toLowerCase(), orElse: () => OrderStatus.accepte)),
                ),
                gapH2,
                Text(record.commande?.designation?.capitalize() ?? "", style: Theme.of(context).textTheme.bodySmall),
                gapH2,
                Text('${record.commande?.localisationGps} ${context.locale.to} ${record.commande?.client?.adresse}'.capitalize(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.blackColor)),
                gapH2,
                Text(
                  '${record.commande?.montant} XAF',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(color: AppColors.variantGreenColor),
                )
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

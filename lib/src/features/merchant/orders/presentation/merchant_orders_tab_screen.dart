import 'package:auto_route/auto_route.dart';
import 'package:intl/intl.dart';

import '../../../../router/app_router.dart';
import '../../../client/home/domain/current_cart_response.dart';
import '../../../core/domain/enum.dart';
import '../../../core/domain/paginated_request.dart';
import '../../../core/infrastructure/constants/app_sizes.dart';
import '../../../core/infrastructure/extensions/localization_extension.dart';
import '../../../core/infrastructure/extensions/string_extension.dart';
import '../../../core/infrastructure/utils/common_import.dart';
import '../../../core/presentation/themes/app_colors.dart';
import '../../../core/presentation/widgets/app_bars.dart';
import '../../../core/presentation/widgets/no_data.dart';
import '../../../core/presentation/widgets/refeshing_indicator.dart';
import '../../core/presentation/widget/date_picker.dart';
import '../../core/presentation/widget/order_drawer_widget.dart';
import '../shared/providers.dart';

@RoutePage()
class MerchantOrdersTabScreen extends StatefulHookConsumerWidget {
  const MerchantOrdersTabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MerchantOrdersTabScreenState();
}

class _MerchantOrdersTabScreenState
    extends ConsumerState<MerchantOrdersTabScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PaginatedRequest params = PaginatedRequest(page: 0, size: 20);

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
        .read(merchandOrdersNotifierProvider.notifier)
        .fetchDeliveryOrders(params);

    setState(() {
      params = localPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final orders = ref.watch(merchandOrdersNotifierProvider);
    final controller = useScrollController();
    final isFilter = useState(false);

    controller.addListener(() async {
      final hasValue = ref.watch(merchandOrdersNotifierProvider).hasValue;
      final ordersValue = ref.watch(merchandOrdersNotifierProvider).value;

      if (controller.position.maxScrollExtent == controller.position.pixels &&
          hasValue &&
          ordersValue!.hasMore &&
          !ordersValue.isLoadingMore) {
        await ref
            .read(merchandOrdersNotifierProvider.notifier)
            .fetchDeliveryOrders(params.copyWith(page: params.page + 1),
                isMore: true)
            .whenComplete(() {
          if (!ordersValue.hasErrorOnLoadMore) {
            setState(() {
              params = params.copyWith(page: params.page + 1);
            });
          }
        });
      }
    });

    return RefreshIndicator(
      onRefresh: () {
        return ref
            .refresh(merchandOrdersNotifierProvider.notifier)
            .fetchDeliveryOrders(params.copyWith(page: params.page));
      },
      child: Scaffold(
          key: _scaffoldKey,
          appBar: CustomMarchandAppBar(
            title: context.locale.orders,
            scaffoldKey: _scaffoldKey,
            action: IconButton(
              onPressed: () async {
                final bool? updates = await showDialog(
                    context: context,
                    builder: (context) => CustomDateRangePickerDialog(
                        filterCallback: ref
                            .read(merchandOrdersNotifierProvider.notifier)
                            .filterDeliveryOrders));
                if (updates is bool) {
                  isFilter.value = true;
                }
              },
              icon: const Icon(
                Icons.tune,
                color: AppColors.variantGreenColor,
              ),
            ),
            actionnable: true,
            canPop: false,
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
                                _onTabsRouterChange();
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
                        gapH64,
                        NoData(
                          text: context.locale.clientHomeTabNoDataText,
                        ),
                      ],
                    )
                  : RefeshingIndicator(
                      isRefetching: response.isRefetching,
                      child: ListView(
                        controller: controller,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        children: [
                          if (isFilter.value) ...[
                            TextButton.icon(
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0)),
                                onPressed: () {
                                  isFilter.value = false;
                                  _onTabsRouterChange();
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
                          if (((orders.value?.hasMore ?? false) ||
                              (orders.value?.isLoadingMore ?? false)))
                            const Center(
                              child: CircularProgressIndicator(),
                            ),
                          if ((orders.value?.hasErrorOnLoadMore ?? false))
                            Center(
                              child: IconButton(
                                icon: const Icon(Icons.refresh),
                                onPressed: () async {
                                  await ref
                                      .read(merchandOrdersNotifierProvider
                                          .notifier)
                                      .fetchDeliveryOrders(
                                          params.copyWith(
                                              page: params.page + 1),
                                          isMore: true)
                                      .whenComplete(() {
                                    if (!(ref
                                        .watch(merchandOrdersNotifierProvider)
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
              child: SelectableText(error.toString()),
            )),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          drawer: const OrdinaryDrawerWidget()),
    );
  }

  Widget orderItem(BuildContext _, CurrentCartResponse record) {
    return InkWell(
      onTap: () {
        context
            .pushRoute(ClientOrderDetailRoute(data: record, isMarchant: true));
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
                Expanded(
                  flex: 1,
                  child: Text(
                    '#${record.code ?? ""}',
                    style: const TextStyle(color: AppColors.blackColor),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Text(
                        record.statut == 'Nonvalide'
                            ? context.locale.nonValide
                            : record.statut == 'Valide'
                                ? context.locale.valide
                                : record.statut ?? '',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: record.statut == 'Valide'
                                ? AppColors.alertSuccess
                                : record.statut == 'Nonvalide'
                                    ? AppColors.errorColor
                                    : AppColors.alertInfo,
                            fontWeight: FontWeight.bold)))
              ],
            ),
            gapH4,
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    context.locale.designation,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.greyTextColor),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text((record.designation ?? "").capitalize(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                )
              ],
            ),
            gapH2,
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    context.locale.amount,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.greyTextColor),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text('${record.montant} XAF',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.variantGreenColor)),
                )
              ],
            ),
            gapH2,
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    context.locale.client,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.greyTextColor),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text('${record.client?.user}'),
                )
              ],
            ),
            if (record.dateCreate != null) gapH2,
            if (record.dateCreate != null)
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Date",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.greyTextColor),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      DateFormat('yyyy-MM-dd | hh:mm').format(
                        DateTime.parse(record.dateCreate!),
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
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
      child: Text(status.name.capitalize().toString(),
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.whiteColor)),
    );
  }

  Row cartListTile(
      {required String title,
      required num amount,
      bool isTotal = false,
      bool isCoupon = false}) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.greyTextColor),
        ),
        const Spacer(),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: isCoupon ? "(-) $amount" : "$amount ",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: !isTotal
                      ? AppColors.greyTextColor
                      : AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: isTotal ? 20 : 12)),
          isCoupon
              ? TextSpan(
                  text: "%",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 12, color: AppColors.greyTextColor))
              : TextSpan(
                  text: "XAF",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: !isTotal
                          ? AppColors.greyTextColor
                          : AppColors.secondaryColor)),
        ]))
      ],
    );
  }
}

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:intl/intl.dart';
import '../../../core/domain/enum.dart';
import '../../../core/domain/paginated_request.dart';
import '../../../core/infrastructure/constants/app_sizes.dart';
import '../../../core/infrastructure/extensions/localization_extension.dart';
import '../../../core/infrastructure/extensions/string_extension.dart';
import '../../../core/infrastructure/utils/api_constants.dart';
import '../../../core/infrastructure/utils/common_import.dart';
import '../../../core/presentation/themes/app_colors.dart';
import '../../../core/presentation/widgets/app_bars.dart';
import '../../../core/presentation/widgets/no_data.dart';
import '../../../core/presentation/widgets/refeshing_indicator.dart';
import '../domain/delivery_models.dart';
import 'widget/delivery_drawer_widget.dart';
import '../shared/providers.dart';
import '../../../../router/app_router.dart';

import '../../../client/home/domain/filter_optional.dart';

@RoutePage()
class OrderDeliveryTabScreen extends StatefulHookConsumerWidget {
  const OrderDeliveryTabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OrderDeliveryTabScreenState();
}

class _OrderDeliveryTabScreenState
    extends ConsumerState<OrderDeliveryTabScreen> {
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
        .read(deliveryOrdersNotifierProvider.notifier)
        .fetchDeliveryOrders(params);

    setState(() {
      params = localPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deliveryOrders = ref.watch(deliveryOrdersNotifierProvider);
    final controller = useScrollController();
    final isFilter = useState(false);
    final isSearch = useState(false);
    final searchInputController = useTextEditingController();

    ref.listen(
      deliveryOrdersNotifierProvider,
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
                duration:
                    const Duration(seconds: ApiConstants.flushbarDuration),
                margin: const EdgeInsets.all(16),
              ).show(context);
            }
          },
        );
      },
    );

    controller.addListener(() async {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (ref.watch(deliveryOrdersNotifierProvider).hasValue &&
            (ref.watch(deliveryOrdersNotifierProvider).value!.hasMore) &&
            !(ref.watch(deliveryOrdersNotifierProvider).value!.isLoadingMore)) {
          await ref
              .read(deliveryOrdersNotifierProvider.notifier)
              .fetchDeliveryOrders(params.copyWith(page: params.page + 1),
                  isMore: true)
              .whenComplete(() {
            if (!(ref
                .watch(deliveryOrdersNotifierProvider)
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ProgressHUD(
        barrierEnabled: true,
        borderWidth: 0,
        child: Builder(
          builder: (_) {
            return RefreshIndicator(
              onRefresh: () {
                return ref
                    .refresh(deliveryOrdersNotifierProvider.notifier)
                    .fetchDeliveryOrders(PaginatedRequest(size: params.size));
              },
              child: Scaffold(
                  key: _scaffoldKey,
                  appBar: CustomDeliveryAppBar(
                      isHome: false,
                      title: context.locale.orders,
                      canPop: false,
                      scaffoldKey: _scaffoldKey,
                      appBar: isSearch.value
                          ? AppBar(
                              automaticallyImplyLeading: false,
                              title: TextField(
                                controller: searchInputController,
                                onEditingComplete: () async {
                                  if (searchInputController.text.isNotEmpty) {
                                    final progress = ProgressHUD.of(_);
                                    progress?.show();
                                    await ref
                                        .read(deliveryOrdersNotifierProvider
                                            .notifier)
                                        .findOrders([
                                      FilterOptional(
                                        type: "EQUAL",
                                        key: "localisationGps",
                                        value:
                                            searchInputController.text.trim(),
                                      ),
                                    ], PaginatedRequest(size: 20)).whenComplete(
                                            () {
                                      progress?.dismiss();
                                      isFilter.value = true;
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                    hintText: context.locale.search,
                                    prefixIcon: const Icon(Icons.search)),
                              ),
                              actions: [
                                IconButton(
                                    onPressed: () {
                                      isSearch.value = !isSearch.value;
                                      searchInputController.clear();
                                    },
                                    icon: const Icon(Icons.close))
                              ],
                            )
                          : null,
                      action: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                isSearch.value = !isSearch.value;
                              },
                              icon: const Icon(
                                Icons.search,
                                color: AppColors.variantGreenColor,
                              )),
                          IconButton(
                              onPressed: () async {
                                final bool? res = await showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const SearchFilterWidget());

                                if (res ?? false) {
                                  isFilter.value = true;
                                }
                              },
                              icon: const Icon(
                                Icons.tune,
                                color: AppColors.variantGreenColor,
                              )),
                        ],
                      )),
                  body: deliveryOrders.when(
                    data: (response) {
                      return response.data.isEmpty
                          ? Column(
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
                                Expanded(
                                  child: NoData(
                                    text: context.locale.noDataText,
                                  ),
                                ),
                              ],
                            )
                          : RefeshingIndicator(
                              isRefetching: response.isRefetching,
                              child: ListView(
                                controller: controller,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
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
                                          context.locale.noDataText,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: AppColors.primaryColor),
                                        )),
                                  ],
                                  ...response.data
                                      .map((e) => orderItem(_, e))
                                      .toList(),
                                  if ((deliveryOrders.value?.data.length ?? 0) %
                                          params.size ==
                                      0)
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 8.0, bottom: 25),
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  if (deliveryOrders
                                          .value?.hasErrorOnLoadMore ==
                                      true)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {
                                            ref
                                                .read(
                                                    deliveryOrdersNotifierProvider
                                                        .notifier)
                                                .fetchDeliveryOrders(
                                                    params.copyWith(
                                                        page: params.page));
                                          },
                                          icon: const Icon(Icons.refresh),
                                        ),
                                      ),
                                    )
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
                  drawer: const DeliveryDrawerWidget()),
            );
          },
        ),
      ),
    );
  }

  Widget orderItem(BuildContext _, Records record) {
    return InkWell(
      onTap: () {
        context.pushRoute(DeliveryOrderDetailRoute(data: record));
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
                        OrderStatus.values.firstWhere(
                            (e) =>
                                e.value.toLowerCase() ==
                                record.statut?.toLowerCase(),
                            orElse: () => OrderStatus.accepte),
                      ),
                    ],
                  ),
                  gapH4,
                  Row(
                    children: [
                      Text(
                        "${context.locale.address}:",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.greyTextColor),
                      ),
                      gapW10,
                      Expanded(
                        child: Text(
                            '${record.commande?.localisationGps}'.capitalize(),
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
                            record.commande?.designation?.capitalize() ?? "",
                            style: Theme.of(context).textTheme.bodySmall),
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
                        child: Text('${record.commande?.dueAmount ?? 0} XAF',
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ],
                  ),
                  if (record.dateCreate != null) gapH2,
                  if (record.dateCreate != null)
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
            gapW20,
            if (record.statut == 'Affecte')
              Expanded(
                child: Column(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.variantGreenColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 9)),
                        onPressed: () async {
                          final progress = ProgressHUD.of(_);
                          progress?.show();

                          ref
                              .read(deliveryOrdersNotifierProvider.notifier)
                              .acceptDeliveryOrder(record.id!)
                              .whenComplete(() => progress?.dismiss());
                        },
                        child: Text(
                          context.locale.accept,
                          style: const TextStyle(fontSize: 10),
                        )),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 9)),
                      onPressed: () async {
                        final progress = ProgressHUD.of(_);
                        progress?.show();

                        ref
                            .read(deliveryOrdersNotifierProvider.notifier)
                            .denyDeliveryOrder(record.id!)
                            .whenComplete(() => progress?.dismiss());
                      },
                      child: Text(
                        context.locale.deny,
                        style: const TextStyle(
                            fontSize: 10, color: AppColors.alertError),
                      ),
                    ),
                  ],
                ),
              )
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

class SearchFilterWidget extends ConsumerStatefulWidget {
  const SearchFilterWidget({
    super.key,
  });

  @override
  ConsumerState createState() => _SearchFilterWidgetState();
}

class _SearchFilterWidgetState extends ConsumerState<SearchFilterWidget> {
  OrderStatus? status;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Dialog(
                backgroundColor: AppColors.whiteColor,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Status de la livraison'),
                          gapH12,
                          CustomDropdown<OrderStatus>(
                              hintText: 'Statut de la livraison',
                              decoration: CustomDropdownDecoration(
                                  closedShadow: [
                                    const BoxShadow(
                                        color: Colors.white, spreadRadius: 5),
                                  ],
                                  closedBorder:
                                      Border.all(color: AppColors.bgGreyD),
                                  closedBorderRadius: BorderRadius.circular(8),
                                  hintStyle: Theme.of(context)
                                      .inputDecorationTheme
                                      .hintStyle,
                                  headerStyle: GoogleFonts.urbanist(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                            color: AppColors.blackColor,
                                          )
                                          .color),
                                  closedFillColor: Theme.of(context)
                                      .inputDecorationTheme
                                      .fillColor),
                              items: OrderStatus.values,
                              listItemBuilder: (context, q, val, func) =>
                                  Text(q.name),
                              headerBuilder: (context, val) => Text(val.name),
                              onChanged: (elt) {
                                setState(() {
                                  status = elt;
                                });
                              }),
                          gapH12,
                          gapH12,
                          ElevatedButton(
                              onPressed: () {
                                final progress = ProgressHUD.of(_);
                                progress?.show();
                                ref
                                    .read(
                                        deliveryOrdersNotifierProvider.notifier)
                                    .findOrders([
                                  FilterOptional(
                                    type: "EQUAL",
                                    key: "statut",
                                    value: status!.value,
                                  ),
                                ], PaginatedRequest(size: 20)).whenComplete(() {
                                  progress!.dismiss();
                                  Navigator.of(context).pop(true);
                                });
                              },
                              child: Text(context.locale.search))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })));
  }
}

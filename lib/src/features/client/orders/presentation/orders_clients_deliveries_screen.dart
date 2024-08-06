import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../router/app_router.dart';
import '../../../core/domain/enum.dart';
import '../../../core/domain/paginated_request.dart';
import '../../../core/infrastructure/constants/app_sizes.dart';
import '../../../core/infrastructure/extensions/localization_extension.dart';
import '../../../core/infrastructure/services/local/shared_pref.dart';
import '../../../core/infrastructure/utils/extension.dart';
import '../../../core/presentation/themes/app_colors.dart';
import '../../../core/presentation/widgets/app_bars.dart';
import '../../../core/presentation/widgets/no_data.dart';
import '../../../core/presentation/widgets/refeshing_indicator.dart';
import '../../home/domain/current_cart_response.dart';
import '../../home/domain/filter_optional.dart';
import '../share/provider.dart';

@RoutePage()
class OrderClientDeliveriesScreen extends StatefulHookConsumerWidget {
  const OrderClientDeliveriesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OrderClientDeliveriesScreenState();
}

class _OrderClientDeliveriesScreenState
    extends ConsumerState<OrderClientDeliveriesScreen> {
  PaginatedRequest params = PaginatedRequest(page: 0, size: 20);

  List<FilterOptional> filter = [
    FilterOptional.fromJson(
      {
        "key": "code",
        "aliasKey": "client.id",
        "value": SharedPref.getId(),
        "type": "EQUAL",
        "applyAnd": true,
      },
    ),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _onTabsRouterChange();
    });
    super.initState();
  }

  Future _onTabsRouterChange() async {
    final PaginatedRequest localPage = PaginatedRequest(page: 0, size: 20);
    await ref.read(clientOrdersNotifierProvider.notifier).fetchDeliveryOrders(
          params: localPage,
          filterOption: filter,
        );
    setState(() {
      params = localPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deliveryOrders = ref.watch(clientOrdersNotifierProvider);
    final controller = useScrollController();
    final isSearch = useState(false);
    final searchInputController = useTextEditingController();
    final isFilter = useState(false);

    controller.addListener(() async {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (ref.watch(clientOrdersNotifierProvider).hasValue &&
            (ref.watch(clientOrdersNotifierProvider).value!.hasMore) &&
            !(ref.watch(clientOrdersNotifierProvider).value!.isLoadingMore)) {
          await ref
              .read(clientOrdersNotifierProvider.notifier)
              .fetchDeliveryOrders(
                params: params.copyWith(page: params.page + 1),
                filterOption: filter,
                isMore: true,
              )
              .whenComplete(() {
            if (!(ref
                .watch(clientOrdersNotifierProvider)
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
            child: Builder(builder: (_) {
              return Scaffold(
                appBar: CustomAppBar(
                  canPop: false,
                  title: context.locale.orders,
                ),
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
                        : RefreshIndicator(
                            onRefresh: _onTabsRouterChange,
                            child: RefeshingIndicator(
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
                                        context.locale.clearFilter,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: AppColors.primaryColor),
                                      ),
                                    ),
                                  ],
                                  ...response.data
                                      .map((e) => orderItem(e))
                                      .toList(),
                                  gapH10,
                                  if (((ref
                                              .watch(
                                                  clientOrdersNotifierProvider)
                                              .value
                                              ?.hasMore ??
                                          false) ||
                                      (ref
                                              .watch(
                                                  clientOrdersNotifierProvider)
                                              .value
                                              ?.isLoadingMore ??
                                          false)))
                                    const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  if ((ref
                                          .watch(clientOrdersNotifierProvider)
                                          .value
                                          ?.hasErrorOnLoadMore ??
                                      false))
                                    Center(
                                      child: IconButton(
                                        icon: const Icon(Icons.refresh),
                                        onPressed: () async {
                                          await ref
                                              .read(clientOrdersNotifierProvider
                                                  .notifier)
                                              .fetchDeliveryOrders(
                                                  params: params.copyWith(
                                                      page: params.page + 1),
                                                  filterOption: filter,
                                                  isMore: true)
                                              .whenComplete(() {
                                            if (!(ref
                                                .watch(
                                                    clientOrdersNotifierProvider)
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
                                ],
                              ),
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
              );
            })));
  }

  Widget orderItem(CurrentCartResponse record) {
    return InkWell(
      onTap: () {
        context.pushRoute(ClientOrderDetailRoute(data: record));
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
                Text(
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
                        fontWeight: FontWeight.bold))
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
                    'Date',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.greyTextColor),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                      record.dateCreate is String
                          ? formatToHumanFriendly(
                              DateTime.parse(record.dateCreate!))
                          : '',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
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

class SearchFilterWidget extends ConsumerStatefulWidget {
  const SearchFilterWidget({
    super.key,
  });

  @override
  ConsumerState createState() => _SearchFilterWidgetState();
}

class _SearchFilterWidgetState extends ConsumerState<SearchFilterWidget> {
  OrderStatus? status;
  PaginatedRequest params = PaginatedRequest(page: 0, size: 20);

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
                          Text(context.locale.deliveryStatus),
                          gapH12,
                          CustomDropdown<OrderStatus>(
                              hintText: context.locale.deliveryStatus,
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
                                    .read(clientOrdersNotifierProvider.notifier)
                                    .fetchDeliveryOrders(
                                        params: params,
                                        filterOption: [
                                      FilterOptional.fromJson({
                                        "key": "code",
                                        "value": SharedPref.getEmail() ?? "",
                                        "type": "EQUAL",
                                        "aliasKey": "commande.client.user"
                                      }),
                                      FilterOptional(
                                          type: "EQUAL",
                                          key: "statut",
                                          value: status!.value,
                                          applyAnd: true),
                                    ]).whenComplete(() {
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

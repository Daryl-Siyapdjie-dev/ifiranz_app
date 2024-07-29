import 'package:auto_route/auto_route.dart';

import '../../../../../core/domain/paginated_request.dart';
import '../../../../../core/infrastructure/constants/app_sizes.dart';
import '../../../../../core/infrastructure/utils/common_import.dart';
import '../../../../../core/presentation/themes/app_colors.dart';
import '../../../../../core/presentation/widgets/app_bars.dart';
import '../../../../../core/presentation/widgets/no_data.dart';
import '../../../../../delivery/orders/presentation/widget/delivery_drawer_widget.dart';
import '../domain/transaction_response.dart';
import '../shared/providers.dart';

@RoutePage()
class MerchandDashboardTransactionScreen extends StatefulHookConsumerWidget {
  const MerchandDashboardTransactionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MerchandDashboardTransactionScreenState();
}

class _MerchandDashboardTransactionScreenState
    extends ConsumerState<MerchandDashboardTransactionScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PaginatedRequest params = PaginatedRequest(page: 0, size: 7);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.microtask(() {
        ref
            .refresh(merchandDashBoardTransactionsNotifierProvider.notifier)
            .fetchDeals(params);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orders = ref.watch(merchandDashBoardTransactionsNotifierProvider);
    final controller = useScrollController();
    final isLoadingMore = useState(false);

    controller.addListener(() async {
      if (controller.position.maxScrollExtent == controller.position.pixels &&
          !isLoadingMore.value) {
        if (ref.watch(merchandDashBoardTransactionsNotifierProvider).hasValue &&
            (ref
                            .watch(
                                merchandDashBoardTransactionsNotifierProvider)
                            .value
                            ?.data
                            .length ??
                        -1) %
                    params.size ==
                0) {
          isLoadingMore.value = true;

          await ref
              .read(merchandDashBoardTransactionsNotifierProvider.notifier)
              .fetchDeals(params.copyWith(page: params.page + 1), isMore: true)
              .then((value) {
            if (orders.value?.hasErrorOnLoadMore == false &&
                orders.value?.isLoadingMore == true) {
              setState(() {
                params = params.copyWith(page: params.page + 1);
              });
            }
          });

          isLoadingMore.value = false;
        }
      }
    });
    return RefreshIndicator(
      onRefresh: () => ref
          .read(merchandDashBoardTransactionsNotifierProvider.notifier)
          .fetchDeals(PaginatedRequest(page: 0, size: 7)),
      child: Scaffold(
          key: _scaffoldKey,
          appBar: const CustomMarchandAppBar(
            title: 'Transactions',
          ),
          body: orders.when(
            data: (response) {
              return response.data.isEmpty
                  ? const NoData(
                      text: "No Data found",
                    )
                  : ListView(
                      controller: controller,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        ...response.data.map((e) => clientItem(e)).toList(),
                        if ((orders.value?.data.length ?? 0) % params.size == 0)
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 25),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        if (orders.value?.hasErrorOnLoadMore == true)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  ref
                                      .read(
                                          merchandDashBoardTransactionsNotifierProvider
                                              .notifier)
                                      .fetchDeals(
                                          params.copyWith(page: params.page));
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
              child: IconButton(
                onPressed: () {
                  ref
                      .read(merchandDashBoardTransactionsNotifierProvider
                          .notifier)
                      .fetchDeals(params.copyWith(page: 0));
                },
                icon: const Icon(Icons.refresh),
              ),
            )),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          drawer: const DeliveryDrawerWidget()),
    );
  }

  Widget clientItem(TransactionResponse item) {
    return InkWell(
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
                  Text(
                    '#${item.code ?? ""}',
                    style: const TextStyle(color: AppColors.blackColor),
                  ),
                  gapH2,
                  Row(
                    children: [
                      Text(
                        "IDOperateur:",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.greyTextColor),
                      ),
                      gapW10,
                      Expanded(
                        child: Text(item.idOperator ?? "",
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
                        "DateTime:",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.greyTextColor),
                      ),
                      gapW10,
                      Expanded(
                        child: Text('${item.date ?? ""} - ${item.time ?? ''}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.blackColor)),
                      ),
                    ],
                  ),
                  gapH2,
                  gapH2,
                  Row(
                    children: [
                      Text(
                        "Status:",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.greyTextColor),
                      ),
                      gapW10,
                      Expanded(
                        child: Text(item.status ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color: item.status?.toLowerCase() == "success"
                                      ? AppColors.primaryColor
                                      : item.status?.toLowerCase() == "pending"
                                          ? AppColors.alertInfo
                                          : AppColors.errorColor,
                                )),
                      ),
                    ],
                  ),
                  gapH2,
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
                        child: Text('${item.total ?? ""} XAF',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.blackColor)),
                      ),
                    ],
                  ),
                  gapH2,
                ])));
  }
}

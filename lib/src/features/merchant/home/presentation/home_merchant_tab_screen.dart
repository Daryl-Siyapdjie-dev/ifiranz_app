import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ifiranz_client/src/features/auth/core/shared/provider.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/media_query_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/common_import.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/merchant/core/presentation/widget/order_drawer_widget.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/clients/shared/providers.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/core/shared/provider.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/delivery/shared/providers.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/inventory/shared/providers.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

@RoutePage()
class HomeMerchantTabScreen extends StatefulHookConsumerWidget {
  const HomeMerchantTabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeMerchantTabScreenState();
}

class _HomeMerchantTabScreenState extends ConsumerState<HomeMerchantTabScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isRefrechin = false;
  PaginatedRequest params = PaginatedRequest(page: 0, size: 10);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _onTabsRouterChange();
    });
    super.initState();
  }

  Future _onTabsRouterChange() async {
    setState(() {
      isRefrechin = true;
    });
    await ref.read(merchandClientsNotifierProvider.notifier).fetchDeliveryOrders(params);

    await ref.read(merchandDashBoardDeliveryNotifierProvider.notifier).fetchDeals(params);

    await ref.read(merchandInventoryNotifierProvider.notifier).fetchDeliveryOrders(params);

    await ref.read(merchantDashboardCountTransactionsProvider.future);

    setState(() {
      isRefrechin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final merchand = ref.watch(currentMarchandNotifierProvider);
    final delivery = ref.watch(merchandDashBoardDeliveryNotifierProvider);
    final transactions = ref.watch(merchantDashboardCountTransactionsProvider);
    final clients = ref.watch(merchandClientsNotifierProvider);
    final inventory = ref.watch(merchandInventoryNotifierProvider);
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomMarchandAppBar(isHome: true, scaffoldKey: _scaffoldKey, actionnable: true),
      drawer: const OrdinaryDrawerWidget(),
      body: ListView(
        padding: const EdgeInsets.only(top: 25, left: 14),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              '${context.locale.merchandHomeScreenWelcome} ${merchand.value?.designation ?? ""}!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
            ),
          ),
          gapH8,
          const FirstWidget(),
          gapH25,
          Text(context.locale.merchandHomeScreenDashboard, style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16)),
          gapH16,
          Row(
            children: [
              dashboardItem(
                  nbre: clients,
                  onTap: () {
                    context.pushRoute(const MerchandClientRoute());
                  },
                  color: AppColors.alertInfo,
                  title: context.locale.merchandHomeScreenClients,
                  imageBg: 'assets/icons/liquid-cheese.svg',
                  imageFg: 'assets/icons/streamline_shopping-bag-hand-bag-1-shopping-bag-purse-goods-item-products-2.svg'),
              dashboardItem(
                  nbre: delivery,
                  onTap: () {
                    context.pushRoute(const MerchandDashboardDashboardDeliveryRoute());
                  },
                  title: context.locale.merchandHomeScreenDeliveries,
                  color: AppColors.primaryColor,
                  imageBg: 'assets/icons/liquid-cheese-2.svg',
                  imageFg: 'assets/icons/Vector-2.svg'),
            ],
          ),
          gapH25,
          Row(
            children: [
              dashboardItem(
                  nbre: inventory,
                  onTap: () {
                    context.pushRoute(const MerchandInventoryRoute());
                  },
                  color: AppColors.variantPinkColor,
                  title: context.locale.merchandHomeScreenInventory,
                  imageBg: 'assets/icons/liquid-cheese-5.svg',
                  imageFg: 'assets/icons/Vector.svg'),
              dashboardTransactionItem(
                  nbre: transactions,
                  onTap: () {
                    context.pushRoute(const MerchandDashboardTransactionRoute());
                  },
                  title: context.locale.merchandHomeScreenTransactions,
                  color: AppColors.variantGreenColor,
                  imageBg: 'assets/icons/liquid-cheese-4.svg',
                  imageFg: 'assets/icons/Group 1103.svg')
            ],
          ),
          gapH25,
          gapH25
        ],
      ),
    );
  }

  Expanded dashboardItem(
      {required AsyncValue<PaginatedResponse> nbre,
      required String imageBg,
      required String imageFg,
      required String title,
      required Color color,
      VoidCallback? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.only(top: 11, bottom: 21),
            margin: const EdgeInsets.only(top: 10, right: 20, left: 4),
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(0, 4),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset(
                      imageBg,
                      height: 60,
                      width: 60,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      imageFg,
                      height: 30,
                      width: 30,
                    ),
                  )
                ],
              ),
              gapH16,
              nbre.hasError
                  ? IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        ref.read(merchandClientsNotifierProvider.notifier).fetchDeliveryOrders(params);

                        ref.read(merchandDashBoardDeliveryNotifierProvider.notifier).fetchDeals(params);

                        ref.read(merchandInventoryNotifierProvider.notifier).fetchDeliveryOrders(params);
                      },
                    )
                  : nbre.isLoading
                      ? const SizedBox(
                          width: 30,
                          child: LinearProgressIndicator(),
                        )
                      : Text(nbre.value?.totalPages.toString() ?? "",
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 20, color: color)),
              Text(title,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 14, color: Theme.of(context).textTheme.bodyMedium!.color)),
            ])),
      ),
    );
  }

  Expanded dashboardTransactionItem(
      {required AsyncValue<int> nbre,
      required String imageBg,
      required String imageFg,
      required String title,
      required Color color,
      VoidCallback? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.only(top: 11, bottom: 21),
            margin: const EdgeInsets.only(top: 10, right: 20, left: 4),
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(0, 4),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset(
                      imageBg,
                      height: 60,
                      width: 60,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      imageFg,
                      height: 30,
                      width: 30,
                    ),
                  )
                ],
              ),
              gapH16,
              nbre.hasError
                  ? IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () => ref.refresh(merchantDashboardCountTransactionsProvider.future),
                    )
                  : nbre.isLoading
                      ? const SizedBox(
                          width: 30,
                          child: LinearProgressIndicator(),
                        )
                      : Text(nbre.value.toString(), style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 20, color: color)),
              Text(title,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 14, color: Theme.of(context).textTheme.bodyMedium!.color)),
            ])),
      ),
    );
  }
}

class FirstWidget extends StatelessWidget {
  const FirstWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, left: 17, bottom: 31),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.locale.merchandHomeScreenWhatsIfiranz, style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(bottom: 33, top: 8),
                child: Text(
                  context.locale.merchandHomeScreenHandsOn,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 28, color: AppColors.primaryColor),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  backgroundColor: AppColors.variantGreenColor.withOpacity(.2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(120, 28),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Text(context.locale.merchandHomeScreeHeyBro,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.blackColor, fontSize: 14)),
                    gapW4,
                    Container(
                        decoration: const BoxDecoration(color: AppColors.variantGreenColor, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.play_arrow,
                          size: 18,
                        )),
                  ],
                ),
              )
            ],
          ),
          gapW10,
          SvgPicture.asset(
            "assets/icons/illustration marchand.svg",
            height: context.proportionnalHeight(168),
          )
        ],
      ),
    );
  }
}

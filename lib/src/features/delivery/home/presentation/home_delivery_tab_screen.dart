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
import 'package:ifiranz_client/src/features/delivery/orders/presentation/widget/delivery_drawer_widget.dart';
import 'package:ifiranz_client/src/features/delivery/orders/shared/providers.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

@RoutePage()
class HomeDeliveryTabScreen extends StatefulHookConsumerWidget {
  const HomeDeliveryTabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeDeliveryTabScreenState();
}

class _HomeDeliveryTabScreenState extends ConsumerState<HomeDeliveryTabScreen> {
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
    await ref.read(deliveryOrdersNotifierProvider.notifier).fetchDeliveryOrders(params);

    await ref.read(deliveryDashboardOrdersNotifierProvider.notifier).fetchDeliveryOrders(params);

    setState(() {
      isRefrechin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deliveryOrders = ref.watch(deliveryOrdersNotifierProvider);
    final deliveryDashOrders = ref.watch(deliveryDashboardOrdersNotifierProvider);
    final livreur = ref.watch(currentDeliverNotifierProvider);

    return RefreshIndicator(
      onRefresh: () => Future.microtask(() {
        ref.refresh(deliveryOrdersNotifierProvider.notifier).fetchDeliveryOrders(params);
        ref.refresh(deliveryDashboardOrdersNotifierProvider.notifier).fetchDeliveryOrders(params);
      }),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomDeliveryAppBar(scaffoldKey: _scaffoldKey),
        drawer: const DeliveryDrawerWidget(),
        body: ListView(
          padding: const EdgeInsets.only(top: 25, left: 14),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                '${context.locale.merchandHomeScreenWelcome} ${'${livreur.value?.nom ?? ""} ${livreur.value?.prenom ?? ""}'}',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
              ),
            ),
            gapH8,
            Stack(
              children: [
                const FirstWidget(),
                Positioned(
                  right: 0,
                  child: Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/icons/livreur.svg',
                        height: context.proportionnalHeight(220),
                        fit: BoxFit.contain,
                      )),
                )
              ],
            ),
            gapH25,
            Text(context.locale.merchandHomeScreenDashboard, style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16)),
            gapH16,
            Row(
              children: [
                dashboardItem(
                    nbre: deliveryOrders,
                    onTap: () {
                      context.navigateTo(const OrderLayoutRoute(children: [OrderDeliveryTabRoute()]));
                    },
                    color: AppColors.alertInfo,
                    title: context.locale.orders,
                    imageBg: 'assets/icons/liquid-cheese.svg',
                    imageFg: 'assets/icons/Group 1101.svg'),
                dashboardItem(
                    nbre: deliveryDashOrders,
                    onTap: () {
                      context.navigateTo(const DashboardDeliveryTabRoute());
                    },
                    title: context.locale.delivery,
                    color: AppColors.primaryColor,
                    imageBg: 'assets/icons/liquid-cheese-2.svg',
                    imageFg: 'assets/icons/Group 1099.svg')
              ],
            ),
            gapH25,
            gapH25
          ],
        ),
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
                      onPressed: () {},
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.locale.deliveryTodayClanhhenge, style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 14)),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    context.locale.percentOff(10),
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 28,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = AppColors.primaryColor,
                        decoration: TextDecoration.none,
                        shadows: const [
                          Shadow(offset: Offset(-1.5, -1.5), color: Colors.white),
                          Shadow(offset: Offset(1.5, -1.5), color: Colors.white),
                          Shadow(offset: Offset(1.5, 1.5), color: Colors.white),
                          Shadow(offset: Offset(-1.5, 1.5), color: Colors.white),
                        ]),
                  ),
                ),
              ),
              gapW4,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 21),
                    child: Text(
                      context.locale.percentOn(10),
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 28, color: AppColors.primaryColor),
                    ),
                  ),
                  Text(context.locale.promoDeliveryMessage, style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 14))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

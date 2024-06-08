import 'package:auto_route/auto_route.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/common_import.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/delivery/home/presentation/dashboard/widget/investor_chart_widget.dart';
import 'package:ifiranz_client/src/features/delivery/orders/presentation/widget/delivery_drawer_widget.dart';

@RoutePage()
class DashboardInventoryScreen extends StatefulHookConsumerWidget {
  const DashboardInventoryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardInventoryScreenState();
}

class _DashboardInventoryScreenState extends ConsumerState<DashboardInventoryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomDeliveryAppBar(title: 'Inventory', scaffoldKey: _scaffoldKey),
      drawer: const DeliveryDrawerWidget(),
      body: ListView(
        children: [
          const InvestorChartWidget(),
          gapH10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('History'),
                gapH8,
                const Divider(
                  height: 2,
                  color: AppColors.greyTextColor,
                ),
                ...List.generate(8, (index) => inventorItemWidget())
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget inventorItemWidget() {
    return InkWell(
      onTap: () {
        // context.pushRoute(const DeliveryOrderDetailRoute());
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '#2376',
                  style: TextStyle(color: AppColors.blackColor),
                ),
                gapH2,
                Text('Taro chicken with pepper', style: Theme.of(context).textTheme.bodySmall),
                gapH2,
                Text('Damas takam avenue < 5km ', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.blackColor)),
                gapH2,
                Text(
                  '3500 XAF',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(color: AppColors.variantGreenColor),
                )
              ],
            ),
            gapW20,
            Expanded(
              child: Column(
                children: [
                  const Text(
                    '24/06/23 , 16:23',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  gapH20,
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.variantGreenColor.withOpacity(.6), padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9)),
                      onPressed: () {},
                      child: const Text(
                        'Delivered',
                        style: TextStyle(fontSize: 10),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

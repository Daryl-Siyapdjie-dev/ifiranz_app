import 'package:auto_route/auto_route.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/delivery/home/presentation/dashboard/widget/bonus_chat_widget.dart';
import 'package:ifiranz_client/src/features/delivery/orders/presentation/widget/delivery_drawer_widget.dart';

import '../../../../core/infrastructure/utils/common_import.dart';

@RoutePage()
class DashboardBonusScreen extends StatefulHookConsumerWidget {
  const DashboardBonusScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardBonusScreenState();
}

class _DashboardBonusScreenState extends ConsumerState<DashboardBonusScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> options = ['Week', 'Month', 'Year'];
  late String selectedOption = options.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomDeliveryAppBar(title: 'Bonus', scaffoldKey: _scaffoldKey),
      drawer: const DeliveryDrawerWidget(),
      body: ListView(
        children: [
          const BonusChartWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Most rated deliver',
                      style: TextStyle(color: AppColors.blackColor),
                    ),
                    const Spacer(),
                    DropdownButton<String>(
                      value: selectedOption,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 24,
                      elevation: 16,
                      underline: Container(height: 0),
                      onChanged: (newValue) {
                        setState(() {
                          selectedOption = newValue!;
                        });
                      },
                      items: options.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const Divider(
                  height: 2,
                  color: AppColors.greyTextColor,
                ),
                gapH10,
                const Row(
                  children: [
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(left: 40 - 24),
                            child: Text(
                              'Name',
                              style: TextStyle(fontSize: 10),
                            ))),
                    Spacer(),
                    Text(
                      'total',
                      style: TextStyle(fontSize: 10),
                    ),
                    gapW32,
                    gapW16,
                    Padding(
                        padding: EdgeInsets.only(right: 50 - 24),
                        child: Text(
                          'Star',
                          style: TextStyle(fontSize: 10),
                        ))
                  ],
                ),
                gapH8,
                ...List.generate(10, (index) => bonusItemWidget(context))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container bonusItemWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 10, left: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.bgGreyContainer),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                  height: 35,
                  margin: const EdgeInsets.only(
                    right: 16,
                  ),
                  width: 35,
                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/fake_profile.png")))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deliver at kimia',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    'Takam jofroid',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            '15',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          gapW32,
          gapW6,
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(8)),
              child: const Row(
                children: [
                  Text(
                    'Star',
                    style: TextStyle(fontSize: 10, color: AppColors.whiteColor),
                  ),
                  Icon(
                    Icons.star,
                    size: 12,
                    color: AppColors.whiteColor,
                  )
                ],
              ))
        ],
      ),
    );
  }
}

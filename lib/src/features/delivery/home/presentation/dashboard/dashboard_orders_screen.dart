import 'package:auto_route/auto_route.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/common_import.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';

@RoutePage()
class DashboardOrdersScreen extends StatefulHookConsumerWidget {
  const DashboardOrdersScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardOrdersScreenState();
}

class _DashboardOrdersScreenState extends ConsumerState<DashboardOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomDeliveryAppBar(
          isHome: false,
          title: 'Delivery',
          action: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.tune,
                color: AppColors.variantGreenColor,
              ))),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 24),
        children: [...List.generate(12, (index) => orderItem())],
      ),
    );
  }

  Container orderItem() {
    return Container(
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
          const Spacer(),
          Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9)),
                onPressed: () {},
                child: const Text(
                  'Follow',
                  style: TextStyle(fontSize: 10),
                )),
          )
        ],
      ),
    );
  }
}

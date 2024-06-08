import 'package:auto_route/auto_route.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';

import '../../../core/infrastructure/utils/common_import.dart';

@RoutePage()
class AdditionalInfoScreen extends StatefulHookConsumerWidget {
  const AdditionalInfoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdditionalInfoScreenState();
}

class _AdditionalInfoScreenState extends ConsumerState<AdditionalInfoScreen> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Additional option'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Row(
            children: [
              stepper(currentPage >= 1, '1'),
              stepper(currentPage >= 2, '2'),
              stepper(currentPage >= 3, '3'),
            ],
          ),
          gapH32,
          switch (currentPage) { 1 => item1(), 2 => item2(), 3 => item3(), _ => Container() },
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: ElevatedButton(
            onPressed: () {
              if (currentPage < 1 || currentPage > 3) {
                return;
              }
              currentPage++;
              setState(() {});
            },
            child: const Text('Next'),
          ),
        ),
      ),
    );
  }

  Expanded stepper(bool isActive, String text) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
              child: Divider(
            color: isActive ? AppColors.primaryColor : AppColors.bgGreyIcon,
          )),
          Container(
              height: 20,
              width: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(shape: BoxShape.circle, color: isActive ? AppColors.primaryColor : AppColors.bgGreyIcon),
              child: Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold, color: isActive ? AppColors.whiteColor : null, fontSize: 12),
              )),
          Expanded(
              child: Divider(
            color: isActive ? AppColors.primaryColor : AppColors.bgGreyIcon,
          )),
        ],
      ),
    );
  }

  Column item1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('How old are you in this range group?'),
        gapH25,
        selectorItem(text: '15 - 25'),
        gapH25,
        selectorItem(text: '25 - 35'),
        gapH25,
        selectorItem(text: '35 - 45'),
        gapH25,
        selectorItem(text: '45 - 60'),
      ],
    );
  }

  Column item2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('How old are you in this range group?'),
        gapH25,
        selectorItem(child: const Icon(Icons.lunch_dining), text: '15 - 25'),
        gapH25,
        selectorItem(child: const Icon(Icons.lunch_dining), text: '25 - 35'),
        gapH25,
        selectorItem(child: const Icon(Icons.lunch_dining), text: '35 - 45'),
        gapH25,
        selectorItem(child: const Icon(Icons.lunch_dining), text: '45 - 60'),
      ],
    );
  }

  Column item3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('How old are you in this range group?'),
        gapH25,
        selectorItem(child: const Icon(Icons.credit_card), text: 'Low Carb Diet'),
        gapH25,
        selectorItem(child: const Icon(Icons.credit_card), text: 'No sugar DIet'),
        gapH25,
        selectorItem(child: const Icon(Icons.credit_card), text: 'Paleo Diet'),
        gapH25,
        selectorItem(child: const Icon(Icons.credit_card), text: 'Vegan Diet'),
      ],
    );
  }

  Container selectorItem(
      {Widget child = const Icon(
        Icons.person_outline,
      ),
      required String text}) {
    return Container(
      decoration: BoxDecoration(color: AppColors.bgGreyLike, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Radio(groupValue: "pro", value: false, onChanged: (onChanged) {}),
          child,
          const Spacer(),
          Text(text),
          gapW20,
          gapW20,
        ],
      ),
    );
  }
}

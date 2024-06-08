import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_route/annotations.dart';
import 'package:ifiranz_client/src/features/core/application/language_notifier.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';

import '../../infrastructure/services/local/shared_pref.dart';
import '../../infrastructure/utils/common_import.dart';
import '../themes/app_colors.dart';
import 'app_bars.dart';

@RoutePage()
class LanguageSelectorScreen extends ConsumerStatefulWidget {
  const LanguageSelectorScreen({super.key});

  @override
  ConsumerState createState() => _LanguageSelectorScreenState();
}

class _LanguageSelectorScreenState extends ConsumerState<LanguageSelectorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleBackAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          gapH20,
          gapH20,
          Text(context.locale.changeLanguge),
          gapH20,
          CustomDropdown(
            hintText: context.locale.selectLanguage,
            initialItem: context.locale.localeName == "fr" ? "Français" : "English",
            decoration: CustomDropdownDecoration(
                closedShadow: [
                  const BoxShadow(color: Colors.white, spreadRadius: 5),
                ],
                closedBorder: Border.all(color: AppColors.bgGreyD),
                closedBorderRadius: BorderRadius.circular(8),
                hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                listItemStyle: Theme.of(context).textTheme.bodySmall,
                headerStyle: GoogleFonts.urbanist(
                    color: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(
                          color: AppColors.blackColor,
                        )
                        .color),
                closedFillColor: Theme.of(context).inputDecorationTheme.fillColor),
            items: const ["Français", "English"],
            onChanged: (e) {
              debugPrint(e);
              ref.read(languageNotifierProvider(SharedPref.getLocale()).notifier).changeLocale(e == "Français" ? "fr" : "en");
            },
          ),
          gapH20,
          ElevatedButton(
              onPressed: () {
                SharedPref.setLocale(context.locale.localeName == "fr" ? "fr" : "en");
                showSuccessFlushbar(context, context.locale.foodDetailsScreenOperationSuccess);
              },
              child: Text(context.locale.save))
        ],
      ),
    );
  }
}

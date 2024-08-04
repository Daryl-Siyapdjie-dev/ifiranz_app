import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:upgrader/upgrader.dart';

import '../../router/app_router.dart';
import '../core/infrastructure/extensions/localization_extension.dart';
import '../core/infrastructure/utils/common_import.dart';
import '../core/presentation/themes/app_colors.dart';

@RoutePage()
class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final iconsList = <String>[
    "assets/icons/ic_baseline-home.svg",
    "assets/icons/ic_baseline-orders.svg",
    "assets/icons/ic_baseline-delivery.svg",
  ];

  late final titleList = <String>[
    context.locale.home,
    context.locale.orders,
    context.locale.merchandHomeScreenDeliveries,
  ];

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      upgrader: Upgrader(
        dialogStyle: Platform.isIOS
            ? UpgradeDialogStyle.cupertino
            : UpgradeDialogStyle.material,
        shouldPopScope: () => true,
        canDismissDialog: true,
        showReleaseNotes: false,
        willDisplayUpgrade: ({
          String? appStoreVersion,
          bool display = true,
          String? installedVersion,
          String? minAppVersion,
        }) async {
          // ref
          //     .read(userPreferenceNotifierProvider.notifier)
          //     .saveUserAppVersion(installedVersion);
        },
        showIgnore: false,
        durationUntilAlertAgain: const Duration(seconds: 30),
        languageCode: context.locale.localeName,
        messages: UpgraderMessages(
          code: context.locale.localeName,
        ),
      ),
      child: AutoTabsScaffold(
        scaffoldKey: _scaffoldKey,
        inheritNavigatorObservers: false,
        lazyLoad: true,
        routes: const [
          HomeRoute(),
          OrderClientDeliveriesRoute(),
          ClientDeliveryLayoutRoute()
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -8),
                  blurRadius: 24,
                  color: AppColors.primaryShadow,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                elevation: 0,
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) {
                  if (index < 3) {
                    tabsRouter.setActiveIndex(index);
                  }
                },
                items: [
                  bottomNavBarItem(tabsRouter.activeIndex, 0),
                  bottomNavBarItem(tabsRouter.activeIndex, 1),
                  bottomNavBarItem(tabsRouter.activeIndex, 2),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem bottomNavBarItem(int state, int index) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Offstage(
            offstage: state != index,
            child: const Row(
              children: [
                Spacer(),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: AppColors.primaryColor,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          SvgPicture.asset(
            index == 0 && index != state
                ? "assets/icons/ic_baseline-home-outline.svg"
                : iconsList[index],
            colorFilter: ColorFilter.mode(
                state == index
                    ? AppColors.primaryColor
                    : AppColors.greyTextColor,
                BlendMode.srcIn),
          ),
        ],
      ),
      label: titleList[index],
    );
  }
}

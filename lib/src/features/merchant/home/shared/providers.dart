import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../bottom_navigation_router_notifier.dart';

final bottomNavigationRouterNotifierProvider =
    StateNotifierProvider.autoDispose<BottomNavigationRouterNotifier, int>(
        (ref) {
  return BottomNavigationRouterNotifier();
});

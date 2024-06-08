import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavigationRouterNotifier extends StateNotifier<int> {
  BottomNavigationRouterNotifier() : super(0);

  void resetTabState() => state = 0;

  int get currentIndex => state;

  void changeTab(int index) {
    state = index;
  }
}

final bottomNavigationRouterNotifier =
    StateNotifierProvider<BottomNavigationRouterNotifier, int>(
        (ref) => BottomNavigationRouterNotifier());

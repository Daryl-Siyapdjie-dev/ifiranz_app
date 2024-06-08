import 'package:auto_route/auto_route.dart';

import '../../../core/infrastructure/utils/common_import.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(body: AutoRouter());
  }
}

import 'package:auto_route/auto_route.dart';

import '../../../core/infrastructure/utils/common_import.dart';

@RoutePage()
class HomeMerchantScreen extends ConsumerWidget {
  const HomeMerchantScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(body: AutoRouter());
  }
}

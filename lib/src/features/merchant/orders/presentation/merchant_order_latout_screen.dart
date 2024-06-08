import 'package:auto_route/auto_route.dart';

import '../../../core/infrastructure/utils/common_import.dart';

@RoutePage()
class MerchantOrderLayoutScreen extends ConsumerWidget {
  const MerchantOrderLayoutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(body: AutoRouter());
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/common_import.dart';

@RoutePage()
class DashboardDeliveryScreen extends StatefulHookConsumerWidget {
  const DashboardDeliveryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardDeliveryScreenState();
}

class _DashboardDeliveryScreenState
    extends ConsumerState<DashboardDeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

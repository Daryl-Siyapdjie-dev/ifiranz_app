import 'package:auto_route/auto_route.dart';

import '../../../core/infrastructure/utils/common_import.dart';

@RoutePage()
class DeliveryLayoutScreen extends StatefulHookConsumerWidget {
  const DeliveryLayoutScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DeliveryLayoutScreenState();
}

class _DeliveryLayoutScreenState extends ConsumerState<DeliveryLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AutoRouter());
  }
}

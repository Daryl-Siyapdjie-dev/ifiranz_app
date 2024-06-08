import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/orders/application/clients_orders_notifier.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';

import '../../../merchant/orders/shared/providers.dart';
import '../../home/domain/current_cart_response.dart';

final clientOrdersNotifierProvider = StateNotifierProvider.autoDispose<
    ClientOrdersNotifier, AsyncValue<PaginatedResponse<CurrentCartResponse>>>((ref) {
  ref.keepAlive();
  return ClientOrdersNotifier(
    ref.watch(merchandOrdersRepositoryProvider),
  );
});

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../client/home/domain/current_cart_response.dart';
import '../../../core/domain/paginated_response.dart';
import '../../../core/shared/providers.dart';
import '../application/merchand_orders_notifier.dart';
import '../infrastructure/merchand_orders_remote_service.dart';
import '../infrastructure/merchand_orders_repository.dart';

final merchandOrdersRemoteService =
    Provider<MerchandOrdersRemoteService>((ref) {
  return MerchandOrdersRemoteService(
    ref.watch(urlBuilderProvider),
    ref.watch(dioProvider),
  );
});

final merchandOrdersRepositoryProvider =
    Provider<MerchandOrdersRepository>((ref) {
  return MerchandOrdersRepository(ref.watch(merchandOrdersRemoteService));
});

final getOrderProvider = FutureProvider.autoDispose
    .family<CurrentCartResponse, int>((ref, id) async {
  ref.keepAlive();
  return ref.read(merchandOrdersRepositoryProvider).getOrder(id);
});

final merchandOrdersNotifierProvider = StateNotifierProvider.autoDispose<
    MerchandOrdersNotifier,
    AsyncValue<PaginatedResponse<CurrentCartResponse>>>((ref) {
  ref.keepAlive();
  return MerchandOrdersNotifier(
    ref.watch(merchandOrdersRepositoryProvider),
  );
});

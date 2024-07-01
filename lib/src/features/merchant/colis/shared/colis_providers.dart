import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';

import '../../../core/domain/paginated_response.dart';
import '../application/marchand_colis_notifier.dart';
import '../instrastructure/service/merchand_colis_remote_service.dart';
import '../instrastructure/service/merchand_colis_repository.dart';

final merchandColisRemoteService = Provider<MerchandColisRemoteService>((ref) {
  return MerchandColisRemoteService(
    ref.watch(urlBuilderProvider),
    ref.watch(dioProvider),
  );
});

final merchandColisRepositoryProvider = Provider<ColisRepository>((ref) {
  return ColisRepository(ref.watch(merchandColisRemoteService));
});

final merchandColisNotifierProvider = StateNotifierProvider.autoDispose<MerchandColisNotifier, AsyncValue<PaginatedResponse<Commande>>>((ref) {
  ref.keepAlive();
  return MerchandColisNotifier(
    ref.watch(merchandColisRepositoryProvider),
  );
});

// final findByIdColisNotifierProvider = FutureProvider.autoDispose.family<Commande, int>((ref, id) {
//   if (!ref.state.hasError) {
//     ref.keepAlive();
//   }
//   return ref.watch(merchandColisRepositoryProvider).findById(id);
// });

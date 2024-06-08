import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/clients/application/merchand_clients_notifier.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/clients/infrastructure/merchand_clients_remote_service.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/clients/infrastructure/merchand_clients_repository.dart';

final merchandClientsRemoteService =
    Provider<MerchandClientsRemoteService>((ref) {
  return MerchandClientsRemoteService(
    ref.watch(urlBuilderProvider),
    ref.watch(dioProvider),
  );
});

final merchandClientsRepositoryProvider =
    Provider<MerchandClientsRepository>((ref) {
  return MerchandClientsRepository(ref.watch(merchandClientsRemoteService));
});

final merchandClientsNotifierProvider = StateNotifierProvider.autoDispose<
    MerchandClientsNotifier, AsyncValue<PaginatedResponse<Client>>>((ref) {
  ref.keepAlive();
  return MerchandClientsNotifier(
    ref.watch(merchandClientsRepositoryProvider),
  );
});

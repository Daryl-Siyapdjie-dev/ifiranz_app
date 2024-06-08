import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/inventory/application/merchand_inventory_notifier.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/inventory/domain/inventory.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/inventory/infrastructure/merchand_inventory_remote_service.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/inventory/infrastructure/merchand_inventory_repository.dart';

final merchandInventoryRemoteService =
    Provider<MerchandInventoryRemoteService>((ref) {
  return MerchandInventoryRemoteService(
    ref.watch(urlBuilderProvider),
    ref.watch(dioProvider),
  );
});

final merchandInventoryRepositoryProvider =
    Provider<MerchandInventoryRepository>((ref) {
  return MerchandInventoryRepository(ref.watch(merchandInventoryRemoteService));
});

final merchandInventoryNotifierProvider = StateNotifierProvider.autoDispose<
    MerchandInventoryNotifier, AsyncValue<PaginatedResponse<Inventory>>>((ref) {
  ref.keepAlive();
  return MerchandInventoryNotifier(
    ref.watch(merchandInventoryRepositoryProvider),
  );
});

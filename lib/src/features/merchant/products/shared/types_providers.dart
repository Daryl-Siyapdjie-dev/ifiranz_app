import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';
import 'package:ifiranz_client/src/features/delivery/orders/application/delivery_orders_notifier.dart';
import 'package:ifiranz_client/src/features/merchant/products/aplication/marchand_type_notifier.dart';
import 'package:ifiranz_client/src/features/merchant/products/domain/type/type_response.dart';
import 'package:ifiranz_client/src/features/merchant/products/infrastructure/merchand_type_products_remote_service.dart';
import 'package:ifiranz_client/src/features/merchant/products/infrastructure/merchand_type_repository.dart';

final merchandTypesRemoteService = Provider<MerchandTypesRemoteService>((ref) {
  return MerchandTypesRemoteService(
    ref.watch(urlBuilderProvider),
    ref.watch(dioProvider),
  );
});

final merchandTypesRepositoryProvider =
Provider<MerchandTypesRepository>((ref) {
  return MerchandTypesRepository(ref.watch(merchandTypesRemoteService));
});

final merchandTypesNotifierProvider = StateNotifierProvider.autoDispose<
    MerchandTypeNotifier,
    AsyncValue<PaginatedResponse<TypeResponse>>>((ref) {
  ref.keepAlive();
  return MerchandTypeNotifier(
    ref.watch(merchandTypesRepositoryProvider),
  );
});

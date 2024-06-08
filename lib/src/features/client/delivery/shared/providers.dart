import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/delivery/infrastructure/external_services/geolocation_service.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';

import '../../../delivery/orders/domain/delivery_models.dart';
import '../application/delivery_orders_notifier.dart';
import '../infrastructure/remote_service/delivery_orders_remote_service.dart';
import '../infrastructure/remote_service/delivery_orders_repository.dart';

final deliveryOrdersRemoteService = Provider<DeliveryOrdersRemoteService>((ref) {
  return DeliveryOrdersRemoteService(
    ref.watch(urlBuilderProvider),
    ref.watch(dioProvider),
  );
});

final deliveryOrdersRepositoryProvider = Provider<DeliveryOrdersRepository>((ref) {
  return DeliveryOrdersRepository(ref.watch(deliveryOrdersRemoteService));
});

final clientDeliveryOrdersNotifierProvider = StateNotifierProvider.autoDispose<DeliveryOrdersNotifier, AsyncValue<PaginatedResponse<Records>>>((ref) {
  ref.keepAlive();
  return DeliveryOrdersNotifier(
    ref.watch(deliveryOrdersRepositoryProvider),
  );
});

final clientAllDeliveryOrdersNotifierProvider =
    StateNotifierProvider.autoDispose<DeliveryOrdersNotifier, AsyncValue<PaginatedResponse<Records>>>((ref) {
  ref.keepAlive();
  return DeliveryOrdersNotifier(
    ref.watch(deliveryOrdersRepositoryProvider),
  );
});

final geoLocatorServiceProvider = Provider<GeoLocatorService>((ref) {
  return GeoLocatorService();
});

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';
import 'package:ifiranz_client/src/features/delivery/orders/application/dashboard_orders_notifier.dart';
import 'package:ifiranz_client/src/features/delivery/orders/application/delivery_orders_notifier.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';
import 'package:ifiranz_client/src/features/delivery/orders/infrastructure/delivery_orders_remote_service.dart';
import 'package:ifiranz_client/src/features/delivery/orders/infrastructure/delivery_orders_repository.dart';

final deliveryOrdersRemoteService =
    Provider<DeliveryOrdersRemoteService>((ref) {
  return DeliveryOrdersRemoteService(
    ref.watch(urlBuilderProvider),
    ref.watch(dioProvider),
  );
});

final deliveryOrdersRepositoryProvider =
    Provider<DeliveryOrdersRepository>((ref) {
  return DeliveryOrdersRepository(ref.watch(deliveryOrdersRemoteService));
});

final deliveryOrdersNotifierProvider = StateNotifierProvider.autoDispose<
    DeliveryOrdersNotifier, AsyncValue<PaginatedResponse<Records>>>((ref) {
  ref.keepAlive();
  return DeliveryOrdersNotifier(
    ref.watch(deliveryOrdersRepositoryProvider),
  );
});

final deliveryDashboardOrdersNotifierProvider =
    StateNotifierProvider.autoDispose<DeliveryDashboardOrdersNotifier,
        AsyncValue<PaginatedResponse<Records>>>((ref) {
  ref.keepAlive();
  return DeliveryDashboardOrdersNotifier(
    ref.watch(deliveryOrdersRepositoryProvider),
  );
});

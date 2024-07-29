import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/domain/paginated_response.dart';
import '../../../../../core/shared/providers.dart';
import '../../../../../delivery/orders/domain/commission_model.dart';
import '../../../../../delivery/orders/domain/delivery_models.dart';
import '../application/merchand_dasboard_delivery_notifier.dart';
import '../infrastructure/merchand_dasboard_delivery_remote_service.dart';
import '../infrastructure/merchand_dasboard_delivery_repository.dart';

final merchandDashBoardTransactionsRemoteService =
    Provider<MerchandDashboardDeliveryRemoteService>((ref) {
  return MerchandDashboardDeliveryRemoteService(
    ref.watch(urlBuilderProvider),
    ref.watch(dioProvider),
  );
});

final merchandDashBoardDeliveryRepositoryProvider =
    Provider<MerchandDashboardDeliveryRepository>((ref) {
  return MerchandDashboardDeliveryRepository(
      ref.watch(merchandDashBoardTransactionsRemoteService));
});

final merchandDashBoardDeliveryNotifierProvider =
    StateNotifierProvider.autoDispose<MerchandDashboardDeliveryNotifier,
        AsyncValue<PaginatedResponse<Records>>>((ref) {
  ref.keepAlive();
  return MerchandDashboardDeliveryNotifier(
    ref.watch(merchandDashBoardDeliveryRepositoryProvider),
  );
});

final merchantCommissionNotifier = StateNotifierProvider.autoDispose<
    MerchantCommissionNotifier, AsyncValue<Commission>>((ref) {
  ref.keepAlive();
  return MerchantCommissionNotifier(
    ref.watch(merchandDashBoardDeliveryRepositoryProvider),
  );
});
final merchantDeliveriesNotifier = StateNotifierProvider.autoDispose<
    MerchantDeliveryNotifier, AsyncValue<PaginatedResponse<Records>>>((ref) {
  ref.keepAlive();
  return MerchantDeliveryNotifier(
    ref.watch(merchandDashBoardDeliveryRepositoryProvider),
  );
});

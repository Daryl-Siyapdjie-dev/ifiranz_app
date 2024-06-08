import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/delivery/application/merchand_dasboard_delivery_notifier.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/delivery/infrastructure/merchand_dasboard_delivery_remote_service.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/delivery/infrastructure/merchand_dasboard_delivery_repository.dart';

import '../../../../../delivery/orders/domain/delivery_models.dart';

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

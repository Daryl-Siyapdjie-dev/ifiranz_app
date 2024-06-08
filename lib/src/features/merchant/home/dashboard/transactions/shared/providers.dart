import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/transactions/application/merchand_dasboard_transactions_notifier.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/transactions/infrastructure/merchand_dasboard_transactions_remote_service.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/transactions/infrastructure/merchand_dasboard_transactions_repository.dart';

import '../domain/transaction_response.dart';

final merchandDashBoardTransactionsRemoteService =
    Provider<MerchandDashboardTransactionsRemoteService>((ref) {
  return MerchandDashboardTransactionsRemoteService(
    ref.watch(urlBuilderProvider),
    ref.watch(dioProvider),
  );
});

final merchandDashBoardTransactionsRepositoryProvider =
    Provider<MerchandDashboardTransactionsRepository>((ref) {
  return MerchandDashboardTransactionsRepository(
      ref.watch(merchandDashBoardTransactionsRemoteService));
});

final merchandDashBoardTransactionsNotifierProvider =
    StateNotifierProvider.autoDispose<MerchandDashboardTransactionsNotifier,
        AsyncValue<PaginatedResponse<TransactionResponse>>>((ref) {
  ref.keepAlive();
  return MerchandDashboardTransactionsNotifier(
    ref.watch(merchandDashBoardTransactionsRepositoryProvider),
  );
});

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/transaction_info.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/transactions/infrastructure/merchand_dasboard_transactions_repository.dart';

import '../domain/transaction_response.dart';

class MerchandDashboardTransactionsNotifier
    extends StateNotifier<AsyncValue<PaginatedResponse<TransactionResponse>>> {
  final MerchandDashboardTransactionsRepository _merchandOrdersRepository;

  MerchandDashboardTransactionsNotifier(this._merchandOrdersRepository)
      : super(const AsyncLoading());

  Future fetchDeals(PaginatedRequest params, {bool isMore = false}) async {
    if (!state.hasValue) {
      state = const AsyncLoading();
    }

    final failureOrSuccess = await _merchandOrdersRepository.getDeals(
        params, SharedPref.getLocalUser()?.designation ?? "");

    state = failureOrSuccess.fold(
      (l) => isMore
          ? AsyncData(state.value!.copyWith(hasErrorOnLoadMore: true)
              as PaginatedResponse<TransactionResponse>)
          : AsyncError(l.message as Object, StackTrace.current),
      (r) {
        if (isMore) {
          PaginatedResponse<TransactionResponse> oldStatement = state.value!;

          List<TransactionResponse> oldData =
              oldStatement.data as List<TransactionResponse>;

          List<TransactionResponse> newData = [
            ...oldData,
            ...(r.data as List<TransactionResponse>)
          ];

          return isMore
              ? AsyncData(
                  r.copyWith(
                          data: newData,
                          isLoadingMore: r.totalPages > (params.page - 1))
                      as PaginatedResponse<TransactionResponse>,
                )
              : AsyncData(r);
        }

        return AsyncData(
          r.copyWith(isLoadingMore: r.totalPages > (params.page - 1))
              as PaginatedResponse<TransactionResponse>,
        );
      },
    );
  }
}

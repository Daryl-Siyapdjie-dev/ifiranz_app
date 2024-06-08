import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/cashout_model.dart';
import 'package:ifiranz_client/src/features/client/payment/infrastructure/payment_repository.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';

import '../domain/filter_optional.dart';

class PaymentMerchantsNotifier extends StateNotifier<AsyncValue<PaginatedResponse<CashoutModel>>> {
  final PaymentRepository _payentRepository;

  PaymentMerchantsNotifier(this._payentRepository) : super(const AsyncLoading());

  Future fetchPaymentMerchants(PaginatedRequest params, List<FilterOptional> requests, {bool isMore = false}) async {
    if (state.value?.isLoadingMore == true) return;
    if (!state.hasValue || (state.hasValue && (state.value?.data.isEmpty ?? false))) {
      state = const AsyncLoading();
    } else if (!isMore) {
      state = AsyncData(state.value!.copyWith(
        isRefetching: true,
      ) as PaginatedResponse<CashoutModel>);
    }

    if (isMore) {
      state =
          AsyncData(state.value!.copyWith(hasErrorOnLoadMore: false, isLoadingMore: true, isRefetching: false) as PaginatedResponse<CashoutModel>);
    }

    final failureOrSuccess = await _payentRepository.getOperators();

    state = failureOrSuccess.fold(
      (l) => isMore
          ? AsyncData(state.value!.copyWith(hasErrorOnLoadMore: true, isRefetching: false, hasMore: false, isLoadingMore: false)
              as PaginatedResponse<CashoutModel>)
          : AsyncError(l.message as Object, StackTrace.current),
      (r) {
        if (isMore) {
          PaginatedResponse<CashoutModel> oldStatement = state.value!;

          List<CashoutModel> oldData = oldStatement.data as List<CashoutModel>;

          List<CashoutModel> newData = [...oldData, ...(r.data as List<CashoutModel>)];

          return isMore
              ? AsyncData(
                  r.copyWith(
                      data: newData,
                      hasMore: ((r.data.length % params.size == 0) && r.data.isNotEmpty),
                      isLoadingMore: false,
                      isRefetching: false) as PaginatedResponse<CashoutModel>,
                )
              : AsyncData(r);
        }

        return AsyncData(
          r.copyWith(isLoadingMore: false, hasMore: ((r.data.length % params.size == 0) && r.data.isNotEmpty)) as PaginatedResponse<CashoutModel>,
        );
      },
    );
  }
}

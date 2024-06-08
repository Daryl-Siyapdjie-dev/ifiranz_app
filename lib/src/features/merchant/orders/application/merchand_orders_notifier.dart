import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/home/domain/current_cart_response.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/merchant/orders/infrastructure/merchand_orders_repository.dart';

class MerchandOrdersNotifier extends StateNotifier<AsyncValue<PaginatedResponse<CurrentCartResponse>>> {
  final MerchandOrdersRepository _merchandOrdersRepository;

  MerchandOrdersNotifier(this._merchandOrdersRepository) : super(const AsyncLoading());

  Future fetchDeliveryOrders(PaginatedRequest params, {bool isMore = false}) async {
    if (state.value?.isLoadingMore == true) return;
    if (!state.hasValue || (state.hasValue && (state.value?.data.isEmpty ?? false))) {
      state = const AsyncLoading();
    } else if (!isMore) {
      state = AsyncData(state.value!.copyWith(
        isRefetching: true,
      ) as PaginatedResponse<CurrentCartResponse>);
    }

    if (isMore) {
      state = AsyncData(
          state.value!.copyWith(hasErrorOnLoadMore: false, isLoadingMore: true, isRefetching: false) as PaginatedResponse<CurrentCartResponse>);
    }

    final failureOrSuccess = await _merchandOrdersRepository.getListProducts(params);

    state = failureOrSuccess.fold(
      (l) => isMore
          ? AsyncData(state.value!.copyWith(hasErrorOnLoadMore: true, isRefetching: false, hasMore: false, isLoadingMore: false)
              as PaginatedResponse<CurrentCartResponse>)
          : AsyncError(l.message as Object, StackTrace.current),
      (r) {
        if (isMore) {
          PaginatedResponse<CurrentCartResponse> oldStatement = state.value!;

          List<CurrentCartResponse> oldData = oldStatement.data as List<CurrentCartResponse>;

          List<CurrentCartResponse> newData = [...oldData, ...(r.data as List<CurrentCartResponse>)];

          return isMore
              ? AsyncData(
                  r.copyWith(
                      data: newData,
                      totalElements: r.data.isNotEmpty ? r.totalElements : oldStatement.totalElements,
                      totalPages: r.data.isNotEmpty ? r.totalPages : oldStatement.totalPages,
                      hasMore: ((r.data.length % params.size == 0) && r.data.isNotEmpty),
                      isLoadingMore: false,
                      isRefetching: false) as PaginatedResponse<CurrentCartResponse>,
                )
              : AsyncData(r);
        }

        return AsyncData(
          r.copyWith(isLoadingMore: false, hasMore: ((r.data.length % params.size == 0) && r.data.isNotEmpty))
              as PaginatedResponse<CurrentCartResponse>,
        );
      },
    );
  }

  Future filterDeliveryOrders(List<FilterOptional> request, PaginatedRequest params) async {
    final failureOrSuccess = await _merchandOrdersRepository.getListProducts(params, request);

    state = failureOrSuccess.fold((l) => AsyncError(l.message as Object, StackTrace.current), (r) => AsyncData(r));
  }
}

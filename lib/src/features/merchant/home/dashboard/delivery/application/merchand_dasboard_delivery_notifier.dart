import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/domain/paginated_request.dart';
import '../../../../../core/domain/paginated_response.dart';
import '../../../../../delivery/orders/domain/commission_model.dart';
import '../../../../../delivery/orders/domain/delivery_models.dart';
import '../infrastructure/merchand_dasboard_delivery_repository.dart';

class MerchandDashboardDeliveryNotifier
    extends StateNotifier<AsyncValue<PaginatedResponse<Records>>> {
  final MerchandDashboardDeliveryRepository _merchandOrdersRepository;

  MerchandDashboardDeliveryNotifier(this._merchandOrdersRepository)
      : super(const AsyncLoading());

  Future fetchDeals(PaginatedRequest params, {bool isMore = false}) async {
    if (state.value?.isLoadingMore == true) return;
    if (!state.hasValue ||
        (state.hasValue && (state.value?.data.isEmpty ?? false))) {
      state = const AsyncLoading();
    } else if (!isMore) {
      state = AsyncData(state.value!.copyWith(
        isRefetching: true,
      ) as PaginatedResponse<Records>);
    }

    if (isMore) {
      state = AsyncData(state.value!.copyWith(
          hasErrorOnLoadMore: false,
          isLoadingMore: true,
          isRefetching: false) as PaginatedResponse<Records>);
    }

    final failureOrSuccess =
        await _merchandOrdersRepository.merchantDeliveries(params);

    state = failureOrSuccess.fold(
      (l) => isMore
          ? AsyncData(state.value!.copyWith(
              hasErrorOnLoadMore: true,
              isRefetching: false,
              hasMore: false,
              isLoadingMore: false) as PaginatedResponse<Records>)
          : AsyncError(l.message as Object, StackTrace.current),
      (r) {
        if (isMore) {
          PaginatedResponse<Records> oldStatement = state.value!;

          List<Records> oldData = oldStatement.data as List<Records>;

          List<Records> newData = [...oldData, ...(r.data as List<Records>)];

          return isMore
              ? AsyncData(
                  r.copyWith(
                      data: newData,
                      totalElements: r.data.isNotEmpty
                          ? r.totalElements
                          : oldStatement.totalElements,
                      totalPages: r.data.isNotEmpty
                          ? r.totalPages
                          : oldStatement.totalPages,
                      hasMore: ((r.data.length % params.size == 0) &&
                          r.data.isNotEmpty),
                      isLoadingMore: false,
                      isRefetching: false) as PaginatedResponse<Records>,
                )
              : AsyncData(r);
        }

        return AsyncData(
          r.copyWith(
              isLoadingMore: false,
              hasMore: ((r.data.length % params.size == 0) &&
                  r.data.isNotEmpty)) as PaginatedResponse<Records>,
        );
      },
    );
  }

// Fetch Merchant Order
  Future getMerchandOrders(PaginatedRequest params,
      {bool isMore = false}) async {
    if (state.value?.isLoadingMore == true) return;
    if (!state.hasValue ||
        (state.hasValue && (state.value?.data.isEmpty ?? false))) {
      state = const AsyncLoading();
    } else if (!isMore) {
      state = AsyncData(state.value!.copyWith(
        isRefetching: true,
      ) as PaginatedResponse<Records>);
    }

    if (isMore) {
      state = AsyncData(state.value!.copyWith(
          hasErrorOnLoadMore: false,
          isLoadingMore: true,
          isRefetching: false) as PaginatedResponse<Records>);
    }

    final failureOrSuccess =
        await _merchandOrdersRepository.getMerchandOrders(params);

    state = failureOrSuccess.fold(
      (l) => isMore
          ? AsyncData(state.value!.copyWith(
              hasErrorOnLoadMore: true,
              isRefetching: false,
              hasMore: false,
              isLoadingMore: false) as PaginatedResponse<Records>)
          : AsyncError(l.message as Object, StackTrace.current),
      (r) {
        if (isMore) {
          PaginatedResponse<Records> oldStatement = state.value!;

          List<Records> oldData = oldStatement.data as List<Records>;

          List<Records> newData = [...oldData, ...(r.data as List<Records>)];

          return isMore
              ? AsyncData(
                  r.copyWith(
                      data: newData,
                      totalElements: r.data.isNotEmpty
                          ? r.totalElements
                          : oldStatement.totalElements,
                      totalPages: r.data.isNotEmpty
                          ? r.totalPages
                          : oldStatement.totalPages,
                      hasMore: ((r.data.length % params.size == 0) &&
                          r.data.isNotEmpty),
                      isLoadingMore: false,
                      isRefetching: false) as PaginatedResponse<Records>,
                )
              : AsyncData(r);
        }

        return AsyncData(
          r.copyWith(
              isLoadingMore: false,
              hasMore: ((r.data.length % params.size == 0) &&
                  r.data.isNotEmpty)) as PaginatedResponse<Records>,
        );
      },
    );
  }

  // Fetch Merchant Deliveries
  Future getMerchantDeliveries(PaginatedRequest params,
      {bool isMore = false}) async {
    if (state.value?.isLoadingMore == true) return;
    if (!state.hasValue ||
        (state.hasValue && (state.value?.data.isEmpty ?? false))) {
      state = const AsyncLoading();
    } else if (!isMore) {
      state = AsyncData(state.value!.copyWith(
        isRefetching: true,
      ) as PaginatedResponse<Records>);
    }

    if (isMore) {
      state = AsyncData(state.value!.copyWith(
          hasErrorOnLoadMore: false,
          isLoadingMore: true,
          isRefetching: false) as PaginatedResponse<Records>);
    }

    final failureOrSuccess =
        await _merchandOrdersRepository.getMerchantDeliveries(params);

    state = failureOrSuccess.fold(
      (l) => isMore
          ? AsyncData(state.value!.copyWith(
              hasErrorOnLoadMore: true,
              isRefetching: false,
              hasMore: false,
              isLoadingMore: false) as PaginatedResponse<Records>)
          : AsyncError(l.message as Object, StackTrace.current),
      (r) {
        if (isMore) {
          PaginatedResponse<Records> oldStatement = state.value!;

          List<Records> oldData = oldStatement.data as List<Records>;

          List<Records> newData = [...oldData, ...(r.data as List<Records>)];

          return isMore
              ? AsyncData(
                  r.copyWith(
                      data: newData,
                      totalElements: r.data.isNotEmpty
                          ? r.totalElements
                          : oldStatement.totalElements,
                      totalPages: r.data.isNotEmpty
                          ? r.totalPages
                          : oldStatement.totalPages,
                      hasMore: ((r.data.length % params.size == 0) &&
                          r.data.isNotEmpty),
                      isLoadingMore: false,
                      isRefetching: false) as PaginatedResponse<Records>,
                )
              : AsyncData(r);
        }

        return AsyncData(
          r.copyWith(
              isLoadingMore: false,
              hasMore: ((r.data.length % params.size == 0) &&
                  r.data.isNotEmpty)) as PaginatedResponse<Records>,
        );
      },
    );
  }
}

class MerchantDeliveryNotifier
    extends StateNotifier<AsyncValue<PaginatedResponse<Records>>> {
  final MerchandDashboardDeliveryRepository _merchandOrdersRepository;
  MerchantDeliveryNotifier(this._merchandOrdersRepository)
      : super(const AsyncLoading());

  Future<void> getMerchantDeliveries(PaginatedRequest params,
      {bool isMore = false}) async {
    state = const AsyncLoading();

    final response =
        await _merchandOrdersRepository.getMerchantDeliveries(params);

    state = response.fold(
      (l) => AsyncValue.error(l.message as Object, StackTrace.current),
      (r) => AsyncData(r),
    );
  }
}

class MerchantCommissionNotifier extends StateNotifier<AsyncValue<Commission>> {
  final MerchandDashboardDeliveryRepository _merchandOrdersRepository;
  MerchantCommissionNotifier(this._merchandOrdersRepository)
      : super(const AsyncLoading());

  Future<void> getMerchantCommissions(PaginatedRequest params) async {
    state = const AsyncLoading();

    final response =
        await _merchandOrdersRepository.getMerchantCommissions(params);

    state = response.fold(
      (l) => AsyncValue.error(l.message as Object, StackTrace.current),
      (r) => AsyncData(r),
    );
  }
}

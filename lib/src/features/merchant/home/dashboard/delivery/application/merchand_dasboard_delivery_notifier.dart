import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';

import 'package:ifiranz_client/src/features/merchant/home/dashboard/delivery/infrastructure/merchand_dasboard_delivery_repository.dart';

import '../../../../../delivery/orders/domain/delivery_models.dart';

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
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';

import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/inventory/domain/inventory.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/inventory/infrastructure/merchand_inventory_repository.dart';

class MerchandInventoryNotifier
    extends StateNotifier<AsyncValue<PaginatedResponse<Inventory>>> {
  final MerchandInventoryRepository _merchandOrdersRepository;

  MerchandInventoryNotifier(this._merchandOrdersRepository)
      : super(const AsyncLoading());

  Future fetchDeliveryOrders(PaginatedRequest params,
      {bool isMore = false}) async {
    if (state.value?.isLoadingMore == true) return;
    if (!state.hasValue ||
        (state.hasValue && (state.value?.data.isEmpty ?? false))) {
      state = const AsyncLoading();
    } else if (!isMore) {
      state = AsyncData(state.value!.copyWith(
        isRefetching: true,
      ) as PaginatedResponse<Inventory>);
    }

    if (isMore) {
      state = AsyncData(state.value!.copyWith(
          hasErrorOnLoadMore: false,
          isLoadingMore: true,
          isRefetching: false) as PaginatedResponse<Inventory>);
    }

    final failureOrSuccess =
        await _merchandOrdersRepository.getInventory(params);

    state = failureOrSuccess.fold(
      (l) => isMore
          ? AsyncData(state.value!.copyWith(
              hasErrorOnLoadMore: true,
              isRefetching: false,
              hasMore: false,
              isLoadingMore: false) as PaginatedResponse<Inventory>)
          : AsyncError(l.message as Object, StackTrace.current),
      (r) {
        if (isMore) {
          PaginatedResponse<Inventory> oldStatement = state.value!;

          List<Inventory> oldData = oldStatement.data as List<Inventory>;

          List<Inventory> newData = [
            ...oldData,
            ...(r.data as List<Inventory>)
          ];

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
                      isRefetching: false) as PaginatedResponse<Inventory>,
                )
              : AsyncData(r);
        }

        return AsyncData(
          r.copyWith(
              isLoadingMore: false,
              hasMore: ((r.data.length % params.size == 0) &&
                  r.data.isNotEmpty)) as PaginatedResponse<Inventory>,
        );
      },
    );
  }

  Future filterDeliveryOrders(
      List<FilterOptional> request, PaginatedRequest params) async {
    final failureOrSuccess =
        await _merchandOrdersRepository.getInventory(params, request);

    state = failureOrSuccess.fold(
        (l) => AsyncError(l.message as Object, StackTrace.current),
        (r) => AsyncData(r));
  }
}

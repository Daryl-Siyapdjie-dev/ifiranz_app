import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';
import 'package:ifiranz_client/src/features/delivery/orders/infrastructure/delivery_orders_repository.dart';

import '../../../client/home/domain/filter_optional.dart';

class DeliveryOrdersNotifier extends StateNotifier<AsyncValue<PaginatedResponse<Records>>> {
  final DeliveryOrdersRepository _deliveryOrdersRepository;

  DeliveryOrdersNotifier(this._deliveryOrdersRepository) : super(const AsyncLoading());

  Future fetchDeliveryOrders(PaginatedRequest params, {bool isMore = false}) async {
    if (state.value?.isLoadingMore == true) return;
    if (!state.hasValue || (state.hasValue && (state.value?.data.isEmpty ?? false))) {
      state = const AsyncLoading();
    } else if (!isMore) {
      state = AsyncData(state.value!.copyWith(
        isRefetching: true,
      ) as PaginatedResponse<Records>);
    }

    if (isMore) {
      state = AsyncData(state.value!.copyWith(hasErrorOnLoadMore: false, isLoadingMore: true, isRefetching: false) as PaginatedResponse<Records>);
    }

    final failureOrSuccess = await _deliveryOrdersRepository.getListDeliveryOrders(params);

    state = failureOrSuccess.fold(
      (l) => isMore
          ? AsyncData(state.value!.copyWith(hasErrorOnLoadMore: true, isRefetching: false, hasMore: false, isLoadingMore: false)
              as PaginatedResponse<Records>)
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
                      totalElements: r.data.isNotEmpty ? r.totalElements : oldStatement.totalElements,
                      totalPages: r.data.isNotEmpty ? r.totalPages : oldStatement.totalPages,
                      hasMore: ((r.data.length % params.size == 0) && r.data.isNotEmpty),
                      isLoadingMore: false,
                      isRefetching: false) as PaginatedResponse<Records>,
                )
              : AsyncData(r);
        }

        return AsyncData(
          r.copyWith(isLoadingMore: false, hasMore: ((r.data.length % params.size == 0) && r.data.isNotEmpty)) as PaginatedResponse<Records>,
        );
      },
    );
  }

  Future<void> acceptDeliveryOrder(int id) async {
    final failureOrSuccess = await _deliveryOrdersRepository.acceptDeliveryOrder(id);

    state = failureOrSuccess.fold(
      (l) => AsyncData(state.value!.copyWith(actionError: l.toString()) as PaginatedResponse<Records>),
      (r) {
        PaginatedResponse<Records> oldStatement = state.value!;

        List<Records> oldData = oldStatement.data as List<Records>;

        List<Records> newData = oldData.map((element) => element.id == id ? r : element).toList();

        return AsyncData(oldStatement.copyWith(data: newData) as PaginatedResponse<Records>);
      },
    );
  }

  Future<void> deliveryDeliveryOrder(String code) async {
    final failureOrSuccess = await _deliveryOrdersRepository.deliveryOrderFindByCode(code);

    state = failureOrSuccess.fold(
      (l) => AsyncData(state.value!.copyWith(actionError: l.toString()) as PaginatedResponse<Records>),
      (r) {
        PaginatedResponse<Records> oldStatement = state.value!;

        List<Records> oldData = oldStatement.data as List<Records>;

        return AsyncData(oldStatement.copyWith(data: oldData.where((element) => element.id != r.id).toList()) as PaginatedResponse<Records>);
      },
    );
  }

  Future<void> updateDeliveryOrder(int id) async {
    final failureOrSuccess = await _deliveryOrdersRepository.updateDeliveryOrder(id);

    state = failureOrSuccess.fold(
      (l) => AsyncData(state.value!.copyWith(actionError: l.toString()) as PaginatedResponse<Records>),
      (r) {
        PaginatedResponse<Records> oldStatement = state.value!;

        List<Records> oldData = oldStatement.data as List<Records>;

        List<Records> newData = oldData.map((element) => element.id == id ? r : element).toList();

        return AsyncData(oldStatement.copyWith(data: newData) as PaginatedResponse<Records>);
      },
    );
  }

  Future<void> denyDeliveryOrder(int id) async {
    final failureOrSuccess = await _deliveryOrdersRepository.denyDeliveryOrder(id);

    state = failureOrSuccess.fold(
      (l) => AsyncData(state.value!.copyWith(actionError: l.toString()) as PaginatedResponse<Records>),
      (r) {
        PaginatedResponse<Records> oldStatement = state.value!;

        List<Records> oldData = oldStatement.data as List<Records>;

        List<Records> newData = oldData.map((element) => element.id == id ? r : element).toList();

        return AsyncData(oldStatement.copyWith(data: newData) as PaginatedResponse<Records>);
      },
    );
  }

  Future<void> findOrders(List<FilterOptional> request, PaginatedRequest params) async {
    final failureOrSuccess = await _deliveryOrdersRepository.filterOrders(request, params);

    state = failureOrSuccess.fold((l) => AsyncError(l.message as Object, StackTrace.current), (r) => AsyncData(r));
  }
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/merchant/colis/instrastructure/service/merchand_colis_repository.dart';

import '../../../delivery/orders/domain/delivery_models.dart';
import '../domain/add_colis_request.dart';

class MerchandColisNotifier extends StateNotifier<AsyncValue<PaginatedResponse<Commande>>> {
  final ColisRepository _repository;

  MerchandColisNotifier(this._repository) : super(const AsyncLoading());

  Future getAllProducts(PaginatedRequest params, {bool isMore = false}) async {
    if (state.value?.isLoadingMore == true) return;
    if (!state.hasValue || (state.hasValue && (state.value?.data.isEmpty ?? false))) {
      state = const AsyncLoading();
    } else if (!isMore) {
      state = AsyncData(state.value!.copyWith(
        isRefetching: true,
      ) as PaginatedResponse<Commande>);
    }

    if (isMore) {
      state = AsyncData(state.value!.copyWith(hasErrorOnLoadMore: false, isLoadingMore: true, isRefetching: false) as PaginatedResponse<Commande>);
    }

    final failureOrSuccess = await _repository.getAllColis(
      params,
    );

    state = failureOrSuccess.fold(
      (l) => isMore
          ? AsyncData(state.value!.copyWith(hasErrorOnLoadMore: true, isRefetching: false, hasMore: false, isLoadingMore: false)
              as PaginatedResponse<Commande>)
          : AsyncError(l.message as Object, StackTrace.current),
      (r) {
        if (isMore) {
          PaginatedResponse<Commande> oldStatement = state.value!;

          List<Commande> oldData = oldStatement.data as List<Commande>;

          List<Commande> newData = [...oldData, ...(r.data as List<Commande>)];

          return isMore
              ? AsyncData(
                  r.copyWith(
                      data: newData,
                      totalElements: r.data.isNotEmpty ? r.totalElements : oldStatement.totalElements,
                      totalPages: r.data.isNotEmpty ? r.totalPages : oldStatement.totalPages,
                      hasMore: ((r.data.length % params.size == 0) && r.data.isNotEmpty),
                      isLoadingMore: false,
                      isRefetching: false) as PaginatedResponse<Commande>,
                )
              : AsyncData(r);
        }

        return AsyncData(
          r.copyWith(isLoadingMore: false, hasMore: ((r.data.length % params.size == 0) && r.data.isNotEmpty)) as PaginatedResponse<Commande>,
        );
      },
    );
  }

  Future<void> createColis(AddColisRequest request) async {
    if (state.hasError) return;
    if (state.hasValue) {
      PaginatedResponse<Commande> oldStatement = state.value!;

      state = AsyncData(oldStatement.copyWith(
        actionError: null,
        isActionLoading: true,
      ) as PaginatedResponse<Commande>);
    }

    final failureOrSuccess = await _repository.createColis(request);

    state = failureOrSuccess.fold(
      (l) => AsyncData(state.value!.copyWith(
        actionError: l.message,
        isActionLoading: false,
      ) as PaginatedResponse<Commande>),
      (r) {
        PaginatedResponse<Commande> oldStatement = state.value!;

        List<Commande> oldData = oldStatement.data as List<Commande>;

        List<Commande> newData = [r, ...oldData];

        return AsyncData(oldStatement.copyWith(
          data: newData,
          isActionLoading: false,
        ) as PaginatedResponse<Commande>);
      },
    );
  }

  // Future<void> updateProduct(Commande request, [File? image]) async {
  //   if (state.hasError) return;
  //   if (state.hasValue) {
  //     PaginatedResponse<Commande> oldStatement = state.value!;
  //
  //     state = AsyncData(oldStatement.copyWith(
  //       actionError: null,
  //       isActionLoading: true,
  //     ) as PaginatedResponse<Commande>);
  //   }
  //
  //   final failureOrSuccess = await _repository.updateProduct(request, image);
  //
  //   state = failureOrSuccess.fold(
  //     (l) => AsyncData(state.value!.copyWith(
  //       actionError: l.message,
  //       isActionLoading: false,
  //     ) as PaginatedResponse<Commande>),
  //     (r) {
  //       PaginatedResponse<Commande> oldStatement = state.value!;
  //
  //       List<Commande> oldData = oldStatement.data as List<Commande>;
  //
  //       List<Commande> newData = [...oldData.map((e) => e.id == r.id ? r : e)];
  //
  //       return AsyncData(oldStatement.copyWith(
  //         data: newData,
  //         isActionLoading: false,
  //       ) as PaginatedResponse<Commande>);
  //     },
  //   );
  // }
  //
  // Future<void> deleteProdcuct(int id) async {
  //   if (state.hasError) return;
  //   if (state.hasValue) {
  //     PaginatedResponse<Commande> oldStatement = state.value!;
  //
  //     state = AsyncData(oldStatement.copyWith(actionError: null, isActionLoading: true) as PaginatedResponse<Commande>);
  //   }
  //
  //   final failureOrSuccess = await _repository.deleteProdcuct(id);
  //
  //   state = failureOrSuccess.fold(
  //     (l) => AsyncData(state.value!.copyWith(actionError: l.message, isActionLoading: false) as PaginatedResponse<Commande>),
  //     (r) {
  //       PaginatedResponse<Commande> oldStatement = state.value!;
  //
  //       List<Commande> oldData = oldStatement.data as List<Commande>;
  //
  //       return AsyncData(oldStatement.copyWith(isActionLoading: false, data: oldData.where((element) => element.id != id).toList())
  //           as PaginatedResponse<Commande>);
  //     },
  //   );
  // }
}

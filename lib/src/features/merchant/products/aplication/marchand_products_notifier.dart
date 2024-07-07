import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../client/home/domain/product_model.dart';
import '../../../core/domain/paginated_request.dart';
import '../../../core/domain/paginated_response.dart';
import '../infrastructure/merchand_products_repository.dart';

class MerchandProductNotifier
    extends StateNotifier<AsyncValue<PaginatedResponse<ProductModel>>> {
  final ProductsRepository _repository;

  MerchandProductNotifier(this._repository) : super(const AsyncLoading());

  Future getAllProducts(PaginatedRequest params, {bool isMore = false}) async {
    if (state.value?.isLoadingMore == true) return;
    if (!state.hasValue ||
        (state.hasValue && (state.value?.data.isEmpty ?? false))) {
      state = const AsyncLoading();
    } else if (!isMore) {
      state = AsyncData(state.value!.copyWith(
        isRefetching: true,
      ) as PaginatedResponse<ProductModel>);
    }

    if (isMore) {
      state = AsyncData(state.value!.copyWith(
          hasErrorOnLoadMore: false,
          isLoadingMore: true,
          isRefetching: false) as PaginatedResponse<ProductModel>);
    }

    final failureOrSuccess = await _repository.getListProducts(
      params,
    );

    state = failureOrSuccess.fold(
      (l) => isMore
          ? AsyncData(state.value!.copyWith(
              hasErrorOnLoadMore: true,
              isRefetching: false,
              hasMore: false,
              isLoadingMore: false) as PaginatedResponse<ProductModel>)
          : AsyncError(l.message as Object, StackTrace.current),
      (r) {
        if (isMore) {
          PaginatedResponse<ProductModel> oldStatement = state.value!;

          List<ProductModel> oldData = oldStatement.data as List<ProductModel>;

          List<ProductModel> newData = [
            ...oldData,
            ...(r.data as List<ProductModel>)
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
                      isRefetching: false) as PaginatedResponse<ProductModel>,
                )
              : AsyncData(r);
        }

        return AsyncData(
          r.copyWith(
              isLoadingMore: false,
              hasMore: ((r.data.length % params.size == 0) &&
                  r.data.isNotEmpty)) as PaginatedResponse<ProductModel>,
        );
      },
    );
  }

  Future<void> createProduct(ProductModel request, File image) async {
    if (state.hasError) return;
    if (state.hasValue) {
      PaginatedResponse<ProductModel> oldStatement = state.value!;

      state = AsyncData(oldStatement.copyWith(
        actionError: null,
        isActionLoading: true,
      ) as PaginatedResponse<ProductModel>);
    }

    final failureOrSuccess = await _repository.createProduct(request, image);

    state = failureOrSuccess.fold(
      (l) => AsyncData(state.value!.copyWith(
        actionError: l.message,
        isActionLoading: false,
      ) as PaginatedResponse<ProductModel>),
      (r) {
        PaginatedResponse<ProductModel> oldStatement = state.value!;

        List<ProductModel> oldData = oldStatement.data as List<ProductModel>;

        List<ProductModel> newData = [r, ...oldData];

        return AsyncData(oldStatement.copyWith(
          data: newData,
          isActionLoading: false,
        ) as PaginatedResponse<ProductModel>);
      },
    );
  }

  Future<void> updateProduct(ProductModel request, [File? image]) async {
    if (state.hasError) return;
    if (state.hasValue) {
      PaginatedResponse<ProductModel> oldStatement = state.value!;

      state = AsyncData(oldStatement.copyWith(
        actionError: null,
        isActionLoading: true,
      ) as PaginatedResponse<ProductModel>);
    }

    final failureOrSuccess = await _repository.updateProduct(request, image);

    state = failureOrSuccess.fold(
      (l) => AsyncData(state.value!.copyWith(
        actionError: l.message,
        isActionLoading: false,
      ) as PaginatedResponse<ProductModel>),
      (r) {
        PaginatedResponse<ProductModel> oldStatement = state.value!;

        List<ProductModel> oldData = oldStatement.data as List<ProductModel>;

        List<ProductModel> newData = [
          ...oldData.map((e) => e.id == r.id ? r : e)
        ];

        return AsyncData(oldStatement.copyWith(
          data: newData,
          isActionLoading: false,
        ) as PaginatedResponse<ProductModel>);
      },
    );
  }

  Future<void> deleteProdcuct(int id) async {
    if (state.hasError) return;
    if (state.hasValue) {
      PaginatedResponse<ProductModel> oldStatement = state.value!;

      state = AsyncData(oldStatement.copyWith(
          actionError: null,
          isActionLoading: true) as PaginatedResponse<ProductModel>);
    }

    final failureOrSuccess = await _repository.deleteProdcuct(id);

    state = failureOrSuccess.fold(
      (l) => AsyncData(
          state.value!.copyWith(actionError: l.message, isActionLoading: false)
              as PaginatedResponse<ProductModel>),
      (r) {
        PaginatedResponse<ProductModel> oldStatement = state.value!;

        List<ProductModel> oldData = oldStatement.data as List<ProductModel>;

        return AsyncData(oldStatement.copyWith(
                isActionLoading: false,
                data: oldData.where((element) => element.id != id).toList())
            as PaginatedResponse<ProductModel>);
      },
    );
  }
}

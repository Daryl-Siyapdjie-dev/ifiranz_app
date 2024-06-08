import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/merchant/products/domain/type/type_request.dart';
import 'package:ifiranz_client/src/features/merchant/products/domain/type/type_response.dart';

import 'package:ifiranz_client/src/features/merchant/products/infrastructure/merchand_type_repository.dart';

class MerchandTypeNotifier
    extends StateNotifier<AsyncValue<PaginatedResponse<TypeResponse>>> {
  final MerchandTypesRepository _repository;

  MerchandTypeNotifier(this._repository) : super(const AsyncLoading());

  Future getAllTypes(PaginatedRequest params, {bool isMore = false}) async {
    if (!state.hasValue) {
      state = const AsyncLoading();
    }

    final failureOrSuccess = await _repository.getAllTypes(params);

    state = failureOrSuccess.fold(
      (l) => isMore
          ? AsyncData(state.value!.copyWith(hasErrorOnLoadMore: true)
              as PaginatedResponse<TypeResponse>)
          : AsyncError(l.message as Object, StackTrace.current),
      (r) {
        if (isMore) {
          PaginatedResponse<TypeResponse> oldStatement = state.value!;

          List<TypeResponse> oldData = oldStatement.data as List<TypeResponse>;

          List<TypeResponse> newData = [
            ...oldData,
            ...(r.data as List<TypeResponse>)
          ];

          return isMore
              ? AsyncData(
                  r.copyWith(
                          data: newData,
                          isLoadingMore: r.totalPages > (params.page - 1))
                      as PaginatedResponse<TypeResponse>,
                )
              : AsyncData(r);
        }

        return AsyncData(
          r.copyWith(isLoadingMore: r.totalPages > (params.page - 1))
              as PaginatedResponse<TypeResponse>,
        );
      },
    );
  }

  Future<void> createType(TypeRequest request) async {
    if (state.hasError) return;
    if (state.hasValue) {
      PaginatedResponse<TypeResponse> oldStatement = state.value!;

      state = AsyncData(oldStatement.copyWith(
        actionError: null,
      ) as PaginatedResponse<TypeResponse>);
    }

    final failureOrSuccess = await _repository.createType(request);

    state = failureOrSuccess.fold(
      (l) => AsyncData(state.value!.copyWith(actionError: l.message)
          as PaginatedResponse<TypeResponse>),
      (r) {
        PaginatedResponse<TypeResponse> oldStatement = state.value!;

        List<TypeResponse> oldData = oldStatement.data as List<TypeResponse>;

        List<TypeResponse> newData = [...oldData, r];

        return AsyncData(oldStatement.copyWith(data: newData)
            as PaginatedResponse<TypeResponse>);
      },
    );
  }
}

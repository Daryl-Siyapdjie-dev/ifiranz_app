import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:ifiranz_client/src/features/client/home/infrastructure/products_repository.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';

import '../domain/filter_optional.dart';
import '../domain/infrastructur_model.dart';
import '../infrastructure/infrastructurs_repository.dart';

class InfrastructursNotifier
    extends StateNotifier<AsyncValue<PaginatedResponse<InfrastructurModel>>> {
  final InfrastructursRepository _producstRepository;

  InfrastructursNotifier(this._producstRepository) : super(const AsyncLoading());

  Future fetchRestaurants(
      PaginatedRequest params, List<FilterOptional> requests,
      {bool isMore = false}) async {
    if (state.value?.isLoadingMore == true) return;
    if (!state.hasValue ||
        (state.hasValue && (state.value?.data.isEmpty ?? false))) {
      state = const AsyncLoading();
    } else if (!isMore) {
      state = AsyncData(state.value!.copyWith(
        isRefetching: true,
      ) as PaginatedResponse<InfrastructurModel>);
    }

    if (isMore) {
      state = AsyncData(state.value!.copyWith(
          hasErrorOnLoadMore: false,
          isLoadingMore: true,
          isRefetching: false) as PaginatedResponse<InfrastructurModel>);
    }

    final failureOrSuccess =
        await _producstRepository.getListInfrastructurs(params, requests);

    state = failureOrSuccess.fold(
      (l) => isMore
          ? AsyncData(state.value!.copyWith(
              hasErrorOnLoadMore: true,
              isRefetching: false,
              hasMore: false,
              isLoadingMore: false) as PaginatedResponse<InfrastructurModel>)
          : AsyncError(l.message as Object, StackTrace.current),
      (r) {
        if (isMore) {
          PaginatedResponse<InfrastructurModel> oldStatement = state.value!;

          List<InfrastructurModel> oldData =
              oldStatement.data as List<InfrastructurModel>;

          List<InfrastructurModel> newData = [
            ...oldData,
            ...(r.data as List<InfrastructurModel>)
          ];

          return isMore
              ? AsyncData(
                  r.copyWith(
                          data: newData,
                          hasMore: ((r.data.length % params.size == 0) &&
                              r.data.isNotEmpty),
                          isLoadingMore: false,
                          isRefetching: false)
                      as PaginatedResponse<InfrastructurModel>,
                )
              : AsyncData(r);
        }

        return AsyncData(
          r.copyWith(
              isLoadingMore: false,
              hasMore: ((r.data.length % params.size == 0) &&
                  r.data.isNotEmpty)) as PaginatedResponse<InfrastructurModel>,
        );
      },
    );
  }
}

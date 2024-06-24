import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/clients/infrastructure/merchand_clients_repository.dart';

class MerchandClientsNotifier
    extends StateNotifier<AsyncValue<PaginatedResponse<Client>>> {
  final MerchandClientsRepository _repository;

  MerchandClientsNotifier(this._repository) : super(const AsyncLoading());

  Future fetchMerchantClients(PaginatedRequest params,
      {bool isMore = false}) async {
    if (state.value?.isLoadingMore == true) return;
    if (!state.hasValue ||
        (state.hasValue && (state.value?.data.isEmpty ?? false))) {
      state = const AsyncLoading();
    } else if (!isMore) {
      state = AsyncData(state.value!.copyWith(
        isRefetching: true,
      ) as PaginatedResponse<Client>);
    }

    if (isMore) {
      state = AsyncData(state.value!.copyWith(
          hasErrorOnLoadMore: false,
          isLoadingMore: true,
          isRefetching: false) as PaginatedResponse<Client>);
    }
    final failureOrSuccess = await _repository.getListMerchantClients(params);

    state = failureOrSuccess.fold(
      (l) => isMore
          ? AsyncData(state.value!.copyWith(
              hasErrorOnLoadMore: true,
              isRefetching: false,
              hasMore: false,
              isLoadingMore: false) as PaginatedResponse<Client>)
          : AsyncError(l.message as Object, StackTrace.current),
      (r) {
        if (isMore) {
          PaginatedResponse<Client> oldStatement = state.value!;

          List<Client> oldData = oldStatement.data as List<Client>;

          List<Client> newData = [...oldData, ...(r.data as List<Client>)];

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
                      isRefetching: false) as PaginatedResponse<Client>,
                )
              : AsyncData(r);
        }

        return AsyncData(
          r.copyWith(
              isLoadingMore: false,
              hasMore: ((r.data.length % params.size == 0) &&
                  r.data.isNotEmpty)) as PaginatedResponse<Client>,
        );
      },
    );
  }

  Future<void> createClient(Client r) async {
    if (state.hasError) return;

    PaginatedResponse<Client> oldStatement = state.value!;

    List<Client> oldData = oldStatement.data as List<Client>;

    List<Client> newData = [...oldData, r];

    state = AsyncData(oldStatement.copyWith(
            data: newData, totalElements: oldStatement.totalElements + 1)
        as PaginatedResponse<Client>);
  }
}

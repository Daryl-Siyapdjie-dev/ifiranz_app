import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';

import '../../../auth/core/infrastructure/user_repository.dart';
import '../domain/product_model.dart';

class FindAllMarchandPoductsNotifier extends StateNotifier<AsyncValue<List<Merchant>>> {
  final GetCurrentUserRepository _repository;

  FindAllMarchandPoductsNotifier(this._repository) : super(const AsyncLoading());

  Future getAllMarchand(PaginatedRequest params) async {
    if (state is! AsyncValue<List<Merchant>>) {
      state = const AsyncLoading();
    }

    final failureOrSuccess = await _repository.getAllMarchand(params);

    state = failureOrSuccess.fold((l) => AsyncError(l.message as Object, StackTrace.current), (r) {
      return AsyncData(r);
    });
  }
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/auth/core/infrastructure/user_repository.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';

class CurrentMarchandNotifier extends StateNotifier<AsyncValue<Merchant>> {
  final GetCurrentUserRepository _request;

  CurrentMarchandNotifier(this._request)
      : super(SharedPref.getLocalUser() is Merchant
            ? AsyncValue.data(SharedPref.getLocalUser()!)
            : const AsyncValue.loading());

  Future<void> getCurrentMarchand(FilterOptional request) async {
    final merchant = await _request.getCurentMarchand(request);
    merchant.fold(
        (l) => state = AsyncValue.error(l.message ?? "", StackTrace.current),
        (r) => state = AsyncValue.data(r));
  }
}

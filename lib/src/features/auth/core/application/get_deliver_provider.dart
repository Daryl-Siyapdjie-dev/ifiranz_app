import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/auth/core/infrastructure/user_repository.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';

class CurrentLivreurNotifier extends StateNotifier<AsyncValue<Livreur>> {
  final GetCurrentUserRepository _request;

  CurrentLivreurNotifier(this._request) : super(SharedPref.getLocalDeliver() is Livreur ? AsyncValue.data(SharedPref.getLocalDeliver()!) : const AsyncValue.loading());

  Future<void> getCurrentLivreur(FilterOptional request) async {
    final merchant = await _request.getCurentDeliver(request);
    merchant.fold((l) => state = AsyncValue.data(SharedPref.getLocalDeliver()!), (r) => state = AsyncValue.data(r));
  }
}

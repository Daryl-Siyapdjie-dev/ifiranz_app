import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client_request.dart';
import 'package:ifiranz_client/src/features/auth/core/infrastructure/user_repository.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';

import '../domain/client.dart';

class CurrentClientNotifier extends StateNotifier<AsyncValue<Client>> {
  final GetCurrentUserRepository _request;

  CurrentClientNotifier(this._request)
      : super(SharedPref.getLocalUser() is Client
            ? AsyncValue.data(SharedPref.getClientLocalUser()!)
            : const AsyncValue.loading());

  Future<void> getCurrentClient(ClientRequest request) async {
    final client = await _request.getCurentClient(request);

    client.fold(
        (l) => state = SharedPref.getLocalUser() is Client
            ? AsyncValue.data(SharedPref.getClientLocalUser()!)
            : AsyncValue.error(l.message ?? "", StackTrace.current),
        (r) => state = AsyncValue.data(r));
  }
}

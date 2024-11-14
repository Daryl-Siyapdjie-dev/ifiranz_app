import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/profile/application/providers.dart';
import '../../auth/infrastructure/auth_service.dart';
import '../infrastructure/profile_repository.dart';

class ProfileNotifier extends StateNotifier<AsyncValue<void>> {
  final ProfileRepository _repository;

  ProfileNotifier(this._repository) : super(const AsyncData(null));

  int? _getUserId() {
    final clientId = SharedPref.getClientLocalUser()?.idClient;
    final shipperId = SharedPref.getLocalDeliver()?.shipperId;
    final merchantId = SharedPref.getLocalUser()?.merchantId;

    return clientId ?? shipperId ?? merchantId;
  }

  Future<void> deleteAccount() async {
    final userId = _getUserId();
    if (userId == null) {
      state = AsyncError('Erreur : ID utilisateur introuvable', StackTrace.current);
      return;
    }

    state = const AsyncLoading();

    final result = await _repository.deleteAccount(userId);

    state = result.fold(
          (failure) => AsyncError(
        'Échec de la suppression du compte : ${failure.message}',
        StackTrace.current,
      ),

          (_) => const AsyncData(null),
    );
  }
}

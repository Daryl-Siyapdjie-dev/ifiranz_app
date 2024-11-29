import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

    // Appel à la suppression de compte dans le dépôt
    final result = await _repository.deleteAccount(userId);

    state = await result.fold(
          (failure) {
        return AsyncError(
          'Échec de la suppression du compte : ${failure.message}',
          StackTrace.current,
        );
      },
          (_) async {
        // Efface les données locales après la suppression réussie
        await SharedPref.clearUserLocalData();

        // Suppression du token sécurisé si stocké avec FlutterSecureStorage
        final storage = FlutterSecureStorage();
        await storage.delete(key: 'access_token');


        return const AsyncData(null);
      },
    );
  }
}

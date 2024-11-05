import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'delete_account_state.dart';

class ProfileNotifier extends StateNotifier<void> {
  final DeleteAccountUseCase _deleteAccountUseCase;

  ProfileNotifier(this._deleteAccountUseCase) : super(null);

  Future<void> deleteAccount() async {
    await _deleteAccountUseCase();
    // Effectue toute action supplémentaire, comme la déconnexion de l'utilisateur
  }
}

// Fournisseur Riverpod pour ProfileNotifier
final profileNotifierProvider = StateNotifierProvider<ProfileNotifier, void>((ref) {
  final deleteAccountUseCase = ref.read(deleteAccountUseCaseProvider);
  return ProfileNotifier(deleteAccountUseCase);
});

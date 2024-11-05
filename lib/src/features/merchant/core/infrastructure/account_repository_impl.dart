import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  @override
  Future<void> deleteAccount() async {
    // Ici, appelle l'API pour supprimer le compte utilisateur
    // Exemple : await http.delete(Uri.parse('https://api.example.com/deleteAccount'));
  }
}

// Fournisseur Riverpod pour AccountRepository
final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  return AccountRepositoryImpl();
});

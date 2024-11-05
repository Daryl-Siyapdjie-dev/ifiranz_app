import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/account_repository.dart';
import '../infrastructure/account_repository_impl.dart';

class DeleteAccountUseCase {
  final AccountRepository _repository;

  DeleteAccountUseCase(this._repository);

  Future<void> call() async {
    await _repository.deleteAccount();
  }
}

// Fournisseur Riverpod pour DeleteAccountUseCase
final deleteAccountUseCaseProvider = Provider<DeleteAccountUseCase>((ref) {
  final repository = ref.read(accountRepositoryProvider);
  return DeleteAccountUseCase(repository);
});

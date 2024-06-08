import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ifiranz_client/src/features/auth/core/infrastructure/firebase_authenticator_repository.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/user_local_credentials_repository.dart';

import '../../../core/infrastructure/utils/common_import.dart';
import '../../../core/shared/providers.dart';
import '../application/auth_notifier.dart';
import '../infrastructure/auth_remote_service.dart';
import '../infrastructure/auth_repository.dart';

final userLocalCredentialsRepository =
    Provider<UserLocalCredentialsRepository>((ref) {
  return UserLocalCredentialsRepository(const FlutterSecureStorage());
});

final authRemoteServiceProvider = Provider<AuthRemoteService>((ref) {
  return AuthRemoteService(ref.watch(urlBuilderProvider),
      ref.watch(dioProvider), ref.watch(userLocalCredentialsRepository));
});

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(authRemoteServiceProvider));
});

final firebaseAuthenticatorRepository =
    Provider<FirebaseAuthenticatorRepository>((ref) {
  return FirebaseAuthenticatorRepository(
    ref.watch(firebaseAuthProvider),
  );
});

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider),
      ref.watch(firebaseAuthenticatorRepository));
});

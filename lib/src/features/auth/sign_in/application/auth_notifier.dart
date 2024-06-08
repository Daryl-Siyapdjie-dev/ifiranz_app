import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ifiranz_client/src/features/auth/core/infrastructure/firebase_authenticator_repository.dart';

import '../../../core/infrastructure/utils/common_import.dart';
import '../infrastructure/auth_repository.dart';

part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticate(String? token) = _Authenticate;
  const factory AuthState.unauthenticate() = _UnAuthenticate;
  const factory AuthState.failed(String? message) = _Failed;
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  final FirebaseAuthenticatorRepository _firebaseAuthenticatorRepository;
  AuthNotifier(this._authRepository, this._firebaseAuthenticatorRepository)
      : super(const AuthState.initial());

  Future<void> loginUser(
    String emailOrPhone,
    String password,
  ) async {
    state = const AuthState.loading();
    final authOrFailed =
        await _authRepository.loginUser(emailOrPhone, password);

    state = authOrFailed.fold(
      (l) => AuthState.failed(l.message),
      (r) => AuthState.authenticate(r),
    );
  }

  Future<void> loginWithGoogle() async {
    state = const AuthState.loading();
    final authOrFailed =
        await _firebaseAuthenticatorRepository.signUpWithGoogle();

    authOrFailed.traverseFuture((r) async {
      return await loginUser(r.user!.email!, r.user!.uid);
    });
  }

  // Future<void> checkAuthStatus() async {
  //   state = await (_authRepository.checkAuthStatus())
  //       ? const AuthState.authenticate()
  //       : const AuthState.unauthenticate();
  // }
}

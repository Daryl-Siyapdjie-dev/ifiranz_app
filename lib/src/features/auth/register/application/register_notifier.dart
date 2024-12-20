import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/infrastructure/firebase_authenticator_repository.dart';
import '../domain/profile_response.dart';
import '../infrastructure/register_repository.dart';

part 'register_notifier.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const RegisterState._();
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.success() = _Success;
  const factory RegisterState.authentificated() = _Authentificated;
  const factory RegisterState.failed([String? errorMessage]) = _Failed;
}

class RegisterNotifier extends StateNotifier<RegisterState> {
  final RegisterRepository _repository;
  final FirebaseAuthenticatorRepository _firebaseAuthenticatorRepository;

  RegisterNotifier(this._repository, this._firebaseAuthenticatorRepository)
      : super(const RegisterState.initial());

  Future<void> register({
    required String name,
    required String lastname,
    required String address,
    required String phoneNumber,
    required String countryCode,
    required String email,
    required String password,
    required String confirmPassword,
    required ProfileResponse profile,
  }) async {
    state = const RegisterState.loading();

    final failureOrSuccess = await _repository.register(
      name: name,
      lastname: lastname,
      address: address,
      countryCode: countryCode,
      phoneNumber: phoneNumber,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      profile: profile,
    );
    state = failureOrSuccess.fold(
      (l) => RegisterState.failed(l.message),
      (r) => const RegisterState.success(),
    );
  }

  Future<void> registerWithGoogle(ProfileResponse profile) async {
    state = const RegisterState.loading();
    final authOrFailed =
        await _firebaseAuthenticatorRepository.signUpWithGoogle();

    authOrFailed.traverseFuture((r) async {
      return await register(
        address: "",
        countryCode: r.user?.phoneNumber?.substring(1, 3) ?? "",
        name: r.user?.displayName ?? " ",
        lastname: r.user?.displayName ?? "",
        phoneNumber: r.user?.phoneNumber?.replaceAll("+", "00") ?? "0000000000",
        email: r.user?.email ?? '',
        password: r.user!.uid,
        confirmPassword: r.user!.uid,
        profile: profile,
      );
    });
  }
}

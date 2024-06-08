import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ifiranz_client/src/features/auth/reset_password/domain/reset_password_request.dart';
import 'package:ifiranz_client/src/features/auth/reset_password/domain/send_otp_response.dart';
import 'package:ifiranz_client/src/features/auth/reset_password/infrastructure/reset_password_repository.dart';

import '../../../core/infrastructure/utils/common_import.dart';

part 'reset_password_notifier.freezed.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const ResetPasswordState._();
  const factory ResetPasswordState.initial() = _Initial;
  const factory ResetPasswordState.loading() = _Loading;
  const factory ResetPasswordState.otpSendSuccess(SendOtpResponse res) =
      _OTPSendSuccess;

  const factory ResetPasswordState.otpVerifiedSuccess(String token) =
      _OTPVerifiedSuccess;

  const factory ResetPasswordState.successully() = _Successully;

  const factory ResetPasswordState.failed(String? message) = _Failed;
}

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  final ResetPasswordRepository _resetRepository;
  ResetPasswordNotifier(this._resetRepository)
      : super(const ResetPasswordState.initial());

  Future<void> resetPasswordByEmail(
    String email,
  ) async {
    state = const ResetPasswordState.loading();
    final authOrFailed = await _resetRepository.resetPasswordByEmail(email);

    state = authOrFailed.fold(
      (l) => ResetPasswordState.failed(l.message),
      (r) => ResetPasswordState.otpSendSuccess(r),
    );
  }

  Future<void> resetPasswordByPhoneNumber(
    String phone,
  ) async {
    state = const ResetPasswordState.loading();
    final authOrFailed =
        await _resetRepository.resetPasswordByPhoneNumber(phone);

    state = authOrFailed.fold(
      (l) => ResetPasswordState.failed(l.message),
      (r) => ResetPasswordState.otpSendSuccess(r),
    );
  }

  Future<void> resetPasswordWithPhoneNumber(
    ResetPasswordRequest request,
  ) async {
    state = const ResetPasswordState.loading();
    final authOrFailed =
        await _resetRepository.resetPasswordWithPhoneNumber(request);

    state = authOrFailed.fold(
      (l) => ResetPasswordState.failed(l.message),
      (r) => const ResetPasswordState.successully(),
    );
  }

  Future<void> resetPasswordWithEmail(
    ResetPasswordRequest request,
  ) async {
    state = const ResetPasswordState.loading();
    final authOrFailed = await _resetRepository.resetPasswordWithEmail(request);

    state = authOrFailed.fold(
      (l) => ResetPasswordState.failed(l.message),
      (r) => const ResetPasswordState.successully(),
    );
  }

  Future<void> findByOtp(
    ResetPasswordRequest request,
  ) async {
    state = const ResetPasswordState.loading();
    final authOrFailed = await _resetRepository.findByOtp(request);

    state = authOrFailed.fold(
      (l) => ResetPasswordState.failed(l.message),
      (r) => ResetPasswordState.otpVerifiedSuccess(request.token),
    );
  }
}

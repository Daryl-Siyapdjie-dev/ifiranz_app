import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_request.freezed.dart';

@freezed
class ResetPasswordRequest with _$ResetPasswordRequest {
  factory ResetPasswordRequest({
    required String token,
    required String phoneOrEmail,
    String? password,
    String? otp,
  }) = _ResetPasswordRequest;
}

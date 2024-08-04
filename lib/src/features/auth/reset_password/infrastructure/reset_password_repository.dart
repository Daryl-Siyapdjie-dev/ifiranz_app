import 'package:dartz/dartz.dart';
import '../domain/reset_password_request.dart';
import '../domain/send_otp_response.dart';
import 'reset_password_remote_service.dart';
import '../../../core/domain/api_failure.dart';
import '../../../core/infrastructure/utils/api_exception.dart';

class ResetPasswordRepository {
  final ResetPasswordRemoteService _resetRemoteService;

  ResetPasswordRepository(this._resetRemoteService);

  Future<Either<ApiFailure, ForgotPasswordResponse>> resetPasswordByEmail(
    String email,
  ) async {
    try {
      final response = await _resetRemoteService.resetPasswordByEmail(
        email: email,
      );

      return right(
        await response.when(
          success: (res) => ForgotPasswordResponse.fromJson(res!),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, ForgotPasswordResponse>> resetPasswordByPhoneNumber(
    String phone,
  ) async {
    try {
      final response = await _resetRemoteService.resetPasswordByPhoneNumber(
        phone: phone,
      );

      return right(
        await response.when(
          success: (res) => ForgotPasswordResponse.fromJson(res!),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, ForgotPasswordResponse>> findByOtp(
      String emailOrPhone, String otp) async {
    try {
      final response = await _resetRemoteService.verifyOTP(emailOrPhone, otp);

      return right(
        await response.when(
          success: (res) => ForgotPasswordResponse.fromJson(res!),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, ForgotPasswordResponse>> resetPasswordWithEmail(
      ResetPasswordRequest request) async {
    try {
      final response =
          await _resetRemoteService.resetPasswordWithEmail(request);

      return right(
        await response.when(
          success: (res) => ForgotPasswordResponse.fromJson(res!),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, ForgotPasswordResponse>>
      resetPasswordWithPhoneNumber(ResetPasswordRequest request) async {
    try {
      final response =
          await _resetRemoteService.resetPasswordWithPhoneNumber(request);

      return right(
        await response.when(
          success: (res) => ForgotPasswordResponse.fromJson(res!),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }
}

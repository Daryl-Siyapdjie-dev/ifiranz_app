import 'package:dartz/dartz.dart';
import 'package:ifiranz_client/src/features/auth/reset_password/domain/reset_password_request.dart';
import 'package:ifiranz_client/src/features/auth/reset_password/domain/send_otp_response.dart';
import 'package:ifiranz_client/src/features/auth/reset_password/infrastructure/reset_password_remote_service.dart';
import 'package:ifiranz_client/src/features/core/domain/api_failure.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_exception.dart';

class ResetPasswordRepository {
  final ResetPasswordRemoteService _resetRemoteService;

  ResetPasswordRepository(this._resetRemoteService);

  Future<Either<ApiFailure, SendOtpResponse>> resetPasswordByEmail(
    String email,
  ) async {
    try {
      final response = await _resetRemoteService.resetPasswordByEmail(
        email: email,
      );

      return right(
        await response.when(
          success: (res) => SendOtpResponse.fromJson(res!['datas']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, SendOtpResponse>> resetPasswordByPhoneNumber(
    String phone,
  ) async {
    try {
      final response = await _resetRemoteService.resetPasswordByPhoneNumber(
        phone: phone,
      );

      return right(
        await response.when(
          success: (res) => SendOtpResponse.fromJson(res!['datas']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, Unit>> findByOtp(
      ResetPasswordRequest request) async {
    try {
      final response = await _resetRemoteService.findByOtp(request);

      return right(
        await response.when(
          success: (_) => unit,
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, Unit>> resetPasswordWithEmail(
      ResetPasswordRequest request) async {
    try {
      final response =
          await _resetRemoteService.resetPasswordWithEmail(request);

      return right(
        await response.when(
          success: (_) => unit,
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, Unit>> resetPasswordWithPhoneNumber(
      ResetPasswordRequest request) async {
    try {
      final response =
          await _resetRemoteService.resetPasswordWithPhoneNumber(request);

      return right(
        await response.when(
          success: (_) => unit,
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }
}

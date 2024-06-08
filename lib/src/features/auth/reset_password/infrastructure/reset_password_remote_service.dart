import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ifiranz_client/src/features/auth/reset_password/domain/reset_password_request.dart';
import 'package:ifiranz_client/src/features/core/domain/type_defs.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/user_local_credentials_repository.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/handle_api_call.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/header_builder.dart';
import 'package:logger/logger.dart';

import '../../../core/infrastructure/utils/api_response.dart';
import '../../../core/infrastructure/utils/url_builder.dart';

class ResetPasswordRemoteService {
  final UrlBuilder _urlBuilder;
  final UserLocalCredentialsRepository _userLocalCredentialsRepository;
  final Dio _dio;

  ResetPasswordRemoteService(
      this._urlBuilder, this._dio, this._userLocalCredentialsRepository);

  final _log = Logger();

  Future<ApiResponse<Json>> resetPasswordByEmail({
    required String email,
  }) async {
    final requestData = {
      "email": email,
    };
    _log.i(requestData);

    return handleApiCall<ApiResponse<Json>>(
      () =>
          _dio.post(_urlBuilder.buildResetPasswordByEmail(), data: requestData),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> resetPasswordByPhoneNumber({
    required String phone,
  }) async {
    final requestData = {
      "phone": phone,
    };
    _log.i(requestData);

    return handleApiCall<ApiResponse<Json>>(
        () => _dio.post(_urlBuilder.buildResetPasswordByPhone(),
            data: requestData),
        (data) => ApiResponse.success(data as Json));
  }

  Future<ApiResponse<Unit>> findByOtp(ResetPasswordRequest request) async {
    return handleApiCall<ApiResponse<Unit>>(
        () => _dio.get(_urlBuilder.buildFindByOtp(request.otp!),
            options: Options(
                headers: HeaderBuilder.resetPasswordHeaders(request.token))),
        (data) => const ApiResponse.success(unit),
        displayErrorMessage: "Invalid OTP");
  }

  Future<ApiResponse<Unit>> resetPasswordWithPhoneNumber(
      ResetPasswordRequest request) async {
    final requestData = {"password": request.password};
    _log.i(requestData);

    return handleApiCall<ApiResponse<Unit>>(
        () => _dio.put(
            _urlBuilder.buildResetPasswordWithPhone(request.phoneOrEmail),
            options: Options(
                headers: HeaderBuilder.resetPasswordHeaders(request.token)),
            data: requestData), (data) {
      _userLocalCredentialsRepository.updateUserLocalCredentials(
          accesToken: request.token);
      return const ApiResponse.success(unit);
    });
  }

  Future<ApiResponse<Unit>> resetPasswordWithEmail(
      ResetPasswordRequest request) async {
    final requestData = {"password": request.password};
    _log.i(requestData);

    return handleApiCall<ApiResponse<Unit>>(
      () => _dio.put(
          _urlBuilder.buildResetPasswordWithEmail(request.phoneOrEmail),
          options: Options(
              headers: HeaderBuilder.resetPasswordHeaders(request.token)),
          data: requestData),
      (data) {
        _userLocalCredentialsRepository.updateUserLocalCredentials(
            accesToken: request.token);
        return const ApiResponse.success(unit);
      },
    );
  }
}

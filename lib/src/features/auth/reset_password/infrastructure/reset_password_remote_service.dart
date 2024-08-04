import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../core/domain/type_defs.dart';
import '../../../core/infrastructure/services/local/user_local_credentials_repository.dart';
import '../../../core/infrastructure/utils/api_response.dart';
import '../../../core/infrastructure/utils/handle_api_call.dart';
import '../../../core/infrastructure/utils/header_builder.dart';
import '../../../core/infrastructure/utils/url_builder.dart';
import '../domain/reset_password_request.dart';
import '../domain/send_otp_response.dart';

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

  Future<ApiResponse<Json>> verifyOTP(String emailOrPhone, String otp) async {
    _log.i("Values: $emailOrPhone $otp");
    _log.i("Url: ${_urlBuilder.buildVerifyOTP()}");
    return handleApiCall<ApiResponse<Json>>(
      () => _dio.post(
        _urlBuilder.buildVerifyOTP(),
        data: {
          "emailOrPhone": emailOrPhone,
          "otp": otp,
        },
      ),
      (data) => ApiResponse.success(data as Json),
      displayErrorMessage: "Invalid OTP",
    );
  }

  Future<ApiResponse<Json>> resetPasswordWithPhoneNumber(
      ResetPasswordRequest request) async {
    final body = {
      "email": request.phoneOrEmail,
      // "phone": "+237690111288" // You can use email or phone depend on the way you generated the OTP
      "newPassword": request.password,
      "otp": request.token,
    };
    _log.i(body);

    return handleApiCall<ApiResponse<Json>>(
      () => _dio.post(
        _urlBuilder.buildResetPasswordWithEmail(),
        data: {
          // "email": request.phoneOrEmail,
          "phone": request.phoneOrEmail,
          "newPassword": request.password,
          "otp": request.token,
        },
      ),
      (data) {
        // _userLocalCredentialsRepository.updateUserLocalCredentials(
        //     accesToken: request.token);
        return ApiResponse.success(data as Json);
      },
    );
  }

  // Old way to resetPasswordWithEmail

  // Future<ApiResponse<Unit>> resetPasswordWithEmail(
  //     ResetPasswordRequest request) async {
  //   final requestData = {"password": request.password};
  //   _log.i(requestData);

  //   return handleApiCall<ApiResponse<Unit>>(
  //     () => _dio.put(
  //       _urlBuilder.buildResetPasswordWithEmail(request.phoneOrEmail),
  //       options:
  //           Options(headers: HeaderBuilder.resetPasswordHeaders(request.token)),
  //       data: requestData,
  //     ),
  //     (data) {
  //       _userLocalCredentialsRepository.updateUserLocalCredentials(
  //           accesToken: request.token);
  //       return const ApiResponse.success(unit);
  //     },
  //   );
  // }
  Future<ApiResponse<Json>> resetPasswordWithEmail(
    ResetPasswordRequest request,
  ) async {
    final body = {
      "email": request.phoneOrEmail,
      // "phone": "+237690111288" // You can use email or phone depend on the way you generated the OTP
      "newPassword": request.password,
      "otp": request.token,
    };
    _log.i(body);

    return handleApiCall<ApiResponse<Json>>(
      () => _dio.post(
        _urlBuilder.buildResetPasswordWithEmail(),
        data: {
          "email": request.phoneOrEmail,
          // "phone": "+237690111288" // You can use email or phone depend on the way you generated the OTP
          "newPassword": request.password,
          "otp": request.token,
        },
      ),
      (data) {
        // _userLocalCredentialsRepository.updateUserLocalCredentials(
        //     accesToken: request.token);
        return ApiResponse.success(data as Json);
      },
    );
  }
}

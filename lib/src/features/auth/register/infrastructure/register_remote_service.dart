import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ifiranz_client/src/features/auth/register/domain/add_merchant_client_request.dart';
import 'package:ifiranz_client/src/features/auth/register/domain/profile_response.dart';
import 'package:ifiranz_client/src/features/core/domain/type_defs.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/handle_api_call.dart';
import '../../../core/infrastructure/utils/api_constants.dart';
import '../../../core/infrastructure/utils/api_response.dart';
import '../../../core/infrastructure/utils/url_builder.dart';
import '../domain/add_client_request.dart';

class RegisterRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  RegisterRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> findProfilByName() async {
    return handleApiCall<ApiResponse<Json>>(
      () => _dio.get(_urlBuilder.buildFindProfilByName()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> registerUserAdditionalInfo(
      AddClientRequest request) async {
    return handleApiCall<ApiResponse<Json>>(
      () => _dio.post(_urlBuilder.buildRegisterUserAdditionalInfo(),
          data: request.toJson()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> addCostumer(
      AddMerchantClientRequest request) async {
    print(request.toJson());
    return handleApiCall<ApiResponse<Json>>(
      () => _dio.post(_urlBuilder.buildAddMerchantCostumer(), data: {
        "name": request.name,
        "email": request.email,
        "phone": request.phone,
        "marchand": {"id": request.marchant.id}
      }),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Unit>> register({
    required String name,
    required String lastname,
    required String address,
    required String phoneNumber,
    required String countryCode,
    String? email,
    required String password,
    required String confirmPassword,
    required ProfileResponse profile,
  }) async {
    final requestData = {
      "email": email,
      "password": password,
      "phone": phoneNumber,
      "role": profile.name,
      "status": ApiConstants.activeStatusLower,
      "countryCode": countryCode,
      "client": {
        "nom": name,
        "prenom": lastname,
        "adresse": address,
        "latitude": null,
        "longitude": null
      },
      // "profil": profile.toJson(),
      // "connexion": "autres",
    };

    debugPrint("REGISTER POST DATA: $requestData");

    return handleApiCall<ApiResponse<Unit>>(
      () => _dio.post(_urlBuilder.buildRegisterUser(), data: requestData),
      (data) {
        return const ApiResponse.success();
      },
    );
  }
}

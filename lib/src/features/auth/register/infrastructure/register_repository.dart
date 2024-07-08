import 'package:dartz/dartz.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client.dart';
import 'package:ifiranz_client/src/features/auth/register/domain/add_merchant_client_request.dart';
import 'package:ifiranz_client/src/features/auth/register/domain/profile_response.dart';

import '../../../core/domain/api_failure.dart';
import '../../../core/infrastructure/utils/api_exception.dart';
import '../domain/add_client_request.dart';
import 'register_remote_service.dart';

class RegisterRepository {
  final RegisterRemoteService _remoteService;

  RegisterRepository(this._remoteService);

  Future<ProfileResponse> findProfilByName() async {
    try {
      final registerResponse = await _remoteService.findProfilByName();

      return await registerResponse.when(
        success: (res) => ProfileResponse.fromJson(res!['datas']['data']),
      );
    } on ApiException catch (e) {
      throw ApiFailure.failure(e.msg);
    }
  }

  Future<Either<ApiFailure, Unit>> register({
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
    try {
      final registerResponse = await _remoteService.register(
          name: name,
          lastname: lastname,
          address: address,
          countryCode: countryCode,
          email: email,
          phoneNumber: phoneNumber,
          password: password,
          confirmPassword: confirmPassword,
          profile: profile);
      return right(
        await registerResponse.when(
          success: (_) => unit,
        ),
      );
    } on ApiException catch (e) {
      return left(ApiFailure.failure(e.msg));
    }
  }

  Future<Either<ApiFailure, Client>> registerUserAdditionalInfo(
      {required AddClientRequest request}) async {
    try {
      final registerResponse =
          await _remoteService.registerUserAdditionalInfo(request);
      return right(
        await registerResponse.when(
          success: (res) => Client.fromJson(res!['record']),
        ),
      );
    } on ApiException catch (e) {
      return left(ApiFailure.failure(e.msg));
    }
  }

  Future<Either<ApiFailure, Client>> addCostumer(
      {required AddMerchantClientRequest request}) async {
    try {
      final registerResponse = await _remoteService.addCostumer(request);
      return right(
        await registerResponse.when(
          success: (res) => Client.fromJson(res!['record']),
        ),
      );
    } on ApiException catch (e) {
      return left(ApiFailure.failure(e.msg));
    }
  }
}

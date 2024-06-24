import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client_request.dart';
import 'package:ifiranz_client/src/features/auth/core/infrastructure/user_service.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/core/domain/api_failure.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_exception.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';

import '../../../core/domain/paginated_request.dart';

class GetCurrentUserRepository {
  final GetCurrentUserRemoteService _remoteService;

  GetCurrentUserRepository(this._remoteService);

  Future<Either<ApiFailure, Client>> getCurentClient(
      ClientRequest request) async {
    try {
      final registerResponse = await _remoteService.getCurentClient(request);

      return right(await registerResponse.when(
        success: (res) {
          SharedPref.setClientLocalUser(
              Client.fromJson((res!['records'] as List).first));
          return Client.fromJson((res['records'] as List).first);
        },
      ));
    } on ApiException catch (e) {
      return left(ApiFailure.failure(e.msg));
    }
  }

  Future<Either<ApiFailure, Merchant>> getCurentMarchand(int id) async {
    try {
      final registerResponse = await _remoteService.findMerchandById(id);

      return right(
        await registerResponse.when(
          success: (res) {
            SharedPref.setLocalUser(Merchant.fromJson((res!['record'])));
            return Merchant.fromJson(res['record']);
          },
        ),
        // await registerResponse.when(
        //   success: (res) {
        //     SharedPref.setLocalUser(
        //         Merchant.fromJson((res!['records'] as List).first));
        //     return Merchant.fromJson((res['records'] as List).first);
        //   },
        // ),
      );
    } on ApiException catch (e) {
      return left(ApiFailure.failure(e.msg));
    }
  }

  Future<Either<ApiFailure, List<Merchant>>> getAllMarchand(
      PaginatedRequest params) async {
    try {
      final registerResponse = await _remoteService.getAllMarchands(params);

      return right(await registerResponse.when(
        success: (res) {
          return (res!['records'] as List)
              .map((e) => Merchant.fromJson(e))
              .toList();
        },
      ));
    } on ApiException catch (e) {
      return left(ApiFailure.failure(e.msg));
    }
  }

  Future<Either<ApiFailure, Livreur>> getCurentDeliver(
      FilterOptional request) async {
    try {
      final registerResponse = await _remoteService.getCurentDeliver(request);

      return right(await registerResponse.when(
        success: (res) {
          SharedPref.setDeliverLocalUser(
              Livreur.fromJson((res!['records'] as List).first));
          return Livreur.fromJson((res['records'] as List).first);
        },
      ));
    } on ApiException catch (e) {
      return left(ApiFailure.failure(e.msg));
    }
  }

  Future<Either<ApiFailure, Merchant>> updateMerchand(Merchant request) async {
    try {
      final registerResponse = await _remoteService.updateMerchand(request);

      return right(await registerResponse.when(
        success: (res) {
          SharedPref.setLocalUser(Merchant.fromJson((res!['record'])));
          return Merchant.fromJson(res['record']);
        },
      ));
    } on ApiException catch (e) {
      return left(ApiFailure.failure(e.msg));
    }
  }

  Future<Either<ApiFailure, Merchant>> updateProfileMerchand(
      {required int id, required File image}) async {
    try {
      final registerResponse =
          await _remoteService.updateProfileMerchand(id: id, image: image);

      return right(await registerResponse.when(
        success: (res) {
          SharedPref.setLocalUser(Merchant.fromJson((res!['record'])));
          return Merchant.fromJson(res['record']);
        },
      ));
    } on ApiException catch (e) {
      return left(ApiFailure.failure(e.msg));
    }
  }

  Future<Merchant> findMerchandById(int id) async {
    try {
      final registerResponse = await _remoteService.findMerchandById(id);

      return await registerResponse.when(
        success: (res) {
          return Merchant.fromJson(res!['record']);
        },
      );
    } on ApiException catch (e) {
      throw ApiFailure.failure(e.msg);
    }
  }
}

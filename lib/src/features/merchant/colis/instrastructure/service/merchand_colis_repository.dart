import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/core/domain/api_failure.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';
import 'package:ifiranz_client/src/features/merchant/colis/domain/add_colis_request.dart';
import 'package:ifiranz_client/src/features/merchant/colis/instrastructure/service/merchand_colis_remote_service.dart';

import '../../../../core/domain/paginated_response.dart';
import '../../../../core/infrastructure/utils/api_exception.dart';

class ColisRepository {
  final MerchandColisRemoteService _colisRemoteService;

  ColisRepository(this._colisRemoteService);

  Future<Either<ApiFailure, PaginatedResponse<Commande>>> getAllColis(PaginatedRequest params, [List<FilterOptional> request = const []]) async {
    try {
      final response =
          await _colisRemoteService.getAllColis(params, [FilterOptional(key: "isParcel", value: true, applyAnd: true, type: "EQUAL"), ...request]);

      return right(
        await response.when(
          success: (res) => PaginatedResponse<Commande>(
              data: (res!['records'] as List).map((e) => Commande.fromJson(e)).toList(),
              totalElements: res['totalPages'],
              totalPages: res['totalElements']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, Commande>> createColis(AddColisRequest request) async {
    try {
      final response = await _colisRemoteService.createColis(request);

      return right(Commande.fromJson(response.data!['record']));
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, ProductModel>> updateProduct(ProductModel request, [File? image]) async {
    try {
      final response = await _colisRemoteService.updateProduct(request);

      if (image is File) {
        final response = await _colisRemoteService.addOrUPdateProductImage(articleId: request.id!, image: image);

        return right(await response.when(success: (res) => ProductModel.fromJson(res!['record'])));
      }

      return right(await response.when(success: (res) => ProductModel.fromJson(res!['record'])));
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, Unit>> deleteProdcuct(
    int id,
  ) async {
    try {
      final response = await _colisRemoteService.deleteProdcuct(id);

      return right(response.when(success: (_) => unit));
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<ProductModel> findById(
    int id,
  ) async {
    try {
      final response = await _colisRemoteService.findById(id);

      return response.when(success: (res) => ProductModel.fromJson(res!['record']));
    } on ApiException catch (apiException) {
      throw ApiFailure.failure(apiException.msg);
    }
  }
}

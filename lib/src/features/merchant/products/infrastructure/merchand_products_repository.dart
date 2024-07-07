import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../client/home/domain/filter_optional.dart';
import '../../../client/home/domain/product_model.dart';
import '../../../core/domain/api_failure.dart';
import '../../../core/domain/paginated_request.dart';
import '../../../core/domain/paginated_response.dart';
import '../../../core/infrastructure/services/local/shared_pref.dart';
import '../../../core/infrastructure/utils/api_exception.dart';
import 'merchand_products_remote_service.dart';

class ProductsRepository {
  final MerchandProductsRemoteService _productRemoteService;

  ProductsRepository(this._productRemoteService);

  Future<Either<ApiFailure, PaginatedResponse<ProductModel>>> getListProducts(
      PaginatedRequest params,
      [List<FilterOptional> request = const []]) async {
    try {
      final response = await _productRemoteService.getAllProducts(params, [
        FilterOptional.fromJson({
          "key": "userCreate",
          "value": SharedPref.getEmail(),
          "type": "EQUAL",
          "applyAnd": true
        }),
        ...request
      ]);

      return right(
        await response.when(
          success: (res) => PaginatedResponse<ProductModel>(
              data: (res!['records'] as List)
                  .map((e) => ProductModel.fromJson(e))
                  .toList(),
              totalElements: res['totalPages'],
              totalPages: res['totalElements']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, ProductModel>> createProduct(
      ProductModel request, File image) async {
    try {
      final response = await _productRemoteService.createProdcuct(request);

      final responseEnd = await _productRemoteService.addOrUPdateProductImage(
          articleId: ProductModel.fromJson(response.data!['record']).id!,
          image: image);

      return right(await responseEnd.when(
          success: (res) => ProductModel.fromJson(res!['record'])));
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, ProductModel>> addOrUPdateProductImage(
      {required int articleId, required File image}) async {
    try {
      final response = await _productRemoteService.addOrUPdateProductImage(
          articleId: articleId, image: image);

      return right(await response.when(
          success: (res) => ProductModel.fromJson(res!['record'])));
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, ProductModel>> updateProduct(ProductModel request,
      [File? image]) async {
    try {
      final response = await _productRemoteService.updateProduct(request);

      if (image is File) {
        final response = await _productRemoteService.addOrUPdateProductImage(
            articleId: request.id!, image: image);

        return right(await response.when(
            success: (res) => ProductModel.fromJson(res!['record'])));
      }

      return right(await response.when(
          success: (res) => ProductModel.fromJson(res!['record'])));
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, Unit>> deleteProdcuct(
    int id,
  ) async {
    try {
      final response = await _productRemoteService.deleteProdcuct(id);

      return right(response.when(success: (_) => unit));
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<ProductModel> findById(
    int id,
  ) async {
    try {
      final response = await _productRemoteService.findById(id);

      return response.when(
          success: (res) => ProductModel.fromJson(res!['record']));
    } on ApiException catch (apiException) {
      throw ApiFailure.failure(apiException.msg);
    }
  }
}

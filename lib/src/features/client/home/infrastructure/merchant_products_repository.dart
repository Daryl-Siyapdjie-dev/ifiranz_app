import 'package:dartz/dartz.dart';

import '../../../core/domain/api_failure.dart';
import '../../../core/domain/paginated_request.dart';
import '../../../core/domain/paginated_response.dart';
import '../../../core/infrastructure/utils/api_exception.dart';
import '../domain/create_command_request.dart';
import '../domain/create_command_response.dart';
import '../domain/current_cart_response.dart';
import '../domain/filter_optional.dart';
import '../domain/product_model.dart';
import '../domain/quartier.dart';
import 'merchant_products_remote_service.dart';

class MerchantProductsRepository {
  final MerchantProductsRemoteService _merchantProductRemoteService;

  MerchantProductsRepository(this._merchantProductRemoteService);

  Future<Either<ApiFailure, PaginatedResponse<ProductModel>>>
      getListOfMerchantsProducts(PaginatedRequest params,
          List<FilterOptional> requests, String merchantId) async {
    try {
      final response = await _merchantProductRemoteService.getMerchantProducts(
        params,
        merchantId,
        requests,
      );

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

  Future<Either<ApiFailure, PaginatedResponse<ProductModel>>>
      getTop10Products() async {
    try {
      final response = await _merchantProductRemoteService
          .getTop10Products(PaginatedRequest());

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

  Future<Either<ApiFailure, CreateCommandResponse>> createCommande(
      CreateCommandRequest request) async {
    try {
      final response =
          await _merchantProductRemoteService.createCommande(request);

      return right(
        await response.when(
            success: (res) => CreateCommandResponse.fromJson(res!['record'])),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, CreateCommandResponse>> updateCommande(
      CurrentCartResponse request) async {
    try {
      final lastVersion = await findCommandeByCode(request.code!);

      final response = await _merchantProductRemoteService
          .updateCommande(lastVersion.copyWith(articles: request.articles));

      return right(
        await response.when(
            success: (res) => CreateCommandResponse.fromJson(res!['record'])),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, PaginatedResponse<ProductModel>>>
      findProductByDesignation(List<FilterOptional> filter) async {
    try {
      final response =
          await _merchantProductRemoteService.findProductByDesignation(filter);

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

  Future<Either<ApiFailure, PaginatedResponse<Quartier>>> findFilterAllQuartier(
      [List<FilterOptional>? filter]) async {
    try {
      final response =
          await _merchantProductRemoteService.findFilterAllQuartier(filter);

      return right(
        await response.when(
          success: (res) => PaginatedResponse<Quartier>(
              data: (res!['records'] as List)
                  .map((e) => Quartier.fromJson(e))
                  .toList(),
              totalElements: res['totalPages'],
              totalPages: res['totalElements']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<List<Quartier>> findFilterAllQuartierByPatter(String pattern) async {
    final response = await _merchantProductRemoteService.findFilterAllQuartier(
        [FilterOptional(value: pattern, type: "LIKE", key: "designation")]);

    return await response.when(
        success: (res) => (res!['records'] as List)
            .map((e) => Quartier.fromJson(e))
            .toList());
  }

  Future<Either<ApiFailure, PaginatedResponse<ProductModel>>>
      getMarchantProducts(List<FilterOptional> request, PaginatedRequest params,
          String merchantId) async {
    try {
      final response = await _merchantProductRemoteService.getMerchantProducts(
          params, merchantId, request);

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

  Future<Either<ApiFailure, CurrentCartResponse>> currentCart() async {
    try {
      final response = await _merchantProductRemoteService.currentCart();

      return right(
        await response.when(
            success: (res) => res!['record'] is! Map
                ? CurrentCartResponse(articles: [])
                : CurrentCartResponse.fromJson(res['record'])),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, ProductModel>> getProduit(String code) async {
    try {
      final response = await _merchantProductRemoteService.getProduct(code);

      return right(
        await response.when(
          success: (res) => ProductModel.fromJson(
            res!['record'],
          ),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<CurrentCartResponse> findCommandeByCode(String code) async {
    try {
      final response =
          await _merchantProductRemoteService.findCommandeByCode(code);

      return await response.when(
          success: (res) => res!['record'] is! Map
              ? CurrentCartResponse(articles: [])
              : CurrentCartResponse.fromJson(res['record']));
    } on ApiException catch (apiException) {
      throw ApiFailure.failure(apiException.msg);
    }
  }

  Future<Either<ApiFailure, Unit>> makeNotation(
      int idArticle, int note, String comment) async {
    try {
      final response = await _merchantProductRemoteService.buildMakeNotation(
          idArticle, note, comment);

      return right(await response.when(success: (_) => unit));
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }
}

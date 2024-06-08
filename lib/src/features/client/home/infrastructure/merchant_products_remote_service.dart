import 'package:dio/dio.dart';
import 'package:ifiranz_client/src/features/client/home/domain/create_command_request.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/type_defs.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_response.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/handle_api_call.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/url_builder.dart';

import '../domain/current_cart_response.dart';

class MerchantProductsRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  MerchantProductsRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> getMerchantProducts(
      PaginatedRequest params, String merchantId,
      [List<FilterOptional> request = const []]) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(
          _urlBuilder.buildGetMerchantProduit(params, merchantId),
          data: request.map((e) => e.toJson()).toList()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> getTop10Products(PaginatedRequest params,
      [List<FilterOptional> request = const []]) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.get(
        _urlBuilder.buildGetMostSellOfRestaurant(),
      ),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> getProduct(String code) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.get(_urlBuilder.buildGetProduit(code)),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> findArticleDuMarchand(FilterOptional params) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.buildFindArticleDuMarchand(),
          data: params.toJson()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> findProductByDesignation(
      List<FilterOptional> params) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.buildFindProduitByDesignation(),
          data: params.map((e) => e.toJson()).toList()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> buildMakeNotation(
      int idArticle, int note, String comment) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(
        _urlBuilder.buildMakeNotation(idArticle, note, comment),
      ),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> findFilterAllQuartier(
      [List<FilterOptional>? filters]) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.buildFindAllQuartier(),
          data:
              filters is List ? filters!.map((e) => e.toJson()).toList() : []),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> createCommande(CreateCommandRequest params) async {
    print(params.toApiJson());
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.buildCreateCommande(),
          data: params.toApiJson()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> updateCommande(CurrentCartResponse params) async {
    return handleApiCall<ApiResponse<Json>>(
      () async =>
          _dio.put(_urlBuilder.buildUpdateCommande(), data: params.toJson()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> currentCart() async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.get(_urlBuilder.buildGetCurrentCart()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> findCommandeByCode(String code) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.get(_urlBuilder.buildFindCommandeByCode(code)),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }
}

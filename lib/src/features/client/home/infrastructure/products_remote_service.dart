import 'package:dio/dio.dart';

import '../../../core/domain/paginated_request.dart';
import '../../../core/domain/type_defs.dart';
import '../../../core/infrastructure/utils/api_response.dart';
import '../../../core/infrastructure/utils/handle_api_call.dart';
import '../../../core/infrastructure/utils/url_builder.dart';
import '../domain/create_command_request.dart';
import '../domain/current_cart_response.dart';
import '../domain/filter_optional.dart';

class ProductsRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  ProductsRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> getAllProducts(PaginatedRequest params,
      [List<FilterOptional> request = const []]) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.buildGetAllProduit(params),
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

  Future<ApiResponse<Json>> findProductByName(
      String productName, PaginatedRequest request) async {
    final List<Map<String, String>> requestBody = [
      {
        "key": "designation",
        "value": productName.trim(),
        "type": "LIKE",
      }
    ];

    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(
        _urlBuilder.buildSearchProduct(request),
        data: requestBody,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      ),
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
    return handleApiCall<ApiResponse<Json>>(
      // () async => _dio.post(_urlBuilder.buildMerchandCreateCommande(),
      //     data: params.toJson()),
      () async =>
          _dio.post(_urlBuilder.buildCreateCommande(), data: params.toJson()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> updateCommande(CurrentCartResponse params) async {
    return handleApiCall<ApiResponse<Json>>(
      () async {
        print(params.toJson());
        return _dio.put(_urlBuilder.buildUpdateCommande(),
            data: params.toJson());
      },
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> deleteCommande(CurrentCartResponse params) async {
    return handleApiCall<ApiResponse<Json>>(
      () async =>
          _dio.delete(_urlBuilder.builDeleteCommand(params.id!), data: {}),
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

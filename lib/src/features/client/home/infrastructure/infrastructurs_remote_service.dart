import 'package:dio/dio.dart';

import '../../../core/domain/paginated_request.dart';
import '../../../core/domain/type_defs.dart';
import '../../../core/infrastructure/utils/api_response.dart';
import '../../../core/infrastructure/utils/handle_api_call.dart';
import '../../../core/infrastructure/utils/url_builder.dart';
import '../domain/create_command_request.dart';
import '../domain/current_cart_response.dart';
import '../domain/filter_optional.dart';

class InfrastructursRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  InfrastructursRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> getInfrastructurs(PaginatedRequest params,
      [List<FilterOptional> request = const []]) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.buildInfrastructur(params),
          data: request.map((e) => e.toJson()).toList()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> getTop10Infrastructurs(PaginatedRequest params,
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

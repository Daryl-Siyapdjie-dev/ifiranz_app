import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/type_defs.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/handle_api_call.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/url_builder.dart';
import 'package:ifiranz_client/src/features/merchant/colis/domain/add_colis_request.dart';

import '../../../../core/infrastructure/utils/api_response.dart';

class MerchandColisRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  MerchandColisRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> getAllColis(PaginatedRequest params, List<FilterOptional> request) async {
    print(request);
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.builV2MerchantCommands(params), data: request.map((e) => e.toJson()).toList()),
      (data) {
        print(data);
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> createColis(AddColisRequest request) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.buildAddMerchantColis(), data: request.toJson()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> addOrUPdateProductImage({required int articleId, required File image}) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.builMerchantAddArticleImage(articleId),
          options: Options(headers: {"Accept": "application/json", "Content-Type": "multipart/form-data"}),
          data: FormData.fromMap({"multipartFile": await MultipartFile.fromFile(image.path, filename: "url.jpg")})),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> deleteProdcuct(int id) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.delete(
        _urlBuilder.builMerchantDeleteArticle(id),
      ),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> updateProduct(ProductModel request) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.put(_urlBuilder.builMerchantUpdateProduct(), data: request.toJson()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> findById(int id) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.get(
        _urlBuilder.builMerchantFindByIdArticle(id),
      ),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }
}

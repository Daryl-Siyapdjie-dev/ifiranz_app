import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client_request.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/core/domain/type_defs.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_response.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/handle_api_call.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/url_builder.dart';

import '../../../core/domain/paginated_request.dart';

class GetCurrentUserRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  GetCurrentUserRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> getCurentClient(ClientRequest request) async {
    return handleApiCall<ApiResponse<Json>>(
      () => _dio.post(_urlBuilder.buildGetCurentClient(), data: [request.toJson()]),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> getCurentMarchand(FilterOptional request) async {
    return handleApiCall<ApiResponse<Json>>(
      () => _dio.post(_urlBuilder.buildGetMerchantUser(), data: [request.toJson()]),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> getAllMarchands(PaginatedRequest params) async {
    return handleApiCall<ApiResponse<Json>>(
      () => _dio.post(_urlBuilder.buildGetMerchantUser(params), data: []),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> getCurentDeliver(FilterOptional request) async {
    return handleApiCall<ApiResponse<Json>>(
      () => _dio.post(_urlBuilder.buildGetLivreurUser(), data: [request.toJson()]),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> findMerchandById(int id) async {
    return handleApiCall<ApiResponse<Json>>(
      () => _dio.get(
        _urlBuilder.builMerchantFindByIdMarchand(id),
      ),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> updateMerchand(Merchant request) async {
    return handleApiCall<ApiResponse<Json>>(
      () => _dio.put(_urlBuilder.builMerchantUpdateMerchand(), data: request.toJson()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> updateProfileMerchand({required int id, required File image}) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.builMerchantAddMerchandImage(id), options: Options(headers: {"Accept": "application/json", "Content-Type": "multipart/form-data"}), data: FormData.fromMap({"multipartFile": await MultipartFile.fromFile(image.path, filename: "url.jpg")})),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }
}

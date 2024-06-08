import 'package:dio/dio.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/type_defs.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/handle_api_call.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/url_builder.dart';
import 'package:ifiranz_client/src/features/merchant/products/domain/type/type_request.dart';

import '../../../core/infrastructure/utils/api_response.dart';

class MerchandTypesRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  MerchandTypesRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> getAllTypes(PaginatedRequest params) async {
    return handleApiCall<ApiResponse<Json>>(
      () async =>
          _dio.post(_urlBuilder.builMerchantGetProductTypes(params), data: []),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> createType(TypeRequest request) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.builMerchantCreateProductType(),
          data: request.toJson()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }
}

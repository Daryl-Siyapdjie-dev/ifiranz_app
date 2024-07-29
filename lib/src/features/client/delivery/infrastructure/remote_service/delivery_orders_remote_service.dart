import 'package:dio/dio.dart';

import '../../../../core/domain/paginated_request.dart';
import '../../../../core/domain/type_defs.dart';
import '../../../../core/infrastructure/utils/api_response.dart';
import '../../../../core/infrastructure/utils/handle_api_call.dart';
import '../../../../core/infrastructure/utils/url_builder.dart';
import '../../../home/domain/filter_optional.dart';

class DeliveryOrdersRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  DeliveryOrdersRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> getCurrentDeliveries(
    PaginatedRequest params,
  ) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.get(_urlBuilder.buildCurrentDeliveries()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> getListDeliveryOrders(
      PaginatedRequest params, List<FilterOptional> filterOptions) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.builMerchantDeliveries(params),
          data: filterOptions.map((e) => e.toJson()).toList()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> getAllUserDeliveries(
      PaginatedRequest params, List<FilterOptional> filterOptions) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.buildGetAllUserDeliveries(params),
          data: filterOptions.map((e) => e.toJson()).toList()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }
}

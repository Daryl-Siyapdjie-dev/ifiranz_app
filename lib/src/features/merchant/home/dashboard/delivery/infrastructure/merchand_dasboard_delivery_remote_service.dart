import 'package:dio/dio.dart';

import '../../../../../client/home/domain/filter_optional.dart';
import '../../../../../core/domain/paginated_request.dart';
import '../../../../../core/domain/type_defs.dart';
import '../../../../../core/infrastructure/utils/api_response.dart';
import '../../../../../core/infrastructure/utils/handle_api_call.dart';
import '../../../../../core/infrastructure/utils/url_builder.dart';

class MerchandDashboardDeliveryRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  MerchandDashboardDeliveryRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> merchantDeliveries({
    required PaginatedRequest params,
    required List<FilterOptional> request,
  }) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.builMerchantDeliveries(params),
          data: request.map((e) => e.toJson()).toList()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> getMerchantCommissions({
    required PaginatedRequest params,
  }) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.get(
        _urlBuilder.buildMerchantCommission(params),
      ),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> getMerchandOrders({
    required PaginatedRequest params,
    required List<FilterOptional> request,
  }) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(
        _urlBuilder.buildMerchantOrders(params),
        data: request.map((e) => e.toJson()).toList(),
      ),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> getMerchantDeliveries({
    required PaginatedRequest params,
    required List<FilterOptional> request,
  }) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(
        _urlBuilder.buildMerchantDeliveries(params),
        data: request.map((e) => e.toJson()).toList(),
      ),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }
}

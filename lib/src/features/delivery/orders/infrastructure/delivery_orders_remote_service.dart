import 'package:dio/dio.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/type_defs.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_response.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/handle_api_call.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/url_builder.dart';

class DeliveryOrdersRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  DeliveryOrdersRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> getListDeliveryOrders(PaginatedRequest params) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.buildGetListOrders(params), data: []),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> filterOrders(List<FilterOptional> request, PaginatedRequest params) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.buildGetListOrders(params), data: request.map((e) => e.toJson()).toList()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> getListDashboardDeliveryOrders(PaginatedRequest params) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.buildGetListOrders(params), data: [
        {"key": "code", "value": SharedPref.getEmail(), "type": "EQUAL", "aliasKey": "livreur.user"}
      ]),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> acceptDeliveryOrder(int id) async {
    return handleApiCall<ApiResponse<Json>>(
      () => _dio.get(_urlBuilder.buildAcceptDeliveryOrder(id)),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> denyDeliveryOrder(int id) async {
    return handleApiCall<ApiResponse<Json>>(
      () => _dio.get(_urlBuilder.buildDenyDeliveryOrder(id)),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> deliveryOrderFindByCode(String id) async {
    return handleApiCall<ApiResponse<Json>>(
      () => _dio.get(_urlBuilder.buildDeliveryOrderFindByCode(id)),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> sendOtpToDeliveryOrder(int id) async {
    return handleApiCall<ApiResponse<Json>>(
      () => _dio.get(_urlBuilder.buildSendOtpToDeliveryOrder(id)),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> validateOtpToDeliveryOrder(int id, String value) async {
    return handleApiCall<ApiResponse<Json>>(
      () => _dio.get(_urlBuilder.buildValidateOtpToDeliveryOrder(id, value)),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> updateDeliveryOrder(int id) async {
    return handleApiCall<ApiResponse<Json>>(
      () => _dio.get(_urlBuilder.buildUpdateDeliveryOrder(id)),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../client/home/domain/filter_optional.dart';
import '../../../../../core/domain/paginated_request.dart';
import '../../../../../core/domain/type_defs.dart';
import '../../../../../core/infrastructure/services/local/shared_pref.dart';
import '../../../../../core/infrastructure/utils/api_response.dart';
import '../../../../../core/infrastructure/utils/handle_api_call.dart';
import '../../../../../core/infrastructure/utils/url_builder.dart';

class MerchandClientsRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  MerchandClientsRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> getClients(
      PaginatedRequest params, List<FilterOptional> request) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.builSearchMerchantClient(params),
          data: request.map((e) => e.toJson()).toList()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> getMerchantClients(PaginatedRequest params) async {
    print(SharedPref.getId());
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.get(_urlBuilder.builMerchantClientList(params), data: {
        "id": SharedPref.getId(), // id du marchand
      }),
      (data) {
        debugPrint("CLIENTS: $data");
        return ApiResponse.success(data as Json);
      },
    );
  }
}

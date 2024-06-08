import 'package:dartz/dartz.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/core/domain/api_failure.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/merchant/products/domain/type/type_request.dart';
import 'package:ifiranz_client/src/features/merchant/products/domain/type/type_response.dart';

import 'package:ifiranz_client/src/features/merchant/products/infrastructure/merchand_type_products_remote_service.dart';

import '../../../core/domain/paginated_response.dart';
import '../../../core/infrastructure/utils/api_exception.dart';

class MerchandTypesRepository {
  final MerchandTypesRemoteService _productRemoteService;

  MerchandTypesRepository(this._productRemoteService);

  Future<Either<ApiFailure, PaginatedResponse<TypeResponse>>> getAllTypes(
      PaginatedRequest params) async {
    try {
      final response = await _productRemoteService.getAllTypes(params);

      return right(
        await response.when(
          success: (res) => PaginatedResponse<TypeResponse>(
              data: (res!['records'] as List)
                  .map((e) => TypeResponse.fromJson(e))
                  .toList(),
              totalElements: res['totalPages'],
              totalPages: res['totalElements']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, TypeResponse>> createType(
    TypeRequest request,
  ) async {
    try {
      final response = await _productRemoteService.createType(request);

      return right(await response.when(
          success: (res) => TypeResponse.fromJson(res!['record'])));
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }
}

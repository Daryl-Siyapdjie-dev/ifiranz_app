import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/dio_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_constants.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_exception.dart';

Future<T> handleApiCall<T>(Future<Response<dynamic>> Function() apiCall, T Function(Map val) successMapper, {String? displayErrorMessage}) async {
  try {
    final response = await apiCall();

    print(response);
    if (response.data is int) return successMapper({"data": response.data});

    if (response.data is Map &&
        (response.data?["valid"] == true || ((response.data?["statusCode"] ?? 0) >= 200 && (response.data?["statusCode"] ?? 0) <= 300))) {
      return successMapper(response.data);
    } else {
      if (response.data is Map) {
        if ((response.data?["valid"] ?? false) == false) {
          throw ApiException(msg: response.data?["message"].toString() ?? "An error occurred");
        }
        throw ApiException.fromJson(response.data);
      } else {
        throw ApiException(msg: displayErrorMessage ?? "An error occurred");
      }
    }
  } on DioException catch (e) {
    log(e.toString());
    if (e.noConnexionError) {
      throw const ApiException(msg: ApiConstants.internetError);
    } else if (e.response != null) {
      throw ApiException(msg: e.message);
    } else if (e.response == null && displayErrorMessage != null) {
      throw ApiException(msg: displayErrorMessage);
    } else {
      rethrow;
    }
  }
}

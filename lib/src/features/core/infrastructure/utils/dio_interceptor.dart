import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/user_local_credentials_repository.dart';

class DioInterceptor extends Interceptor {
  final UserLocalCredentialsRepository _userCredentialsStorage;

  DioInterceptor(this._userCredentialsStorage);
  final String _expireTokenString = 'The request returned an invalid status code of 403.';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _userCredentialsStorage.getUserLocalCredentials;

    print(token);
    final modifiedOptions = options
      ..headers.addAll(
        token == null
            ? {}
            : options.contentType == "multipart/form-data"
                ? {
                    "Accept": "application/json",
                    "Content-Type": "multipart/form-data",
                    'Authorization': 'Bearer $token',
                  }
                : {
                    'Accept': 'application/json',
                    'Authorization': 'Bearer $token',
                    'Content-Type': 'application/json',
                  },
      );

    log(options.path);
    handler.next(modifiedOptions);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    final errorResponse = err.response;

    if (errorResponse != null && (errorResponse.statusCode == 412 || errorResponse.statusCode == 401) ||
        (errorResponse?.statusCode == 403) && err.message == _expireTokenString) {
      _userCredentialsStorage.deleteUserLocalCredentials();
      EasyLoading.showToast('Votre token a expiré.');
    }
    super.onError(err, handler);
  }
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ifiranz_client/src/features/core/domain/type_defs.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_response.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/handle_api_call.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/url_builder.dart';

class ReportBugRemoteRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  ReportBugRemoteRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> sendReport(
      {required String message, required File image}) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.buildReportBug(message),
          options: Options(headers: {
            "Accept": "application/json",
            "Content-Type": "multipart/form-data"
          }),
          data: FormData.fromMap({
            "multipartFile":
                await MultipartFile.fromFile(image.path, filename: "url.jpg")
          })),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }
}

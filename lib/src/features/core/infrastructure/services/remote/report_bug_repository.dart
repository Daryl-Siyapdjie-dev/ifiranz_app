import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ifiranz_client/src/features/core/domain/api_failure.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/remote/report_bug_remote_service.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_exception.dart';

class ReportBugRepository {
  final ReportBugRemoteRemoteService _reportBugRemoteService;

  ReportBugRepository(this._reportBugRemoteService);

  Future<Either<ApiFailure, Unit>> sendReport(
      {required String message, required File image}) async {
    try {
      final response = await _reportBugRemoteService.sendReport(
          message: message, image: image);

      return right(
        await response.when(
          success: (_) => unit,
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }
}

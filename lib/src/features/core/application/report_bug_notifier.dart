import 'dart:io';

import 'package:ifiranz_client/src/features/core/infrastructure/services/remote/report_bug_repository.dart';

import '../infrastructure/utils/common_import.dart';

class ReportBugNotifier extends StateNotifier<AsyncValue> {
  ReportBugNotifier(this._repository) : super(const AsyncLoading());

  final ReportBugRepository _repository;

  Future sendReportBug(File image, String message) async {
    state = const AsyncLoading();

    final successOrFailed =
        await _repository.sendReport(message: message, image: image);

    state = successOrFailed.fold(
        (l) => AsyncError(l.message ?? "", StackTrace.current),
        (r) => AsyncData(r));
  }
}

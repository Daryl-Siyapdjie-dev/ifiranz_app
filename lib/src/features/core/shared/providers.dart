import 'package:dio/dio.dart';
import 'package:ifiranz_client/src/features/auth/sign_in/shared/providers.dart';
import 'package:ifiranz_client/src/features/core/application/report_bug_notifier.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/remote/report_bug_remote_service.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/remote/report_bug_repository.dart';
import 'package:ifiranz_client/src/features/core/services/notification_service.dart';

import '../infrastructure/services/local/form_validator_service.dart';
import '../infrastructure/utils/common_import.dart';
import '../infrastructure/utils/dio_interceptor.dart';
import '../infrastructure/utils/url_builder.dart';
import '../services/geolocation_service.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final urlBuilderProvider = Provider<UrlBuilder>((ref) {
  return UrlBuilder();
});

final formValidationServiceProvider = Provider<FormValidatorService>((ref) {
  return FormValidatorService();
});

final dioInterceptorProvider = Provider<DioInterceptor>((ref) {
  return DioInterceptor(ref.watch(userLocalCredentialsRepository));
});

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

final geoLocatorServiceProvider = Provider<GeoLocatorService>((ref) {
  return GeoLocatorService();
});

final reportBugRemoteRemoteService =
    Provider<ReportBugRemoteRemoteService>((ref) {
  return ReportBugRemoteRemoteService(
    ref.watch(urlBuilderProvider),
    ref.watch(dioProvider),
  );
});

final reportBugRepository = Provider<ReportBugRepository>((ref) {
  return ReportBugRepository(ref.watch(reportBugRemoteRemoteService));
});

final reportBugNotifierProvider =
    StateNotifierProvider.autoDispose<ReportBugNotifier, AsyncValue>((ref) {
  return ReportBugNotifier(
    ref.watch(reportBugRepository),
  );
});

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/infrastructure/services/local/shared_pref.dart';
import '../../../../../core/shared/providers.dart';
import '../infrastructure/merchand_dashboard_repository.dart';
import '../infrastructure/merchand_dashbord_remote_service.dart';

final dashRemoteService = Provider<MerchandDashboardRemoteService>((ref) {
  return MerchandDashboardRemoteService(
    ref.watch(urlBuilderProvider),
    ref.watch(dioProvider),
  );
});

final dashRepositoryProvider = Provider<MerchandDashboardRepository>((ref) {
  return MerchandDashboardRepository(ref.watch(dashRemoteService));
});

final merchantDashboardCountArticlesMerchandProvider =
    FutureProvider.autoDispose<int>((ref) {
  if (!ref.state.hasError) {
    ref.keepAlive();
  }
  return ref
      .watch(dashRepositoryProvider)
      .merchantDashboardCountArticlesMerchand();
});

final merchantDashboardCountTransactionsProvider =
    FutureProvider.autoDispose<int>((ref) {
  if (!ref.state.hasError) {
    ref.keepAlive();
  }
  return ref.watch(dashRepositoryProvider).merchantDashboardCountTransactions(
      SharedPref.getLocalUser()!.designation!);
});

final merchantDashboardCountLivraisonMerchandProvider =
    FutureProvider.autoDispose<int>((ref) {
  if (!ref.state.hasError) {
    ref.keepAlive();
  }
  return ref
      .watch(dashRepositoryProvider)
      .merchantDashboardCountLivraisonMerchand();
});

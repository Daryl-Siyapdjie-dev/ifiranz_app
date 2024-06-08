import 'package:ifiranz_client/src/features/auth/core/shared/provider.dart';
import 'package:ifiranz_client/src/features/merchant/core/application/merchand_notifier.dart';

import '../../../core/infrastructure/utils/common_import.dart';

final merchandNotifierProvider =
    StateNotifierProvider.autoDispose<MerchandNotifier, MerchandState>((ref) {
  return MerchandNotifier(
    ref.watch(getCurrentUserRepositoryProvider),
  );
});

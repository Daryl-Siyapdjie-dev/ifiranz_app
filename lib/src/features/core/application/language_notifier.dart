import '../infrastructure/utils/common_import.dart';

final languageNotifierProvider = StateNotifierProvider.autoDispose.family<LanguageNotifier, String?, String?>((ref, initialLocale) {
  return LanguageNotifier(initalLocale: initialLocale);
});

class LanguageNotifier extends StateNotifier<String?> {
  LanguageNotifier({String? initalLocale}) : super(initalLocale);

  void changeLocale(String value) {
    state = value.toLowerCase();

    print(state);
  }
}

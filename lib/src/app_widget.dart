import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/core/application/language_notifier.dart';
import 'features/core/infrastructure/services/local/shared_pref.dart';
import 'features/core/presentation/themes/app_themes.dart';
import 'features/core/shared/providers.dart';
import 'l10n/app_localizations.dart';
import 'router/app_router.dart';

final initializeProvider = FutureProvider<Unit>((ref) async {
  ref.watch(dioProvider)
    ..options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        "accept": "application/json",
      },
    )
    ..interceptors.add(
      ref.read(dioInterceptorProvider),
    );

  return unit;
});

class RouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint('/${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint('/${route.settings.name}');
  }
}

// Get an instance of AppRouter to handle routing
final _appRouter = AppRouter();

class AppWidget extends ConsumerStatefulWidget {
  const AppWidget({super.key});

  @override
  ConsumerState createState() => _AppWidgetState();
}

class _AppWidgetState extends ConsumerState<AppWidget> {
  @override
  Widget build(BuildContext context) {
    ref.listen(
      initializeProvider,
      (previous, next) {},
    );

    ref.listen(
      languageNotifierProvider(SharedPref.getLocale()),
      (previous, next) {
        if (previous != next) {
          setState(() => {});
        }
      },
    );

    return MaterialApp.router(
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          RouteObserver(),
        ],
      ),
      title: 'Ifiranz',
      restorationScopeId: 'app',
      locale: ref.watch(languageNotifierProvider(SharedPref.getLocale()))
              is String
          ? Locale(ref.watch(languageNotifierProvider(SharedPref.getLocale()))!)
          : null,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en', 'EN'),
        Locale('fr', 'FR'),
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).appTitle,
      theme: AppThemes.lightTheme(),
      builder: EasyLoading.init(),
    );
  }
}

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart'
    as flutter_libphonenumber;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/app_widget.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/core/services/notification_service.dart';
import 'package:logger/logger.dart' as log;
import 'package:logging/logging.dart';

import 'firebase_options.dart';

// Use to prind my providers to console
// for debugging purpos

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    //     {
    //   "provider": "${provider.name ?? provider.runtimeType}",
    //   "newValue": "$newValue"
    // }
  }
}

void _setupLogging() {
  final l = log.Logger();
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    l.d('${record.level.name}: ${record.time}: ${record.message}');
  });
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationService().onFirebaseOnBackgroundMessage(message);
}

void main() async {
  _setupLogging();
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await flutter_libphonenumber.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SharedPref.init();

  // Set device orientation to portrait mode
  // Device orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    ProviderScope(
      observers: [
        ProviderLogger(),
      ],
      overrides: const [
        // sharedPrefsProvider.overrideWith((ref) => sharedPrefs),
      ],
      child: const _Unfocus(child: AppWidget()),
    ),
  );
}

class _Unfocus extends HookConsumerWidget {
  const _Unfocus({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}

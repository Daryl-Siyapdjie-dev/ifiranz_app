import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';

const androidChannelId = "HIGH_IMPORTANCE_CHANNEL_ID";
const androidChannelName = "HIGH_IMPORTANCE_CHANNEL_NAME";

class NotificationService {
  NotificationService({FlutterLocalNotificationsPlugin? notif})
      : _localNotifications = notif ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin? _localNotifications;
  final channel = const AndroidNotificationChannel(
      androidChannelId, androidChannelName,
      importance: Importance.max,
      ledColor: AppColors.primaryColor,
      enableLights: true);
  Future<void> onFirebaseOnBackgroundMessage(RemoteMessage message,
      [FlutterLocalNotificationsPlugin? flnp]) async {
    onFirebaseOnMessage(message);
  }

  void config() {
    FirebaseMessaging.instance.requestPermission();
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    FirebaseMessaging.onBackgroundMessage(onFirebaseOnBackgroundMessage);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('_______receive foreground________');
      RemoteNotification? notification = message.notification;

      AndroidNotification? android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        _localNotifications!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: android.smallIcon,
                // other properties...
              ),
            ));
      }
    });
  }

  void onFirebaseOnMessage(
    RemoteMessage message,
  ) async {
    String? title = message.notification?.title;
    String? body = message.notification?.body;
    if (Platform.isAndroid) {
      fireLocalNotification(
        title: title,
        body: body,
        payload: jsonEncode(message.data),
      );
    }
  }

  Future init() async {
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {
        onLocalNotificationTap(payload);
      },
    );

    _localNotifications!
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    await _localNotifications!.initialize(
      InitializationSettings(
          android: const AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: initializationSettingsDarwin),
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        onLocalNotificationTap(notificationResponse.payload);
      },
    );

    return _localNotifications;
  }

  int x = 0;
  void fireLocalNotification(
      {String? title, String? body, String? payload}) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        androidChannelId, androidChannelName,
        priority: Priority.max,
        color: AppColors.primaryColor,
        enableLights: true);
    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails();
    const platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    x++;

    await _localNotifications!
        .show(x, title, body, platformChannelSpecifics, payload: payload);
  }

  Future<void> updateFirebaseToken() async {
    String? token = SharedPref.getFcmToken;

    if (token is! String) {
      token = await FirebaseMessaging.instance.getToken() ?? "";
      if (token != "") {
        SharedPref.fcmToken = token;
        // PlayerApiController(dio: locator<DioHttpConfig>().getDioInstance())
        //     .updateFirebaseToken(token, SharedPref.getPlayer()!.id);
      }
    }

    FirebaseMessaging.instance.onTokenRefresh.listen((token) {
      // PlayerApiController(dio: locator<DioHttpConfig>().getDioInstance())
      //     .updateFirebaseToken(token, SharedPref.getPlayer()!.id);
    });
  }

  Future<void> forceFirebaseToken() async {
    await FirebaseMessaging.instance.getToken().then((value) {
      SharedPref.fcmToken = value ?? "";
      // TODO:Mettre à jour les infos du user
      // PlayerApiController(dio: locator<DioHttpConfig>().getDioInstance())
      //     .updateFirebaseToken(value ?? "", SharedPref.getPlayer()!.id);
    });
  }

  void onLocalNotificationTap(String? payload) {
    if (payload != null) {
      jsonDecode(payload);
      // _onNotificationOnAppOpened(map);
    }
  }
}

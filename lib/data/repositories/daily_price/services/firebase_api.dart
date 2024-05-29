import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:se109_goldstore/presentations/revenue/notification_page.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('===LINH handleBackgroundMessage');
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Channel',
    description: 'This channel is used for important notification',
    importance: Importance.defaultImportance,
  );

  final _localNotification = FlutterLocalNotificationsPlugin();

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    print('===LINH handleMessage');
    navigatorKey.currentState?.pushNamed(
      NotificationPage.route,
      arguments: message,
    );
    print('===LINH MaterialPageRoute');
  }

  Future initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotification.show(
        notification.hashCode,
        notification.title,
        notification.body,
        payload: jsonEncode(message.toMap()),
        NotificationDetails(
          android: AndroidNotificationDetails(
              _androidChannel.id, _androidChannel.name,
              channelDescription: _androidChannel.description,
              icon: '@drawable/ic_launcher'),
        ),
      );
    });
  }

  Future initLocalNotification() async {
    print('===LINH initLocalNotification');
    const settings = InitializationSettings(
      iOS: DarwinInitializationSettings(),
      android: AndroidInitializationSettings('@drawable/ic_launcher'),
    );

    await _localNotification.initialize(settings,
        onDidReceiveNotificationResponse: (payload) {
      print('===LINH initialize');
      final message = RemoteMessage.fromMap(jsonDecode(payload.payload!));
      print('===LINH pre handleMessage');
      handleMessage(message);
    });

    final platform = _localNotification.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    initPushNotification();
    initLocalNotification();
  }
}

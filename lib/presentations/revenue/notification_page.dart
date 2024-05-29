import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});
  static const route = '/notification-page';

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    print('===LINH NotificationPage');
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Push notifications'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(message.notification?.title ?? ''),
            Text(message.notification?.body ?? ''),
            Text('${message.data}'),
          ],
        ),
      ),
    );
  }
}

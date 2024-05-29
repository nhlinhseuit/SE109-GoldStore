import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/constants/text_styles.dart';
import 'package:se109_goldstore/presentations/common/components/my_elevated_button.dart';
import 'package:se109_goldstore/presentations/general/alert_page.dart';
import 'package:se109_goldstore/presentations/general/price_page.dart';

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
      backgroundColor: const Color.fromARGB(255, 252, 245, 253),
      appBar: AppBar(
        backgroundColor: AppColor.secondDark,
        title: Text(
          'Thông báo',
          style: AppTextStyles.appbarTitle,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Lottie.network(
                'https://lottie.host/fb3fa31c-cac8-46ff-af66-5feccca8f6ca/hkg5kzIVqJ.json'),
            const SizedBox(
              height: 40,
            ),
            Text(
              message.notification?.title ?? '',
              style: AppTextStyles.appbarTitle.copyWith(
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Nhấn vào đây để đến trang cảnh báo',
              style: AppTextStyles.appbarTitle.copyWith(
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: MyElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AlertPage()),
                  );
                },
                text: 'Trang cảnh báo',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

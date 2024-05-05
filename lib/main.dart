import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se109_goldstore/constants/routers.dart';
import 'package:se109_goldstore/presentations/home/home_page.dart';

import 'constants/colors.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]); // Sử dụng SystemUiOverlay.top

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor:
          Colors.transparent, // Đặt màu transparent cho thanh trạng thái
      statusBarIconBrightness:
          Brightness.light, // Đặt màu của các biểu tượng trên thanh trạng thái
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      routes: {
        AppRouter.priceStatistic: (context) => const Placeholder(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        // brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColor.primaryGold,
          secondary: Colors.black,
        ),
        textTheme: TextTheme(
            bodyMedium: GoogleFonts.poppins(
                textStyle: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ))),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 300),
              child: Column(children: [
                Text(
                  'Golder',
                  style: GoogleFonts.allura(
                    color: AppColor.primaryGold,
                    fontSize: 100,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime? currentBackPressTime;
    Future<bool> handlePop(BuildContext context) async {
      final difference =
          DateTime.now().difference(currentBackPressTime ?? DateTime.now());
      final notPressed = currentBackPressTime == null ||
          difference > const Duration(seconds: 2);

      if (notPressed) {
        currentBackPressTime = DateTime.now();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Press again to exit!',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue, // Màu nền của SnackBar
            duration: Duration(seconds: 2), // Thời gian hiển thị SnackBar
          ),
        );
        return false;
      } else {
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else if (Platform.isIOS) {
          exit(0);
        }
        return true;
      }
    }

    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) => handlePop(context),
        child: const Scaffold(
          body: Center(child: HomePage()),
        ));
  }
}

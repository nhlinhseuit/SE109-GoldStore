import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se109_goldstore/constants/routers.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFFFF768E), // màu nền của thanh trạng thái
    statusBarIconBrightness: Brightness.dark, // màu icon trên thanh trạng thái
  ));
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
          primary: const Color(0xFFFF768E),
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
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 300),
          child: Column(children: [
            Image.asset(
              "assets/images/camera.png",
              width: 80,
            ),
            Text(
              'styLLe',
              style: GoogleFonts.allura(
                color: const Color(0xFFFF768E),
                fontSize: 100,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    DateTime? currentBackPressTime;
    Future<bool> onWillPop(pressed) {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
        currentBackPressTime = now;
        // Toast.showToast(msg: "Press again to exit app.");
        return Future.value(false);
      }
      return Future.value(true);
    }
    return PopScope(
      onPopInvoked: onWillPop,
      child: const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      )
    );
  }
}

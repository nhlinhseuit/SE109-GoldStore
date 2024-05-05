import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/presentations/chart/chart_page.dart';
import 'package:se109_goldstore/presentations/revenue/revenue_page.dart';

import '../general/price_page.dart';
import '../trend/trend_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final tabs = const <Widget>[
    PricePage(),
    ChartPage(),
    RevenuePage(),
    TrendPage(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // Chỉ áp dụng cho thanh trạng thái

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor:
            Color(0xFF0c0f25), // Đặt màu transparent cho thanh trạng thái
        statusBarIconBrightness: Brightness
            .light, // Đặt màu của các biểu tượng trên thanh trạng thái
      ),
    );

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: tabs,
      ),
      backgroundColor: const Color(0xFF161f48),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: AppColor.greyBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            )),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
        child: GNav(
          tabBackgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(7),
          tabs: const [
            GButton(
              icon: Icons.table_chart_rounded,
              iconActiveColor: AppColor.primaryGold,
              iconSize: 30,
              iconColor: AppColor.notActiveButton,
              text: '',
              textColor: Colors.black,
              gap: 0,
            ),
            GButton(
              icon: Icons.newspaper_rounded,
              iconActiveColor: AppColor.primaryGold,
              iconSize: 30,
              iconColor: AppColor.notActiveButton,
              text: '',
              textColor: Colors.black,
              gap: 0,
            ),
            GButton(
              icon: Icons.shopping_bag_rounded,
              iconActiveColor: AppColor.primaryGold,
              iconSize: 30,
              iconColor: AppColor.notActiveButton,
              textColor: Colors.black,
              gap: 0,
              text: '',
            ),
            GButton(
              icon: Icons.price_change_rounded,
              iconActiveColor: AppColor.primaryGold,
              iconSize: 30,
              iconColor: AppColor.notActiveButton,
              text: '',
              textColor: Colors.black,
              gap: 0,
            ),
            GButton(
              icon: Icons.add_chart_rounded,
              iconActiveColor: AppColor.primaryGold,
              iconSize: 30,
              iconColor: AppColor.notActiveButton,
              text: '',
              textColor: Colors.black,
              gap: 0,
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sign out'),
          content: const Text('Are you sure you want to log out'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Cancel')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Log out')),
          ],
        );
      }).then((value) => value ?? false);
}

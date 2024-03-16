import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/presentations/chart/chart_page.dart';
import 'package:se109_goldstore/presentations/revenue/revenue_page.dart';

import '../general/general_page.dart';
import '../trend/trend_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final tabs = const <Widget>[
    GeneralPage(),
    ChartPage(),
    RevenuePage(),
    TrendPage(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
        return Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: tabs,
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  color: AppColor.backgroundSecondary,
                  blurRadius: 0,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: GNav(
                // tabBackgroundColor: const Color.fromRGBO(255, 191, 202, 100),
                tabBackgroundColor: AppColor.primaryGold,
                padding: const EdgeInsets.all(7),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    iconColor: AppColor.primaryGold,
                    text: 'General',
                    textColor: Colors.black,
                    gap: 6,
                  ),
                  GButton(
                    icon: Icons.add_box_rounded,
                    iconColor: AppColor.primaryGold,
                    text: 'Chart',
                    textColor: Colors.black,
                    gap: 6,
                  ),
                  GButton(
                    icon: Icons.search_rounded,
                    iconSize: 28,
                    iconColor: AppColor.primaryGold,
                    textColor: Colors.black,
                    gap: 6,
                    text: 'Revenue',
                  ),
                  GButton(
                    icon: Icons.person_2,
                    iconColor: AppColor.primaryGold,
                    text: 'Trend',
                    textColor: Colors.black,
                    gap: 6,
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
          ),
          );
        // } else {
        //   return const Scaffold(
        //     body: Center(
        //       child: CircularProgressIndicator(),
        //     ),
        //   );
        // }
      }
}
//     );
//   }
// }

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

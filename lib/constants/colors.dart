import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryGold = Color(0xFFBF974F);

  static const Color secondDark = Color(0xFF557dff);
  static const LinearGradient primaryDarkGradientButton = LinearGradient(
    colors: [
      Color(0xFF557dff),
      Color(0xFF557dff),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
  static const LinearGradient primaryGradientBackground = LinearGradient(
    colors: [
      // Color.fromARGB(255, 29, 132, 215),
      // Colors.blueGrey,
      // Color.fromARGB(147, 33, 157, 188),
      // Color(0xFF023047),
      Color(0xFF0c0f25),
      Color(0xFF161f48),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static const Color primaryGoldBorder = Color.fromARGB(255, 193, 144, 53);
  static const Color grey = Color(0xFF696969);
  static const Color notActiveButton = Color(0xFF767676);
  static const Color black = Color(0xFF000000);
  static const Color greyBackground = Color(0xFF1B1B1B);
  static const Color border = Color(0xFFBDBDBD);
  static const Color shadow = Color(0xFF303030);

  static const Color textNormal = Color(0xFFFFFFFF);
  static const Color textSafe = Color(0xFF1FC794);
  static const Color textDanger = Color.fromARGB(255, 194, 79, 72);

  static const Color royalBlue = Color(0xFF2675E2);
  static const Color mainColor = Color(0xFF394796);
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se109_goldstore/constants/colors.dart';

class AppTextStyles {
  static TextStyle appbarTitle = GoogleFonts.inter(
    color: AppColor.textNormal,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  static const txt14BoldBlack = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static const txt16SemiBold = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const txt14MediumBlack200 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black12,
  );

  static TextStyle title = GoogleFonts.inter(
    color: AppColor.primaryGold,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  static TextStyle title2 = GoogleFonts.inter(
    color: AppColor.primaryGold,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  static TextStyle header = GoogleFonts.inter(
    color: AppColor.textNormal,
    fontWeight: FontWeight.bold,
    fontSize: 32,
  );
  static TextStyle header2 = GoogleFonts.inter(
    color: AppColor.primaryGold,
    fontWeight: FontWeight.bold,
    fontSize: 32,
  );
  static TextStyle header3 = GoogleFonts.inter(
    color: AppColor.primaryGold,
    fontWeight: FontWeight.bold,
    fontSize: 28,
  );
  static const TextStyle body = TextStyle(
    color: AppColor.textNormal,
    fontSize: 16,
  );
}

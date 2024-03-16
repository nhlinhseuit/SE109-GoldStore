import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se109_goldstore/constants/colors.dart';

class TextStyles {
  static TextStyle header = GoogleFonts.inter(
    color: AppColor.textNormal,
    fontWeight: FontWeight.bold,
    fontSize: 32
  );
  static TextStyle header2 = GoogleFonts.inter(
    color: AppColor.primaryGold,
    fontWeight: FontWeight.bold,
    fontSize: 32
  );
  static TextStyle header3 = GoogleFonts.inter(
    color: AppColor.primaryGold,
    fontWeight: FontWeight.bold,
    fontSize: 28
  );
  static const TextStyle body = TextStyle(
    color: AppColor.textNormal,
    fontSize: 16
  );
}
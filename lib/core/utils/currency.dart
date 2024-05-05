import 'package:intl/intl.dart';
import 'converter.dart';

class CurrencyUtils {
  static String convertDoubleToCurrency(double number) {
    final formatter = NumberFormat("#,###", "vi_VN");

    String temp = formatter.format(number);
    return temp.replaceAll(RegExp("r','"), ".");
  }

  static String convertDoubleToCurrencyWithUnit(double number, {String unit = 'đ'}) {
    final formatter = NumberFormat("#,###", "vi_VN");

    String temp = formatter.format(number);
    return '${temp.replaceAll(RegExp("r','"), ".")} ₫';
  }

  static double removeNonNumber(String str) {
    return cvToDouble(str.replaceAll(RegExp(r'[^0-9]'), ''));
  }

  static String convertStrToCurrency(String raw, {bool acceptZero = false}) {
    raw = raw.replaceAll(RegExp(r'[^0-9]'), '');
    final formatter = NumberFormat("#,###", "vi_VN");

    int value = cvToInt(raw);
    if (!acceptZero && value == 0) return "";

    String temp = formatter.format(value);
    return temp.replaceAll('.', ',');
  }

  static String convertCurrentWithUnit(double number, String unit) {
    if (unit.trim().isNotEmpty) {
      return "${convertCurrencyK(number)}/$unit";
    }
    return convertCurrencyK(number);
  }

  static String convertCurrencyK(double number) {
    if (number < 1000) {
      return number.toString();
    } else if (number < 10000) {
      String temp = '${(number / 1000).toStringAsFixed(0)}k';
      return temp.replaceAll(RegExp("r','"), ".");
    } else {
      String temp = '${number ~/ 1000}k';
      return temp.replaceAll(RegExp("r','"), ".");
    }
  }
}
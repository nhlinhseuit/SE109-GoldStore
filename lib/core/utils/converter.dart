import 'package:easy_localization/easy_localization.dart';

int cvToInt(dynamic value, [int defaultValue = 0]) {
  if (value is int) {
    return value;
  } else if (value is String) {
    int val = int.tryParse(value) ?? 0;
    return val;
  } else if (value is double) {
    return value.toInt();
  } else if (value is bool) {
    return value == true ? 1 : 0;
  }
  return defaultValue;
}

String formatDatetime(DateTime time) {
  final f = DateFormat('dd-MM-yyyy');
  return f.format(time).toString();
}

String formatNumber(int totalAmount) {
  final formattedTotalAmount = NumberFormat('#,###').format(totalAmount);
  return formattedTotalAmount;
}

double cvToDouble(dynamic value, [double defaultValue = 0.0]) {
  if (value is int) {
    return value.toDouble();
  } else if (value is String) {
    double val = double.tryParse(value) ?? 0.0;
    return val;
  } else if (value is double) {
    return value;
  } else if (value is bool) {
    return value == true ? 1.0 : 0.0;
  }
  return defaultValue;
}

bool cvToBool(dynamic value, [bool defaultValue = false]) {
  if (value is bool) {
    return value;
  } else if (value is int || value is double) {
    return value == 1 ? true : false;
  } else if (value is String) {
    return (value == "1" || value.toLowerCase() == "true") ? true : false;
  }
  return defaultValue;
}

String cvToString(dynamic value, [String defaultValue = ""]) {
  if (value is String) {
    return value;
  } else if (value != null) {
    return "$value";
  }
  return defaultValue;
}

DateTime? cvToDateOptional(dynamic value, [DateTime? defaultValue]) {
  if (value is DateTime) {
    return value;
  } else if (value is String) {
    return DateTime.tryParse(value);
  }
  return defaultValue;
}

DateTime cvToDate(dynamic value, [DateTime? defaultValue]) {
  if (value is DateTime) {
    return value;
  } else if (value is String) {
    return DateTime.tryParse(value) ?? DateTime.now();
  }
  if (defaultValue != null) {
    return defaultValue;
  }
  return DateTime.now();
}

String cvIdWithProfit(String value) {
  return '${value}_profit';
}

String cvBackIdWithProfit(String value) {
  if (value.contains('_profit')) {
    return value.split('_')[0];
  }
  return value;
}

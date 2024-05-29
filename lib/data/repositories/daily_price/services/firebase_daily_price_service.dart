import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:se109_goldstore/constants/currency_codes.dart';
import 'package:se109_goldstore/core/extensions/datetime.dart';
import 'package:se109_goldstore/core/utils/converter.dart';
import 'package:se109_goldstore/data/models/currency_price.dart';
import 'package:se109_goldstore/data/models/daily_price.dart';
import 'package:se109_goldstore/data/repositories/daily_price/services/daily_price_service.dart';

class FirebaseDailyPriceService extends DailyPriceService {
  final _ref =
      FirebaseFirestore.instance.collection('price');

  String currencyLink(DateTime date, String code) {
    return 'https://${date.toYMDFormat()}.currency-api.pages.dev/v1/currencies/$code.json';
  }
  
  final dio = Dio();

  @override
  Future<DailyPrice?> getDailyPriceById(String id) async {
    final data = await _ref
        .doc(id)
        .get();
    if (data.exists) {
      return DailyPrice.fromJson(id: data.id, json: data.data()!);
    }
    return null;
  }

  @override
  Future<List<DailyPrice>> getDailyPrices(DateTime time) async {
    final result = await _ref
        .where('Time', isGreaterThanOrEqualTo: time.toStartOfDate().toIso8601String())
        .where('Time', isLessThanOrEqualTo: time.toEndOfDate().toIso8601String())
        .get();

    List<DailyPrice> prices = result.docs
        .map((e) => DailyPrice.fromJson(id: e.id, json: e.data()))
        .toList();

    return prices;

  }

  @override
  Future<List<CurrencyPrice>> getCurrencies(DateTime time) async {
    final response = await dio.get(currencyLink(time, 'vnd'));
    if (response.statusCode != 200) {
      return [];
    }
    final currenciesMap = 
      (response.data as Map<String, dynamic>)['vnd'] as Map<String, dynamic>;
    
    List<CurrencyPrice> currencies = [];
    currenciesMap.forEach((key, value) {
      currencies.add(
        CurrencyPrice(
          id: key, 
          name: CurrencyCode.mapCodeName[key] ?? key, 
          buy: 1.0 / cvToDouble(value), 
          time: time
        )
      );
    });
    return currencies;
  }
}
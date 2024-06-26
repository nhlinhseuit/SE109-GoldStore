import 'package:se109_goldstore/data/models/currency_price.dart';
import 'package:se109_goldstore/data/models/daily_price.dart';

abstract class DailyPriceService {
  Future<List<DailyPrice>> getDailyPrices(DateTime time);
  Future<DailyPrice?> getDailyPriceById(String id);
  Future<List<CurrencyPrice>> getCurrencies(DateTime time);
}
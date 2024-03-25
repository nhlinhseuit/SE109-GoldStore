import 'package:se109_goldstore/data/models/daily_price.dart';

abstract class DailyPriceService {
  Future<List<DailyPrice>> getDailyPrices();
  Future<DailyPrice> getDailyPriceById(String id);
}
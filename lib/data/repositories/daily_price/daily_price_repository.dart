import 'package:se109_goldstore/data/models/daily_price.dart';
import 'package:se109_goldstore/data/repositories/daily_price/services/daily_price_service.dart';
import 'package:se109_goldstore/data/repositories/daily_price/services/firebase_daily_price_service.dart';

class DailyPriceRepository {
  final DailyPriceService _firebase;
  static DailyPriceRepository? _instance;

  static DailyPriceRepository get instance {
    if (_instance == null) return DailyPriceRepository._(firebase: FirebaseDailyPriceService());
    return _instance!;
  }

  DailyPriceRepository._({
    required FirebaseDailyPriceService firebase,
  })  : _firebase = firebase;

  Future<DailyPrice?> getDailyPriceById(String id) 
    => _firebase.getDailyPriceById(id);

  Future<List<DailyPrice>> getDailyPrices(DateTime time) 
    => _firebase.getDailyPrices(time);
}
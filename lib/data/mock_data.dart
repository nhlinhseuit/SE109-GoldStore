import 'package:se109_goldstore/data/models/daily_price.dart';

class MockData {
  static List<DailyPrice> todaysGold = [
    const DailyPrice(
      id: 'scj',
      name: 'SCJ',
      buy: 12000,
      sell: 12500,
    ),
    const DailyPrice(
      id: 'pnj',
      name: 'PNJ',
      buy: 13000,
      sell: 13500,
    ),
    const DailyPrice(
      id: 'mihong',
      name: 'Mi Hồng',
      buy: 15000,
      sell: 15800,
    ),
    const DailyPrice(
      id: 'eximbank',
      name: 'EXIMBANK',
      buy: 16000,
      sell: 16500,
    ),
  ];
  static List<DailyPrice> yesterdaysGold = [
    const DailyPrice(
      id: 'scj',
      name: 'SCJ',
      buy: 11000,
      sell: 11500,
    ),
    const DailyPrice(
      id: 'pnj',
      name: 'PNJ',
      buy: 14000,
      sell: 14500,
    ),
    const DailyPrice(
      id: 'mihong',
      name: 'Mi Hồng',
      buy: 14000,
      sell: 15800,
    ),
    const DailyPrice(
      id: 'eximbank',
      name: 'EXIMBANK',
      buy: 17000,
      sell: 17500,
    ),
    const DailyPrice(
      id: 'scj',
      name: 'SCJ',
      buy: 11000,
      sell: 11500,
    ),
    const DailyPrice(
      id: 'pnj',
      name: 'PNJ',
      buy: 14000,
      sell: 14500,
    ),
    const DailyPrice(
      id: 'mihong',
      name: 'Mi Hồng',
      buy: 14000,
      sell: 15800,
    ),
    const DailyPrice(
      id: 'eximbank',
      name: 'EXIMBANK',
      buy: 17000,
      sell: 17500,
    ),
  ];
  static List<DailyPrice> todaysCurrency = [
    const DailyPrice(
      id: 'usd',
      name: 'USD',
      buy: 12000,
      sell: 12500,
    ),
    const DailyPrice(
      id: 'eur',
      name: 'EUR',
      buy: 13000,
      sell: 13500,
    ),
    const DailyPrice(
      id: 'gbp',
      name: 'GBP',
      buy: 15000,
      sell: 15800,
    ),
    const DailyPrice(
      id: 'jpy',
      name: 'JPY',
      buy: 16000,
      sell: 16500,
    ),
  ];
  static List<DailyPrice> yesterdaysCurrency = [
    const DailyPrice(
      id: 'usd',
      name: 'USD',
      buy: 11000,
      sell: 11500,
    ),
    const DailyPrice(
      id: 'eur',
      name: 'EUR',
      buy: 14000,
      sell: 14500,
    ),
    const DailyPrice(
      id: 'gbp',
      name: 'GBP',
      buy: 14000,
      sell: 15800,
    ),
    const DailyPrice(
      id: 'jpy',
      name: 'JPY',
      buy: 17000,
      sell: 17500,
    ),
  ];
}

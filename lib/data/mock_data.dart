import 'package:se109_goldstore/data/models/daily_price.dart';
import 'package:se109_goldstore/data/models/gold_news.dart';

class MockData {
  static List<GoldNews> goldNews = [
    const GoldNews(
      title: 'Gold price today: Gold is down 0.99% from yesterday',
      desc:
          'The price of gold traded at \$2,339.51 per troy ounce, as of 9 a.m. ET. That’s down 0.99% from yesterday’s gold price per ounce and up 13.22% since the beginning of the year.',
      link:
          'https://www.usatoday.com/money/blueprint/investing/gold-price-05-24-2024/',
      img:
          'https://www.usatoday.com/money/blueprint/images/uploads/2023/10/04101024/GettyImages-629743180.jpg?width=700&fit=cover&format=webp',
    ),
    const GoldNews(
      title: 'Platinum price today: Platinum is up 3.92% this year',
      desc:
          'The price of platinum opened at \$1,026.43 per ounce, as of 9 a.m. That’s down 1.33% from the previous day and up 3.92% from the beginning of the year.',
      link:
          'https://www.usatoday.com/money/blueprint/investing/platinum-price-05-24-2024/',
      img:
          'https://www.usatoday.com/money/blueprint/images/uploads/2023/12/18132722/GettyImages-1216673724.jpg?width=700&fit=cover&format=webp',
    ),
    const GoldNews(
      title: 'Palladium price today: Palladium is down 12.06% this year',
      desc:
          'The price of palladium opened at \$966.99 per ounce, as of 9 a.m. ET. That’s down 2.39% from the previous day’s palladium price per ounce and down 12.06% since the beginning of the year.',
      link:
          'https://www.usatoday.com/money/blueprint/investing/palladium-price-05-24-2024/',
      img:
          'https://www.usatoday.com/money/blueprint/images/uploads/2024/01/16120744/Palladium.jpg?width=700&fit=cover&format=webp',
    ),
    const GoldNews(
      title: 'Silver price today: Silver is up 27.41% this year',
      desc:
          'The price of silver opened at \$30.49 per ounce, as of 9 a.m. ET. That’s down 0.41% from the previous day’s silver price per ounce and up 27.41% since the beginning of the year.',
      link:
          'https://www.usatoday.com/money/blueprint/investing/silver-price-05-24-2024/',
      img:
          'https://www.usatoday.com/money/blueprint/images/uploads/2023/12/08113756/GettyImages-1456168733-1.jpg?width=700&fit=cover&format=webp',
    ),
    const GoldNews(
      title: 'Gold price today: Gold is up 14.36% year to date',
      desc:
          'The price of gold traded at \$2,363.01 per troy ounce, as of 9 a.m. ET. That’s down 2.05% from yesterday’s gold price per ounce and up 14.36% since the beginning of the year.',
      link:
          'https://www.usatoday.com/money/blueprint/investing/gold-price-05-23-2024/',
      img:
          'https://www.usatoday.com/money/blueprint/images/uploads/2023/10/04101024/GettyImages-629743180.jpg?width=700&fit=cover&format=webp',
    ),
  ];
  static List<DailyPrice> todaysGold = [
    DailyPrice(
      time: DateTime.now(),
      id: 'scj',
      name: 'SCJ',
      buy: 12000,
      sell: 12500,
    ),
    DailyPrice(
      time: DateTime.now(),
      id: 'pnj',
      name: 'PNJ',
      buy: 13000,
      sell: 13500,
    ),
    DailyPrice(
      time: DateTime.now(),
      id: 'mihong',
      name: 'Mi Hồng',
      buy: 15000,
      sell: 15800,
    ),
    DailyPrice(
      time: DateTime.now(),
      id: 'eximbank',
      name: 'EXIMBANK',
      buy: 16000,
      sell: 16500,
    ),
  ];
  static List<DailyPrice> yesterdaysGold = [
    DailyPrice(
      time: DateTime.now(),
      id: 'scj',
      name: 'SCJ',
      buy: 11000,
      sell: 11500,
    ),
    DailyPrice(
      time: DateTime.now(),
      id: 'pnj',
      name: 'PNJ',
      buy: 14000,
      sell: 14500,
    ),
    DailyPrice(
      time: DateTime.now(),
      id: 'mihong',
      name: 'Mi Hồng',
      buy: 14000,
      sell: 15800,
    ),
    DailyPrice(
      time: DateTime.now(),
      id: 'eximbank',
      name: 'EXIMBANK',
      buy: 17000,
      sell: 17500,
    ),
    DailyPrice(
      time: DateTime.now(),
      id: 'scj',
      name: 'SCJ',
      buy: 11000,
      sell: 11500,
    ),
    DailyPrice(
      time: DateTime.now(),
      id: 'pnj',
      name: 'PNJ',
      buy: 14000,
      sell: 14500,
    ),
    DailyPrice(
      time: DateTime.now(),
      id: 'mihong',
      name: 'Mi Hồng',
      buy: 14000,
      sell: 15800,
    ),
    DailyPrice(
      time: DateTime.now(),
      id: 'eximbank',
      name: 'EXIMBANK',
      buy: 17000,
      sell: 17500,
    ),
  ];
  static List<DailyPrice> todaysCurrency = [
    DailyPrice(
      time: DateTime.now(),
      id: 'usd',
      name: 'USD',
      buy: 12000,
      sell: 12500,
    ),
    DailyPrice(
      time: DateTime.now(),
      id: 'eur',
      name: 'EUR',
      buy: 13000,
      sell: 13500,
    ),
    DailyPrice(
      time: DateTime.now(),
      id: 'gbp',
      name: 'GBP',
      buy: 15000,
      sell: 15800,
    ),
    DailyPrice(
      time: DateTime.now(),
      id: 'jpy',
      name: 'JPY',
      buy: 16000,
      sell: 16500,
    ),
  ];
  static List<DailyPrice> yesterdaysCurrency = [
    DailyPrice(
      time: DateTime.now(),
      id: 'usd',
      name: 'USD',
      buy: 11000,
      sell: 11500,
    ),
    DailyPrice(
      time: DateTime.now(),
      id: 'eur',
      name: 'EUR',
      buy: 14000,
      sell: 14500,
    ),
    DailyPrice(
      time: DateTime.now(),
      id: 'gbp',
      name: 'GBP',
      buy: 14000,
      sell: 15800,
    ),
    DailyPrice(
      time: DateTime.now(),
      id: 'jpy',
      name: 'JPY',
      buy: 17000,
      sell: 17500,
    ),
  ];
}

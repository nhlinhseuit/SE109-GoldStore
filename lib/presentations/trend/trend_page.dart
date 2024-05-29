import 'dart:core';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/constants/text_styles.dart';
import 'package:se109_goldstore/data/mock_data.dart';
import 'package:se109_goldstore/data/models/gold_news.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/components/page_header.dart';

class TrendPage extends StatefulWidget {
  const TrendPage({super.key});

  @override
  State<TrendPage> createState() => _TrendPageState();
}

class _TrendPageState extends State<TrendPage> {
  late int numberOfItem;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Color> gradientColors = [
    const Color(0xFFffe45e),
    const Color(0xFFBF974F),
  ];

  int isSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColor.primaryGradientBackground,
        ),
        child: ListView(children: [
          const Header(
            firstLine: "Tin Tức",
          ),
          const SizedBox(
            height: 20,
          ),
          ...getNews(),
        ]),
      ),
    );
  }

  List<Widget> getNews() {
    List<Widget> listNews = [];
    List<GoldNews> listNewsData = MockData.goldNews;

    for (int index = 0; index < listNewsData.length; index++) {
      listNews.add(
        InkWell(
          onTap: () {
            _launchURL(listNewsData[index].link, false);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            margin: const EdgeInsets.only(
              bottom: 8,
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Container(
                  width: 110,
                  height: 110,
                  margin: const EdgeInsets.only(
                    left: 4,
                  ),
                  decoration: BoxDecoration(
                      color: const Color(0xFFfff7e6),
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      fit: BoxFit.cover,
                      listNewsData[index].img,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 150,
                      child: Text(
                        listNewsData[index].title,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: AppTextStyles.appbarTitle.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 150,
                      child: Text(
                        listNewsData[index].desc,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.appbarTitle.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w200,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
    return listNews;
  }

  _launchURL(String link, bool inApp) async {
    final Uri url = Uri.parse(link);
    try {
      if (inApp) {
        if (!await launchUrl(
          url,
          mode: LaunchMode.inAppWebView,
        )) {
          throw Exception('Could not launch $url');
        }
      } else {
        await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('07/12', style: style);
        break;
      case 3:
        text = const Text('29/12', style: style);
        break;
      case 5:
        text = const Text('21/01', style: style);
        break;
      case 7:
        text = const Text('13/02', style: style);
        break;
      case 9:
        text = const Text('06/03', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '16.000';
        break;
      case 3:
        text = '18.000';
        break;
      case 5:
        text = '18.000';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(
        show: false,
        drawVerticalLine: false,
        //   horizontalInterval: 1,
        //   verticalInterval: 1,
        //   getDrawingHorizontalLine: (value) {
        //     return const FlLine(
        //       color: Colors.white10,
        //       strokeWidth: 1,
        //     );
        //   },
        //   getDrawingVerticalLine: (value) {
        //     return const FlLine(
        //       color: Colors.white10,
        //       strokeWidth: 1,
        //     );
        //   },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.6))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

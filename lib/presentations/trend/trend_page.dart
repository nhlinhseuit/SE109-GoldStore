import 'dart:core';
import 'package:dotted_line/dotted_line.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/presentations/common/components/page_title.dart';
import 'package:se109_goldstore/presentations/common/components/tab_button.dart';
import 'package:se109_goldstore/presentations/trend/fl_chart.dart';
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
    const Color(0xFFc0974e),
    Colors.black,
  ];

  int isSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const Header(
          firstLine: "Chỉ Báo",
        ),
        const PageTitle(
          firstLine: "Biểu đồ chỉ báo giá vàng",
          secondLine: "sắp tới",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = 1;
                  });
                },
                child: TabChartButton(
                  text: '1D',
                  id: 1,
                  index: isSelected,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = 2;
                  });
                },
                child: TabChartButton(
                  text: '7D',
                  id: 2,
                  index: isSelected,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = 3;
                  });
                },
                child: TabChartButton(
                  text: '1M',
                  id: 3,
                  index: isSelected,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = 4;
                  });
                },
                child: TabChartButton(
                  text: '3M',
                  id: 4,
                  index: isSelected,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = 5;
                  });
                },
                child: TabChartButton(
                  text: '1Y',
                  id: 5,
                  index: isSelected,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20, top: 10),
          child: DottedLine(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            lineLength: double.infinity,
            lineThickness: 1.0,
            dashLength: 4.0,
            dashColor: Colors.white,
            dashRadius: 0.0,
            dashGapLength: 4.0,
            dashGapColor: Colors.transparent,
            dashGapRadius: 0.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.70,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10,
                    top: 0,
                    bottom: 0,
                  ),
                  child: LineChart(
                    mainData(),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const PageTitle(
          firstLine: "Thống kê",
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    '1 ngày',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '1 tuần',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '1 tháng',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    '-0.15%',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.textDanger,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '+0.4%',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.textSafe,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '+4.16%',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.textSafe,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    '1 năm',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '1Y cao nhất',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '1Y thấp nhất',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    '+3.46%',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.textSafe,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '26.000VND',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.textNormal,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '23.000VND',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.textNormal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(40),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF1b1b1b),
            border: Border.all(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 18,
                width: 18,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF00c183),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text('Mua vào'),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 18,
                width: 18,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFa7443e),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text('Bán ra'),
            ],
          ),
        ),
      ]),
    );
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

import 'dart:core';

import 'package:dotted_line/dotted_line.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/presentations/common/components/page_title.dart';
import 'package:se109_goldstore/presentations/common/components/tab_chart_button.dart';

import '../common/components/page_header.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  late int numberOfItem;
  int index = 0;
  late Widget Function(double, TitleMeta) getBottomTitleWidget =
      bottomTitleWidgets;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  late List<LineChartBarData> lineBarsDataChart = [
    LineChartBarData(
      spots: const [
        FlSpot(0, 4),
        FlSpot(5, 3),
        FlSpot(10, 3.5),
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
      // belowBarData: BarAreaData(
      //   show: true,
      //   gradient: LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: gradientColors
      //         .map((color) => color.withOpacity(0.6))
      //         .toList(),
      //   ),
      // ),
    ),
    LineChartBarData(
      spots: const [
        FlSpot(0, 2),
        FlSpot(5, 4),
        FlSpot(10, 3),
      ],
      isCurved: true,
      gradient: const LinearGradient(
        colors: [Colors.blue, Colors.lightBlueAccent],
      ),
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: const FlDotData(
        show: false,
      ),
      // belowBarData: BarAreaData(
      //   show: true,
      //   gradient: LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: gradientColors2
      //         .map((color) => color.withOpacity(0.6))
      //         .toList(),
      //   ),
      // ),
    ),
  ];

  List<Color> gradientColors = [
    const Color(0xFFffe45e),
    const Color(0xFFBF974F),
  ];

  List<Color> gradientColors2 = [
    AppColor.textSafe,
    const Color.fromARGB(255, 17, 108, 80),
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
            firstLine: "Biểu Đồ",
          ),
          Padding(padding: const EdgeInsets.only(left: 16), child: Container()),
          const PageTitle(
            firstLine: "Biểu đồ giá vàng 30 ngày ",
            secondLine: "gần nhất",
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    handleSelect(1);
                  },
                  child: TabChartButton(
                    text: '1D',
                    id: 1,
                    index: isSelected,
                  ),
                ),
                InkWell(
                  onTap: () {
                    handleSelect(2);
                  },
                  child: TabChartButton(
                    text: '7D',
                    id: 2,
                    index: isSelected,
                  ),
                ),
                InkWell(
                  onTap: () {
                    handleSelect(3);
                  },
                  child: TabChartButton(
                    text: '1M',
                    id: 3,
                    index: isSelected,
                  ),
                ),
                InkWell(
                  onTap: () {
                    handleSelect(4);
                  },
                  child: TabChartButton(
                    text: '3M',
                    id: 4,
                    index: isSelected,
                  ),
                ),
                InkWell(
                  onTap: () {
                    handleSelect(5);
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
          Container(
            margin: const EdgeInsets.all(40),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: 2, color: AppColor.secondDark),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 18,
                  width: 18,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blue),
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
                    color: Color(0xFFBF974F),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('Bán ra'),
              ],
            ),
          ),
          Container(
            height: 4,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 63, 63, 63),
          ),

          // THONG KE
          const SizedBox(
            height: 30,
          ),
          const PageTitle(
            firstLine: "Thống kê",
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.secondDark,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.arrow_upward_rounded,
                            size: 18,
                            color: AppColor.textSafe,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '1Y cao nhất',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      '91,000.000 VND',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColor.textNormal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.secondDark,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.arrow_downward_rounded,
                            size: 18,
                            color: AppColor.textDanger,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '1Y thấp nhất',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      '80.800.000VND',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColor.textNormal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 48,
          ),

          // TIN TUC
          const SizedBox(
            height: 30,
          ),
        ]),
      ),
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

  Widget bottomTitleWidgets1D(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('8h', style: style);
        break;
      case 5:
        text = const Text('14h', style: style);
        break;
      case 8:
        text = const Text('20h', style: style);
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

  Widget bottomTitleWidgets7D(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('25/05', style: style);
        break;
      case 4:
        text = const Text('26/05', style: style);
        break;
      case 6:
        text = const Text('28/05', style: style);
        break;
      case 8:
        text = const Text('30/05', style: style);
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

  Widget bottomTitleWidgets1M(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('5/05', style: style);
        break;
      case 3:
        text = const Text('10/05', style: style);
        break;
      case 5:
        text = const Text('15/05', style: style);
        break;
      case 7:
        text = const Text('20/05', style: style);
        break;
      case 9:
        text = const Text('25/05', style: style);
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

  Widget bottomTitleWidgets3M(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 8,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('5/05', style: style);
        break;
      case 3:
        text = const Text('10/05', style: style);
        break;
      case 5:
        text = const Text('15/05', style: style);
        break;
      case 7:
        text = const Text('20/05', style: style);
        break;
      case 9:
        text = const Text('25/05', style: style);
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

  Widget bottomTitleWidgets1Y(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 8,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('5/03', style: style);
        break;
      case 3:
        text = const Text('15/03', style: style);
        break;
      case 5:
        text = const Text('5/04', style: style);
        break;
      case 7:
        text = const Text('15/04', style: style);
        break;
      case 9:
        text = const Text('10/05', style: style);
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

  void handleSelect(int index) {
    setState(() {
      isSelected = index;
    });

    switch (index) {
      case 1:
        setState(() {
          lineBarsDataChart = listLineChartBarData1D();
          getBottomTitleWidget = bottomTitleWidgets1D;
        });
        break;
      case 2:
        setState(() {
          lineBarsDataChart = listLineChartBarData7D();
          getBottomTitleWidget = bottomTitleWidgets7D;
        });
        break;
      case 3:
        setState(() {
          lineBarsDataChart = listLineChartBarData1M();
          getBottomTitleWidget = bottomTitleWidgets1M;
        });
        break;
      case 4:
        setState(() {
          lineBarsDataChart = listLineChartBarData3M();
          getBottomTitleWidget = bottomTitleWidgets3M;
        });
        break;
      case 5:
        setState(() {
          lineBarsDataChart = listLineChartBarData1Y();
          getBottomTitleWidget = bottomTitleWidgets1Y;
        });
        break;
      default:
        setState(() {
          lineBarsDataChart = [];
        });
    }
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '80Tr';
        break;
      case 3:
        text = '84Tr';
        break;
      case 5:
        text = '91.5Tr';
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
            getTitlesWidget: getBottomTitleWidget,
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
      maxX: 10,
      minY: 0,
      maxY: 6,
      lineBarsData: lineBarsDataChart,
    );
  }

  List<LineChartBarData> listLineChartBarData1D() {
    return [
      LineChartBarData(
        spots: const [
          FlSpot(0, 4),
          FlSpot(5, 3),
          FlSpot(10, 3.5),
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
        // belowBarData: BarAreaData(
        //   show: true,
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: gradientColors
        //         .map((color) => color.withOpacity(0.6))
        //         .toList(),
        //   ),
        // ),
      ),
      LineChartBarData(
        spots: const [
          FlSpot(0, 2),
          FlSpot(5, 4),
          FlSpot(10, 3),
        ],
        isCurved: true,
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.lightBlueAccent],
        ),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
        // belowBarData: BarAreaData(
        //   show: true,
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: gradientColors2
        //         .map((color) => color.withOpacity(0.6))
        //         .toList(),
        //   ),
        // ),
      ),
    ];
  }

  List<LineChartBarData> listLineChartBarData7D() {
    return [
      LineChartBarData(
        spots: const [
          FlSpot(0, 1),
          FlSpot(3, 4),
          FlSpot(6, 1.8),
          FlSpot(10, 3),
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
        // belowBarData: BarAreaData(
        //   show: true,
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: gradientColors
        //         .map((color) => color.withOpacity(0.6))
        //         .toList(),
        //   ),
        // ),
      ),
      LineChartBarData(
        spots: const [
          FlSpot(0, 4),
          FlSpot(3, 3),
          FlSpot(7, 5),
          FlSpot(10, 4),
        ],
        isCurved: true,
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.lightBlueAccent],
        ),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
        // belowBarData: BarAreaData(
        //   show: true,
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: gradientColors2
        //         .map((color) => color.withOpacity(0.6))
        //         .toList(),
        //   ),
        // ),
      ),
    ];
  }

  List<LineChartBarData> listLineChartBarData1M() {
    return [
      LineChartBarData(
        spots: const [
          FlSpot(0, 1),
          FlSpot(2, 3),
          FlSpot(4, 2),
          FlSpot(8, 5),
          FlSpot(10, 3),
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
        // belowBarData: BarAreaData(
        //   show: true,
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: gradientColors
        //         .map((color) => color.withOpacity(0.6))
        //         .toList(),
        //   ),
        // ),
      ),
      LineChartBarData(
        spots: const [
          FlSpot(0, 2),
          FlSpot(2, 2.5),
          FlSpot(4, 3),
          FlSpot(8, 4),
          FlSpot(10, 5),
        ],
        isCurved: true,
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.lightBlueAccent],
        ),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
        // belowBarData: BarAreaData(
        //   show: true,
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: gradientColors2
        //         .map((color) => color.withOpacity(0.6))
        //         .toList(),
        //   ),
        // ),
      ),
    ];
  }

  List<LineChartBarData> listLineChartBarData3M() {
    return [
      LineChartBarData(
        spots: const [
          FlSpot(0, 2),
          FlSpot(2, 3),
          FlSpot(4, 2.5),
          FlSpot(6, 4),
          FlSpot(8, 3.5),
          FlSpot(10, 5),
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
        // belowBarData: BarAreaData(
        //   show: true,
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: gradientColors
        //         .map((color) => color.withOpacity(0.6))
        //         .toList(),
        //   ),
        // ),
      ),
      LineChartBarData(
        spots: const [
          FlSpot(0, 1.5),
          FlSpot(2, 2.5),
          FlSpot(4, 3),
          FlSpot(6, 3.5),
          FlSpot(8, 4),
          FlSpot(10, 4.5),
        ],
        isCurved: true,
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.lightBlueAccent],
        ),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
        // belowBarData: BarAreaData(
        //   show: true,
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: gradientColors2
        //         .map((color) => color.withOpacity(0.6))
        //         .toList(),
        //   ),
        // ),
      ),
    ];
  }

  List<LineChartBarData> listLineChartBarData1Y() {
    return [
      LineChartBarData(
        spots: const [
          FlSpot(0, 1),
          FlSpot(1.5, 1.8),
          FlSpot(3, 1.2),
          FlSpot(4.5, 3),
          FlSpot(6, 2.5),
          FlSpot(7.5, 4),
          FlSpot(9, 3),
          FlSpot(10, 4.5),
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
        // belowBarData: BarAreaData(
        //   show: true,
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: gradientColors
        //         .map((color) => color.withOpacity(0.6))
        //         .toList(),
        //   ),
        // ),
      ),
      LineChartBarData(
        spots: const [
          FlSpot(0, 2),
          FlSpot(1.5, 2.5),
          FlSpot(3, 3.5),
          FlSpot(4.5, 2),
          FlSpot(6, 4),
          FlSpot(7.5, 3.5),
          FlSpot(9, 4.5),
          FlSpot(10, 3),
        ],
        isCurved: true,
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.lightBlueAccent],
        ),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
        // belowBarData: BarAreaData(
        //   show: true,
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: gradientColors2
        //         .map((color) => color.withOpacity(0.6))
        //         .toList(),
        //   ),
        // ),
      ),
    ];
  }
}

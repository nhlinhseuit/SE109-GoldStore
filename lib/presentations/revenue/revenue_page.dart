import 'dart:core';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/constants/text_styles.dart';
import 'package:se109_goldstore/core/utils/converter.dart';
import 'package:se109_goldstore/presentations/common/components/history_item.dart';
import 'package:se109_goldstore/presentations/common/components/page_title.dart';
import 'package:se109_goldstore/presentations/general/price_page.dart';
import 'package:se109_goldstore/presentations/revenue/add_history.dart';
import 'package:se109_goldstore/presentations/revenue/notification_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/components/page_header.dart';

class RevenuePage extends StatefulWidget {
  const RevenuePage({super.key});

  @override
  State<RevenuePage> createState() => _RevenuePageState();
}

class _RevenuePageState extends State<RevenuePage> {
  late int numberOfItem;
  var selectedType = PriceType.GOLD;
  late SharedPreferences prefs;
  late List<String> myDateHistoryList = [];
  late List<String> myQuantityHistoryList = [];
  Map<String, List<String>> mapHistory = {};
  late bool isLoading;
  int totalQuantity = 0;
  int buyDatePrice = 7500000;
  int currentPrice = 8500000;
  double profitPercentage = 0;
  int profitMoney = 0;

  late final ValueNotifier<int> valueNotifier;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    initSync();

    valueNotifier = ValueNotifier(0);

    super.initState();
  }

  Future<void> initSync() async {
    prefs = await SharedPreferences.getInstance();
    myDateHistoryList = prefs.getStringList('myDateHistoryList') ?? [];
    myQuantityHistoryList = prefs.getStringList('myQuantityHistoryList') ?? [];

    // tính tổng số lượng vàng
    totalQuantity = 0;
    for (var element in myQuantityHistoryList) {
      totalQuantity += int.parse(element);
    }

    // tính lợi nhuận
    profitPercentage = ((currentPrice - buyDatePrice) / buyDatePrice) * 100;

    Map<String, List<String>> mapHistoryFunc = {};
    for (var i = 0; i < myQuantityHistoryList.length; i++) {
      mapHistoryFunc[myDateHistoryList[i]] ??= [];
      mapHistoryFunc[myDateHistoryList[i]]!.add(myQuantityHistoryList[i]);
    }
    setState(() {
      mapHistory = sortMapHistory(mapHistoryFunc);
    });
  }

  Map<String, List<String>> sortMapHistory(Map<String, List<String>> map) {
    // Định dạng ngày tháng để có thể so sánh
    DateFormat dateFormat = DateFormat('dd-MM-yyyy');

    // Chuyển đổi map thành danh sách các cặp key-value
    var entries = map.entries.toList();

    // Sắp xếp danh sách dựa trên các key theo thứ tự giảm dần
    entries.sort(
        (a, b) => dateFormat.parse(b.key).compareTo(dateFormat.parse(a.key)));

    // In ra map đã sắp xếp
    print(Map.fromEntries(entries));

    // Chuyển đổi lại thành map đã sắp xếp
    return Map.fromEntries(entries);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final RemoteMessage message =
    //     ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.textSafe, 
              foregroundColor: Colors.white, 
              shape: const CircleBorder(
                side: BorderSide(
                  color: Colors.white, 
                  width: 3.0, 
                ),
              ),
              elevation: 0, 
              padding: const EdgeInsets.all(16), 
            ),
            onPressed: () {
              
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
                  ));
            },
            child: const Icon(
              Icons.alarm,
              color: Colors.white,
              weight: 4,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.secondDark, 
              foregroundColor: Colors.white, 
              shape: const CircleBorder(
                side: BorderSide(
                  color: Colors.white, 
                  width: 3.0, 
                ),
              ),
              elevation: 0, 
              padding: const EdgeInsets.all(16),
            ),
            onPressed: () {
              // removeAllFromList('myDateHistoryList');
              // removeAllFromList('myQuantityHistoryList');
              // mapHistory.clear();

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddHistory(valueNotifier: valueNotifier),
                  ));
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
              weight: 4,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: initSync,
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppColor.primaryGradientBackground,
          ),
          child: ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder: (BuildContext context, value, Widget? child) {
              return ListView(children: [
                const Header(
                  firstLine: "Bộ Sưu Tập",
                ),
                const PageTitle(
                  firstLine: "Tổng giá trị",
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border:
                              Border.all(width: 1, color: AppColor.secondDark),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                        ),
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Số lượng vàng',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Giá trị lúc mua'),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Giá trị hiện tại'),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Lợi nhuận'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border:
                              Border.all(width: 1, color: AppColor.secondDark),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                        ),
                        // constraints: const BoxConstraints(
                        //   minWidth: 150,
                        // ),
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: Column(
                          children: [
                            Text(
                              '$totalQuantity CHỈ',
                              style:
                                  const TextStyle(color: AppColor.primaryGold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${formatNumber(totalQuantity * buyDatePrice)} VNĐ',
                              style:
                                  const TextStyle(color: AppColor.primaryGold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${formatNumber(totalQuantity * currentPrice)} VNĐ',
                              style:
                                  const TextStyle(color: AppColor.secondDark),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${profitPercentage.toStringAsFixed(2)} %',
                              style: const TextStyle(color: AppColor.textSafe),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const PageTitle(
                  firstLine: "Lịch sử mua vàng",
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: tabButton("Tháng trước", PriceType.GOLD),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        flex: 3,
                        child: tabButton("Tháng này", PriceType.CURRENCY),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ...List<Widget>.generate(mapHistory.length, (index) {
                  return HistoryItem(
                    date: mapHistory.keys.elementAt(index),
                    listQuantity: mapHistory.values.elementAt(index),
                  );
                }),
                // HistoryItem(
                //   date: mapHistory.keys.elementAt(0),
                //   listQuantity: mapHistory.values.elementAt(0),
                // ),
                const SizedBox(
                  height: 30,
                ),
              ]);
            },
          ),
        ),
      ),
    );
  }

  Widget tabButton(String text, PriceType type) {
    bool isSelected = type == selectedType;
    return InkWell(
      onTap: () => onTabChange(type),
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          gradient: isSelected ? AppColor.primaryDarkGradientButton : null,
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? null
              : Border.all(
                  width: 2,
                  color: AppColor.secondDark,
                ),
          color: isSelected ? AppColor.secondDark : Colors.transparent,
        ),
        child: Text(
          text,
          style: AppTextStyles.txt14BoldBlack.copyWith(
            color: isSelected ? AppColor.textNormal : AppColor.textNormal,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void onTabChange(PriceType type) {
    print("onTabChange: $type");
    setState(() {
      selectedType = type;
    });
  }
}

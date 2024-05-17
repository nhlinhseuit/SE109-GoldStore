import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/constants/text_styles.dart';
import 'package:se109_goldstore/data/mock_data.dart';
import 'package:se109_goldstore/presentations/caculate/calculate_page.dart';
import 'package:se109_goldstore/presentations/common/components/add_elevated_button.dart';
import 'package:se109_goldstore/presentations/common/components/page_title.dart';
import 'package:se109_goldstore/presentations/common/components/price_table.dart';
import 'package:se109_goldstore/presentations/general/price_page.dart';
import 'package:se109_goldstore/presentations/common/components/history_item.dart';

import '../common/components/page_header.dart';

class RevenuePage extends StatefulWidget {
  const RevenuePage({super.key});

  @override
  State<RevenuePage> createState() => _RevenuePageState();
}

class _RevenuePageState extends State<RevenuePage> {
  late int numberOfItem;
  var selectedType = PriceType.GOLD;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColor.primaryGradientBackground,
        ),
        child: ListView(children: [
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
                    border: Border.all(width: 1, color: AppColor.secondDark),
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
                    border: Border.all(width: 1, color: AppColor.secondDark),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  // constraints: const BoxConstraints(
                  //   minWidth: 150,
                  // ),
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  child: const Column(
                    children: [
                      Text(
                        '35 CHỈ',
                        style: TextStyle(color: AppColor.primaryGold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '245.000.000 VNĐ',
                        style: TextStyle(color: AppColor.primaryGold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '275.000.000 VNĐ',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '(+12.24 %)',
                        style: TextStyle(color: AppColor.textSafe),
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
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
          const HistoryItem(),
          const SizedBox(
            height: 50,
          ),
          const HistoryItem(),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 30,
          ),
          AddElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const CalculatePage()),
                // );
              },
              text: 'Thêm'),
        ]),
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

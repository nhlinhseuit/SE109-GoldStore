import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/constants/text_styles.dart';
import 'package:se109_goldstore/core/utils/converter.dart';
import 'package:se109_goldstore/data/mock_data.dart';
import 'package:se109_goldstore/presentations/general/alert_page.dart';

import '../common/components/page_header.dart';
import 'components/price_table.dart';

enum PriceType { GOLD, CURRENCY }

class PricePage extends StatefulWidget {
  const PricePage({super.key});

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  late int numberOfItem;
  var selectedType = PriceType.GOLD;
  var previousSelectedType = PriceType.GOLD;
  DateTime selectedDateGold = DateTime.now();
  DateTime selectedDateCurrency = DateTime.now();

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
      backgroundColor: AppColor.primaryDarkBackground,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 42,
            ),
            child: Column(
              children: [
                Header(
                  firstLine: selectedType == PriceType.GOLD
                      ? 'Giá Vàng'
                      : 'Giá Ngoại Tệ',
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: tabButton("Giá vàng", PriceType.GOLD),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        flex: 3,
                        child: tabButton("Giá ngoại tệ", PriceType.CURRENCY),
                      ),
                    ],
                  ),
                ),
                ..._getListView(selectedType),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 20.0,
              top: 10,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                side: const BorderSide(
                  width: 2,
                  color: AppColor.textSafe,
                ),
                backgroundColor: AppColor.backgroundSecondary,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AlertPage()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tạo cảnh báo ${selectedType == PriceType.GOLD ? 'giá vàng' : 'giá ngoại tệ'}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColor.textSafe,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (selectedType == PriceType.GOLD) {
      if (picked != selectedDateGold) {
        setState(() {
          selectedDateGold = picked!;
        });
      }
    } else {
      if (picked != selectedDateCurrency) {
        setState(() {
          selectedDateCurrency = picked!;
        });
      }
    }
  }

  Widget tabButton(String text, PriceType type) {
    bool isSelected = type == selectedType;
    return InkWell(
      onTap: () => onTabChange(type),
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            width: 1,
            color: const Color(0xFF7B8B9D),
          ),
          color:
              isSelected ? AppColor.primaryGold : AppColor.backgroundSecondary,
        ),
        child: Text(
          text,
          style: AppTextStyles.txt14BoldBlack.copyWith(
              color:
                  isSelected ? AppColor.textNormal : const Color(0xFF7B8B9D)),
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

  List<Widget> _getListView(PriceType type) {
    return type == PriceType.GOLD
        ? [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8,
                top: 24,
                bottom: 2,
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      'Chọn ngày',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                    onPressed: () => _selectDate(context),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(formatDatetime(selectedDateGold))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: PriceTable(
                      currentPrice: MockData.todaysGold,
                      oldPrice: MockData.yesterdaysGold,
                      currentTime: DateTime.now(),
                      oldTime: DateTime.now(),
                    ),
                  ),
                ],
              ),
            ),
          ]
        : [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8,
                top: 24,
                bottom: 2,
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      'Chọn ngày',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                    onPressed: () => _selectDate(context),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(formatDatetime(selectedDateCurrency))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: PriceTable(
                      currentPrice: MockData.todaysCurrency,
                      oldPrice: MockData.yesterdaysCurrency,
                      currentTime: DateTime.now(),
                      oldTime: DateTime.now(),
                    ),
                  ),
                ],
              ),
            ),
          ];
  }
}

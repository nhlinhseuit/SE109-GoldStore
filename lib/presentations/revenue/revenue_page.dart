import 'dart:core';
import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/data/mock_data.dart';
import 'package:se109_goldstore/presentations/caculate/calculate_page.dart';
import 'package:se109_goldstore/presentations/common/components/add_elevated_button.dart';
import 'package:se109_goldstore/presentations/common/components/page_title.dart';
import 'package:se109_goldstore/presentations/general/components/price_table.dart';

import '../common/components/page_header.dart';

class RevenuePage extends StatefulWidget {
  const RevenuePage({super.key});

  @override
  State<RevenuePage> createState() => _RevenuePageState();
}

class _RevenuePageState extends State<RevenuePage> {
  late int numberOfItem;

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
          Padding(padding: const EdgeInsets.only(left: 16), child: Container()),
          const PageTitle(
            firstLine: "Lịch sử mua vàng",
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PriceTable(
              currentPrice: MockData.todaysGold,
              oldPrice: MockData.yesterdaysGold,
              currentTime: DateTime.now(),
              oldTime: DateTime.now(),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const PageTitle(
            firstLine: "Tổng giá trị",
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
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
                      child: const Text(
                        'Số lượng vàng',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.secondDark,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text('Giá trị lúc mua')),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.secondDark,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text('Giá trị hiện tại')),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.secondDark,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text('Lợi nhuận')),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
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
              ],
            ),
          ),
          const SizedBox(
            height: 20,
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
}

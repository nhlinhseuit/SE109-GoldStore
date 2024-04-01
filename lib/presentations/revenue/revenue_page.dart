import 'dart:core';
import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/data/mock_data.dart';
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
      body: ListView(children: [
        const Header(
          firstLine: "Bộ Sưu Tập",
        ),
        Padding(padding: const EdgeInsets.only(left: 16), child: Container()),
        const PageTitle(
          firstLine: "Lịch sử mua vàng",
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PriceTable(
            currentPrice: MockData.todays,
            oldPrice: MockData.yesterdays,
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
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Số lượng vàng',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Giá trị lúc mua'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Giá trị hiện tại'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Lợi nhuận'),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 20),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.primaryGold)),
            child: const Text(
              'THÊM',
              style: TextStyle(color: AppColor.black),
            ),
            onPressed: () {},
          ),
        )
      ]),
    );
  }
}

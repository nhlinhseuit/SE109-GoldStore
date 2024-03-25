import 'dart:core';
import 'package:flutter/material.dart';
import 'package:se109_goldstore/data/mock_data.dart';

import '../common/components/page_header.dart';
import 'components/price_table.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
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
          firstLine: "Gold Price",
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PriceTable(
            currentPrice: MockData.todays,
            oldPrice: MockData.yesterdays,
            currentTime: DateTime.now(),
            oldTime: DateTime.now(),
          ),
        )
      ]),
    );
  }
}

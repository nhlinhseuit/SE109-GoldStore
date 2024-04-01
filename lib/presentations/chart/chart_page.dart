import 'dart:core';
import 'package:flutter/material.dart';
import 'package:se109_goldstore/presentations/common/components/page_title.dart';

import '../common/components/page_header.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
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
          firstLine: "Biểu Đồ",
        ),
        Padding(padding: const EdgeInsets.only(left: 16), child: Container()),
        const PageTitle(
          firstLine: "Biểu đồ giá vàng 30 ngày ",
          secondLine: "gần nhất",
        ),
      ]),
    );
  }
}

import 'dart:core';
import 'package:flutter/material.dart';

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
          firstLine: "Chart",
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Container()
        ),
      ]),
    );
  }
}

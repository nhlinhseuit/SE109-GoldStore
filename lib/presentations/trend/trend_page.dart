import 'dart:core';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const Header(
          firstLine: "Trend",
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Container()
        ),
      ]),
    );
  }
}

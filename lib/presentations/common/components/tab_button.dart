import 'package:flutter/material.dart';

class TabChartButton extends StatelessWidget {
  String text;
  int id;
  int index;
  TabChartButton(
      {super.key, required this.text, required this.id, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
        decoration: BoxDecoration(
          color: id == index ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 10, color: id == index ? Colors.black : Colors.grey),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/colors.dart';

class ColumnHeader extends StatelessWidget {
  const ColumnHeader({super.key, required this.name, this.color});

  final String name;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        name,
        style: TextStyle(
          color: color ?? AppColor.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        softWrap: true,
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
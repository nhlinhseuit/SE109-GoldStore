import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/text_styles.dart';

class Header extends StatelessWidget {
  final String firstLine;
  final String? secondLine;
  const Header({required this.firstLine, this.secondLine,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            firstLine.toUpperCase(),
            style: TextStyles.header,
          ),
          if (secondLine != null)
          Text(
            secondLine!.toUpperCase(),
            style: TextStyles.header2,
          ),
          const Divider(
              height: 32,
              thickness: 2,
              indent: 0,
              endIndent: 200,
              color: Colors.white,
            ),
        ],
      ),
    );
  }
}
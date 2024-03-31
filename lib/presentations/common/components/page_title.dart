import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/text_styles.dart';

class PageTitle extends StatelessWidget {
  final String firstLine;
  final String? secondLine;
  const PageTitle({required this.firstLine, this.secondLine, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            firstLine.toUpperCase(),
            style: AppTextStyles.title,
          ),
          if (secondLine != null)
            Text(
              secondLine!.toUpperCase(),
              style: AppTextStyles.title2,
            ),
        ],
      ),
    );
  }
}

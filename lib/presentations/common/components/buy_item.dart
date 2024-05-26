import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/constants/text_styles.dart';

class BuyItem extends StatelessWidget {
  final String quantity;
  const BuyItem({super.key, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        color: const Color(0xFFfff7e6),
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(
                      Icons.bar_chart_rounded,
                      size: 24,
                      color: Color(0xFFf7b60a),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mua vàng',
                        style: AppTextStyles.appbarTitle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Đơn vị: Chỉ',
                        style: AppTextStyles.appbarTitle.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              '+ $quantity',
              style: const TextStyle(
                color: AppColor.textSafe,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

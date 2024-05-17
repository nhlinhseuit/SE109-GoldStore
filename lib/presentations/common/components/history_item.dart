import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/constants/text_styles.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFc9f4d1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      width: 34,
                      height: 34,
                      child: Center(
                          child: Text(
                        '21',
                        style: AppTextStyles.appbarTitle.copyWith(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      )),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Today, May 2021',
                      style: AppTextStyles.appbarTitle.copyWith(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '\$2.00',
                style: AppTextStyles.appbarTitle.copyWith(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 0.5,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
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
                              'Food & Beverage',
                              style: AppTextStyles.appbarTitle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              'Boba Tea',
                              style: AppTextStyles.appbarTitle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    '-\$12.00',
                    style: TextStyle(
                      color: AppColor.textDanger,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
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
                              'Food & Beverage',
                              style: AppTextStyles.appbarTitle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              'Boba Tea',
                              style: AppTextStyles.appbarTitle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    '-\$12.00',
                    style: TextStyle(
                      color: AppColor.textDanger,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
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
                              'Food & Beverage',
                              style: AppTextStyles.appbarTitle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              'Boba Tea',
                              style: AppTextStyles.appbarTitle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    '-\$12.00',
                    style: TextStyle(
                      color: AppColor.textDanger,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

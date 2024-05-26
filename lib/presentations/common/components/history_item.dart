import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/constants/text_styles.dart';
import 'package:se109_goldstore/presentations/common/components/buy_item.dart';

class HistoryItem extends StatelessWidget {
  final List<String> listQuantity;
  final String date;
  const HistoryItem(
      {super.key, required this.listQuantity, required this.date});

  @override
  Widget build(BuildContext context) {
    List<String> parts = date.split('-');
    debugPrint(parts.toString());
    String day = parts[0];
    String month = parts[1];
    String year = parts[2];
    int total = 0;
    for (var element in listQuantity) {
      total += int.parse(element);
    }
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
                        day,
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
                      'Tháng $month',
                      style: AppTextStyles.appbarTitle.copyWith(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      ' - $year',
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
                '$total CHỈ',
                style: AppTextStyles.appbarTitle.copyWith(
                  fontSize: 14,
                  color: AppColor.textSafe,
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
            children: List.generate(
                listQuantity.length,
                (index) => BuyItem(
                      quantity: listQuantity[index],
                    )),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

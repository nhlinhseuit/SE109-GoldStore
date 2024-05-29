import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/constants/text_styles.dart';
import 'package:se109_goldstore/core/extensions/datetime.dart';
import 'package:se109_goldstore/core/utils/converter.dart';
import 'package:se109_goldstore/core/utils/currency.dart';
import 'package:se109_goldstore/data/models/currency_price.dart';

import 'column_header.dart';

class CurrencyTable extends StatelessWidget {
  const CurrencyTable({
    super.key,
    required this.currentPrice,
    required this.oldPrice,
    required this.currentTime,
    required this.oldTime,
  });

  final List<CurrencyPrice> currentPrice;
  final List<CurrencyPrice> oldPrice;

  final DateTime currentTime;
  final DateTime oldTime;

  @override
  Widget build(BuildContext context) {
    final Map<String, List<double>> mapPrice = {
      for (var element in currentPrice)
        element.name: [element.buy]
    };

    for (var element in oldPrice) {
      mapPrice[element.name] ??= [0];
      mapPrice[element.name]!
          .add(element.buy);
    }

    mapPrice.removeWhere(((key, value) => value.length < 2));
    

    return DataTable(
      showBottomBorder: true,
      headingTextStyle: AppTextStyles.body,
      horizontalMargin: 10,
      columnSpacing: 4,
      dataRowMinHeight: 45,
      dataRowMaxHeight: 45,
      headingRowColor:
          MaterialStateColor.resolveWith((states) => AppColor.primaryGold),
      border: TableBorder.symmetric(
          outside: const BorderSide(width: 1, color: AppColor.border)),
      showCheckboxColumn: false,
      columns: [
        const DataColumn(
            label: ColumnHeader(
          name: "Name",
          color: Colors.white,
        )),
        DataColumn(
          label: ColumnHeader(
            color: Colors.white,
            name: oldTime.toDMYFormat(),
          ),
        ),
        DataColumn(
          label: ColumnHeader(
            color: Colors.white,
            name: currentTime.toDMYFormat(),
          ),
        )
      ],
      rows: mapPrice.keys
          .map((e) => DataRow(cells: [
                DataCell(Text(
                  cvToString(e),
                  style: AppTextStyles.body,
                )),
                cellPrice(mapPrice[e]![0], AppColor.textNormal),
                cellPrice(mapPrice[e]![1], (mapPrice[e]![0]) < (mapPrice[e]![1])
                  ? AppColor.textSafe
                  : ((mapPrice[e]![0]) > (mapPrice[e]![1])
                      ? AppColor.textDanger
                      : AppColor.textNormal)),
              ]))
          .toList(),
    );
  }

  DataCell cellPrice(double price, Color color) {
    return DataCell(Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          CurrencyUtils.convertDoubleToCurrencyWithUnit(price),
          style: TextStyle(
              color: color),
        ),
      ],
    ));
  }
}
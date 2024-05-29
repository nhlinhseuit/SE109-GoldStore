import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/constants/text_styles.dart';
import 'package:se109_goldstore/core/utils/converter.dart';
import 'package:se109_goldstore/core/utils/currency.dart';
import 'package:se109_goldstore/data/models/daily_price.dart';

import 'column_header.dart';

class PriceTable extends StatelessWidget {
  const PriceTable({
    super.key,
    required this.currentPrice,
    required this.currentTime,
  });

  final List<DailyPrice> currentPrice;

  final DateTime currentTime;

  @override
  Widget build(BuildContext context) {
    final Map<String, List<double>> mapPrice = {};

    // for (var element in oldPrice) {
    //   mapPrice[element.name] ??= [];
    //   mapPrice[element.name]!
    //       .add(PriceModel(buy: element.buy, sell: element.sell));
    // }
    for (var element in currentPrice) {
      mapPrice[element.name] = [element.buy, element.sell, element.sell - element.buy];
    }

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
      columns: const [
        DataColumn(
            label: ColumnHeader(
          name: "Name",
          color: Colors.white,
        )),
        DataColumn(
          label: ColumnHeader(
            color: Colors.white,
            name: 'Buy',
          ),
        ),
        DataColumn(
          label: ColumnHeader(
            color: Colors.white,
            name: 'Sell',
          ),
        ),
        DataColumn(
          label: ColumnHeader(
            color: Colors.white,
            name: 'Gap',
          ),
        ),
      ],
      rows: mapPrice.keys
          .map((e) => DataRow(cells: [
                DataCell(Text(
                  cvToString(e),
                  style: AppTextStyles.body,
                )),
                cellPrice(mapPrice[e]?[0] ?? 0, AppColor.textNormal),
                cellPrice(
                  mapPrice[e]?[1] ?? 0,
                  (mapPrice[e]?[2] ?? 0) > 0 ? 
                    AppColor.textSafe : 
                    ((mapPrice[e]?[2] ?? 0) == 0 ? AppColor.textNormal : AppColor.textDanger)
                ),
                cellPrice(
                  mapPrice[e]?[2] ?? 0, 
                  (mapPrice[e]?[2] ?? 0) > 0 ? 
                    AppColor.textSafe : 
                    ((mapPrice[e]?[2] ?? 0) == 0 ? AppColor.textNormal : AppColor.textDanger)
                ),
              ]))
          .toList(),
    );
  }

  DataCell cellPrice(double price, Color color) {
    return DataCell(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        CurrencyUtils.convertDoubleToCurrency(price),
        style: TextStyle(
            color: color),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/constants/text_styles.dart';
import 'package:se109_goldstore/core/extensions/datetime.dart';
import 'package:se109_goldstore/core/utils/converter.dart';
import 'package:se109_goldstore/core/utils/currency.dart';
import 'package:se109_goldstore/data/models/daily_price.dart';
import 'package:se109_goldstore/data/models/price_model.dart';

import 'column_header.dart';

class PriceTable extends StatelessWidget {
  const PriceTable({
    super.key,
    required this.currentPrice,
    required this.oldPrice,
    required this.currentTime,
    required this.oldTime,
  });

  final List<DailyPrice> currentPrice;
  final List<DailyPrice> oldPrice;

  final DateTime currentTime;
  final DateTime oldTime;

  @override
  Widget build(BuildContext context) {
    final Map<String, List<PriceModel>> mapPrice = {};

    for (var element in currentPrice) {
      mapPrice[element.name] ??= [];
      mapPrice[element.name]!
          .add(PriceModel(buy: element.buy, sell: element.sell));
    }
    for (var element in oldPrice) {
      mapPrice[element.name] ??= [PriceModel.empty()];
      mapPrice[element.name]!
          .add(PriceModel(buy: element.buy, sell: element.sell));
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
                cellPrice(mapPrice[e]?[0] ?? PriceModel.empty()),
                cellPrice(mapPrice[e]?[1] ?? PriceModel.empty()),
              ]))
          .toList(),
    );
  }

  DataCell cellPrice(PriceModel price) {
    return DataCell(Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          CurrencyUtils.convertDoubleToCurrency(price.buy),
        ),
        Text(
          CurrencyUtils.convertDoubleToCurrency(price.sell),
          style: TextStyle(
              color: price.buy < price.sell
                  ? AppColor.textSafe
                  : (price.buy > price.sell
                      ? AppColor.textDanger
                      : AppColor.textNormal)),
        ),
      ],
    ));
  }
}

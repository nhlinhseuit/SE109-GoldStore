import 'package:flutter/material.dart';
import 'package:flutter_touch_ripple/widgets/widget.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/constants/text_styles.dart';
import 'package:se109_goldstore/core/utils/converter.dart';
import 'package:se109_goldstore/data/shared_preferences.dart';
import 'package:se109_goldstore/presentations/common/components/add_elevated_button.dart';
import 'package:se109_goldstore/presentations/common/components/custom_text_form_field.dart';
import 'package:se109_goldstore/presentations/general/price_page.dart';

class AddHistory extends StatefulWidget {
  final ValueNotifier<int> valueNotifier;
  const AddHistory({required this.valueNotifier, super.key});

  @override
  State<AddHistory> createState() => _AddHistoryState();
}

class _AddHistoryState extends State<AddHistory> {
  final formKey = GlobalKey<FormState>();
  late int numberOfItem;
  bool isSuccess = false;
  var selectedType = PriceType.GOLD;
  var previousSelectedType = PriceType.GOLD;
  DateTime selectedDateGold = DateTime.now();
  DateTime selectedDateCurrency = DateTime.now();

  final quantityTC = TextEditingController();
  final dateTC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: AppColor.secondDark,
        centerTitle: true,
        title: Text(
          'Thêm lịch sử mua vàng',
          style: AppTextStyles.appbarTitle,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColor.primaryGradientBackground,
        ),
        height: double.infinity,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Đơn vị',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: AppColor.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Material(
                              color: Colors.transparent,
                              child: CustomTextFormField(
                                hintText: 'Đơn vị: Chỉ',
                                enabled: false,
                                fontStyle:
                                    TextFormFieldFontStyle.txt16SemiBoldWhite80,
                                prefix: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Icon(
                                    Icons.money,
                                    color: Colors.white,
                                  ),
                                ),
                                margin: EdgeInsets.only(top: 10),
                                fillColor: Colors.transparent,
                                radius: 12,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Chọn ngày',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: AppColor.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TouchRipple(
                              onTap: () => _selectDate(context),
                              child: Material(
                                color: Colors.transparent,
                                child: CustomTextFormField(
                                  prefix: const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Icon(
                                      Icons.calendar_month,
                                      color: Colors.white,
                                    ),
                                  ),
                                  fillColor: Colors.transparent,
                                  hintText: formatDatetime(selectedDateGold),
                                  enabled: false,
                                  fontStyle: TextFormFieldFontStyle
                                      .txt16SemiBoldWhite80,
                                  radius: 12,
                                  controller: dateTC,
                                  margin: const EdgeInsets.only(top: 10),
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nhập số lượng',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: AppColor.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: CustomTextFormField(
                                hintText: 'Số lượng',
                                fontStyle:
                                    TextFormFieldFontStyle.txt16SemiBoldWhite80,
                                prefix: const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Icon(
                                    Icons.numbers,
                                    color: Colors.white,
                                  ),
                                ),
                                fillColor: Colors.transparent,
                                radius: 12,
                                controller: quantityTC,
                                margin: const EdgeInsets.only(top: 10),
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value == null || value.isEmpty == true) {
                                    return 'Vui lòng nhập số lượng';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              AddElevatedButton(
                onPressed: () async {
                  if (quantityTC.text.trim().isEmpty) {
                    isSuccess = false;
                    showAlertDialog();
                  } else if (RegExp(r'^0|[^\d]')
                      .hasMatch(quantityTC.text.trim())) {
                    isSuccess = false;
                    showAlertDialog();
                  } else {
                    isSuccess = true;
                    addStringToList(
                        quantityTC.text.trim(), 'myQuantityHistoryList');
                    addStringToList(
                        formatDatetime(selectedDateGold), 'myDateHistoryList');

                    showAlertDialog();
                  }
                },
                text: 'Thêm lịch sử',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    if (selectedType == PriceType.GOLD) {
      if (picked != selectedDateGold) {
        setState(() {
          selectedDateGold = picked!;
        });
      }
    } else {
      if (picked != selectedDateCurrency) {
        setState(() {
          selectedDateCurrency = picked!;
        });
      }
    }
  }

  void showAlertDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Icon(
                isSuccess ? Icons.check_circle : Icons.cancel,
                color: isSuccess ? Colors.lightGreen : Colors.red,
                size: 70,
              )),
              const SizedBox(height: 16),
              Text(
                isSuccess
                    ? 'Tạo cảnh báo thành công!'
                    : 'Xin vui lòng nhập lại giá trị!',
                style: const TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 20.0,
                    top: 10,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.white,
                      ),
                      backgroundColor: const Color(0xFF23a086),
                    ),
                    onPressed: () async {
                      if (isSuccess) {
                        widget.valueNotifier.value++;

                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'OK',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColor.textNormal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

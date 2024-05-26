import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/constants/text_styles.dart';
import 'package:se109_goldstore/data/shared_preferences.dart';
import 'package:se109_goldstore/presentations/common/components/add_elevated_button.dart';
import 'package:se109_goldstore/presentations/common/components/my_elevated_button.dart';
import 'package:se109_goldstore/presentations/common/components/number_button.dart';
import 'package:se109_goldstore/presentations/common/components/page_header.dart';
import 'package:se109_goldstore/presentations/general/alert_page.dart';
import 'package:se109_goldstore/presentations/general/price_page.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  var selectedType = PriceType.GOLD;
  bool isSuccess = false;
  final keyboardController = TextEditingController();
  final keyboardScroll = ScrollController();
  bool isConvertGold = true;
  String result = '0';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    keyboardController.text = '';
    keyboardController.dispose();
    keyboardScroll.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text(
        //     'Quy đổi vàng / tiền tệ',
        //     style: AppTextStyles.appbarTitle,
        //   ),
        //   backgroundColor: AppColor.secondDark,
        // ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: AppColor.primaryGradientBackground,
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Header(
                  firstLine: "Quy đổi vàng",
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 5,
                    right: 20,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // TỪ
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Từ',
                                    style: AppTextStyles.appbarTitle.copyWith(
                                      color: const Color.fromARGB(
                                          255, 180, 180, 180),
                                      fontWeight: FontWeight.w100,
                                      fontSize: 13,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    isConvertGold
                                        ? Container(
                                            width: 36,
                                            height: 36,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFfff7e6),
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: const Icon(
                                              Icons.bar_chart_rounded,
                                              size: 28,
                                              color: Color(0xFFf7b60a),
                                            ),
                                          )
                                        : Container(
                                            width: 36,
                                            height: 36,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFfff7e6),
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: const Icon(
                                              Icons.currency_exchange_rounded,
                                              size: 28,
                                              color: AppColor.textSafe,
                                            ),
                                          ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    isConvertGold
                                        ? Text(
                                            'CHỈ',
                                            style: AppTextStyles.appbarTitle
                                                .copyWith(
                                              color: const Color(0xFFf7b60a),
                                              fontWeight: FontWeight.w200,
                                              fontSize: 16,
                                            ),
                                          )
                                        : Text(
                                            'VNĐ',
                                            style: AppTextStyles.appbarTitle
                                                .copyWith(
                                              color: AppColor.textSafe,
                                              fontWeight: FontWeight.w200,
                                              fontSize: 16,
                                            ),
                                          ),
                                  ],
                                )),
                                Expanded(child: myTextField()),
                                const SizedBox(width: 10),
                                Positioned(
                                  right: MediaQuery.of(context).size.width / 7,
                                  top: MediaQuery.of(context).size.width / 20,
                                  child: GestureDetector(
                                    onTap: handleDelete,
                                    onLongPress: () => handleDelete(true),
                                    behavior: HitTestBehavior.translucent,
                                    child: Icon(
                                      Icons.backspace_rounded,
                                      color: Colors.white,
                                      size: MediaQuery.of(context).size.width /
                                          18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Stack(
                              children: [
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        color: AppColor.textSafe,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                      height: 40,
                                    ),
                                    Expanded(
                                      child: Divider(
                                        color: AppColor.textSafe,
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  left: constraints.maxWidth / 2 - 20,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: AppColor.textSafe)),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(
                                        Icons.swap_vert,
                                        color: AppColor.textSafe,
                                      ),
                                      onPressed: () {
                                        debugPrint('Button pressed');
                                        setState(() {
                                          isConvertGold = !isConvertGold;
                                        });
                                        keyboardController.clear();
                                        result = '0';
                                      },
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),

                        // ĐẾN
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Đến',
                                    style: AppTextStyles.appbarTitle.copyWith(
                                      color: const Color.fromARGB(
                                          255, 180, 180, 180),
                                      fontWeight: FontWeight.w100,
                                      fontSize: 13,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    isConvertGold
                                        ? Container(
                                            width: 36,
                                            height: 36,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFfff7e6),
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: const Icon(
                                              Icons.currency_exchange_rounded,
                                              size: 28,
                                              color: AppColor.textSafe,
                                            ),
                                          )
                                        : Container(
                                            width: 36,
                                            height: 36,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFfff7e6),
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: const Icon(
                                              Icons.bar_chart_rounded,
                                              size: 28,
                                              color: Color(0xFFf7b60a),
                                            ),
                                          ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    isConvertGold
                                        ? Text(
                                            'VNĐ',
                                            style: AppTextStyles.appbarTitle
                                                .copyWith(
                                              color: AppColor.textSafe,
                                              fontWeight: FontWeight.w200,
                                              fontSize: 16,
                                            ),
                                          )
                                        : Text(
                                            'CHỈ',
                                            style: AppTextStyles.appbarTitle
                                                .copyWith(
                                              color: const Color(0xFFf7b60a),
                                              fontWeight: FontWeight.w200,
                                              fontSize: 16,
                                            ),
                                          ),
                                  ],
                                )),
                                Container(
                                  margin: const EdgeInsets.only(
                                    right: 30,
                                  ),
                                  child: Text(
                                    result,
                                    style: AppTextStyles.appbarTitle.copyWith(
                                      color: isConvertGold
                                          ? AppColor.textSafe
                                          : const Color(0xFFf7b60a),
                                      fontWeight: FontWeight.w200,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              LayoutGrid(
                columnSizes: const [auto, auto, auto],
                rowSizes: const [auto, auto, auto, auto],
                columnGap: 40,
                rowGap: 5,
                gridFit: GridFit.loose,
                children: List.generate(
                  symbols.length,
                  (index) => NumberButton(
                    keyboardNumber: symbols[index],
                    keyboardCharacter: _getCharacters(symbols[index]),
                    onTap: handleInsert,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MyElevatedButton(
                onPressed: () async {
                  // if (keyboardController.text.trim().isEmpty) {
                  //   isSuccess = false;
                  //   showAlertDialog();
                  // } else if (RegExp(r'^0|[^\d]')
                  //     .hasMatch(keyboardController.text.trim())) {
                  //   isSuccess = false;
                  //   showAlertDialog();
                  // } else {
                  //   isSuccess = true;
                  //   // addStringToList(
                  //   // keyboardController.text.trim(), 'myAlertsCurrencyList');
                  //   showAlertDialog();
                  //   isConvertGold ? convertGoldToPrice() : convertPriceToGold();
                  // }

                  isConvertGold ? convertGoldToPrice() : convertPriceToGold();
                },
                text: 'Quy đổi',
              ),
            ],
          ),
        ));
  }

  void convertGoldToPrice() {
    int? value = int.tryParse(keyboardController.text);

    if (value != null) {
      double total = value * 7500000;
      setState(() {
        result = total.toString();
      });
    } else {
      print('Giá trị nhập vào không hợp lệ.');
    }
  }

  void convertPriceToGold() {
    String valueText = keyboardController.text;

    double? value = double.tryParse(valueText);

    if (value != null) {
      double total = value / 7500000;

      setState(() {
        result = total.toStringAsFixed(3);
      });
    } else {
      print('Giá trị nhập vào không hợp lệ.');
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
                      // if (isSuccess) {
                      //   Navigator.pop(context);
                      //   Navigator.pop(context);
                      //   Navigator.pop(context);
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const AlertPage()),
                      //   );
                      // } else {
                      //   Navigator.pop(context);
                      // }
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

  void handleDelete([bool isAll = false]) async {
    if (isAll) {
      keyboardController.value = const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );

      return;
    }

    final selection = keyboardController.selection;

    if (selection.start == 0 && selection.end == 0) return;

    if (selection.start != selection.end) {
      final newText = keyboardController.text
          .replaceRange(selection.start, selection.end, '');
      keyboardController.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: selection.baseOffset),
      );

      return;
    }

    final newText = keyboardController.text
        .replaceRange(selection.start - 1, selection.end, '');
    keyboardController.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: selection.baseOffset - 1),
    );
  }

  void handleInsert(String symbol) {
    final selection = keyboardController.selection;
    if (keyboardController.text.length == 20) {
      return;
    }
    if (selection.baseOffset < 0) {
      keyboardController.text += symbol;

      return;
    }
    final newText = keyboardController.text
        .replaceRange(selection.start, selection.end, symbol);
    keyboardController.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: selection.baseOffset + 1),
    );
    handleScrollTextField();
  }

  void handleScrollTextField() {
    TextPainter painter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(
            style: AppTextStyles.txt16SemiBold.copyWith(
                color: Colors.black, fontSize: 36, fontWeight: FontWeight.w800),
            text: keyboardController.text));
    painter.layout();
    TextPosition cursorTextPosition = keyboardController.selection.base;
    Rect caretPrototype = const Rect.fromLTWH(0, 0, 2, 5);
    Offset caretOffset =
        painter.getOffsetForCaret(cursorTextPosition, caretPrototype);

    keyboardScroll.animateTo(
      caretOffset.dx,
      duration: const Duration(milliseconds: 350),
      curve: Curves.ease,
    );
  }

  Widget myTextField() {
    return TextField(
      controller: keyboardController,
      scrollController: keyboardScroll,
      scrollPhysics: const ClampingScrollPhysics(),
      keyboardType: TextInputType.none,
      showCursor: true,
      textAlign: TextAlign.right,
      style: AppTextStyles.appbarTitle.copyWith(
        color: isConvertGold ? const Color(0xFFf7b60a) : AppColor.textSafe,
        fontWeight: FontWeight.w200,
        fontSize: 16,
      ),
      onChanged: (value) {},
      decoration: InputDecoration.collapsed(
        hintText: '0',
        hintStyle: AppTextStyles.appbarTitle.copyWith(
          color: isConvertGold ? const Color(0xFFf7b60a) : AppColor.textSafe,
          fontWeight: FontWeight.w200,
          fontSize: 16,
        ),
      ),
      autofocus: true,
      cursorColor: Colors.white,
      enableInteractiveSelection: false,
    );
  }

  final symbols = [...List.generate(9, (i) => '${i + 1}'), '*', '0', '#'];

  String _getCharacters(String number) {
    final Map<String, String> numberToCharacters = {
      '1': '',
      '2': 'ABC',
      '3': 'DEF',
      '4': 'GHI',
      '5': 'JKL',
      '6': 'MNO',
      '7': 'PQRS',
      '8': 'TUV',
      '9': 'WXYZ',
      '*': '',
      '0': '+',
      '#': '',
    };
    return numberToCharacters[number] ?? '';
  }
}

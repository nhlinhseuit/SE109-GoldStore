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
                                    Container(
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
                                    Text(
                                      'CHỈ',
                                      style: AppTextStyles.appbarTitle.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w200,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                )),
                                Text(
                                  '0',
                                  style: AppTextStyles.appbarTitle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          height: 1,
                        ),

                        const SizedBox(
                          height: 20,
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
                                    Container(
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
                                    Text(
                                      'VNĐ',
                                      style: AppTextStyles.appbarTitle.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w200,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                )),
                                Text(
                                  '0',
                                  style: AppTextStyles.appbarTitle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 16,
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
                  if (keyboardController.text.trim().isEmpty) {
                    isSuccess = false;
                    showAlertDialog();
                  } else if (RegExp(r'^0|[^\d]')
                      .hasMatch(keyboardController.text.trim())) {
                    isSuccess = false;
                    showAlertDialog();
                  } else {
                    isSuccess = true;
                    addStringToList(
                        keyboardController.text.trim(), 'myAlertsCurrencyList');
                    showAlertDialog();
                  }
                },
                text: 'Tiếp tục',
              ),
            ],
          ),
        ));
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
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AlertPage()),
                        );
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
      textAlign: TextAlign.center,
      style: AppTextStyles.txt16SemiBold.copyWith(
        color: Colors.white,
        fontSize: 36,
        fontWeight: FontWeight.w800,
      ),
      onChanged: (value) {},
      decoration: const InputDecoration.collapsed(hintText: ''),
      autofocus: true,
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

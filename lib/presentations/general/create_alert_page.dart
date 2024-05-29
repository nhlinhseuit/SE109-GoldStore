import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/constants/text_styles.dart';
import 'package:se109_goldstore/data/shared_preferences.dart';
import 'package:se109_goldstore/presentations/common/components/add_elevated_button.dart';
import 'package:se109_goldstore/presentations/common/components/number_button.dart';
import 'package:se109_goldstore/presentations/general/alert_page.dart';
import 'package:se109_goldstore/presentations/general/price_page.dart';

class CreateAlertPage extends StatefulWidget {
  final bool isGold;
  const CreateAlertPage({required this.isGold, super.key});

  @override
  State<CreateAlertPage> createState() => _CreateAlertPageState();
}

class _CreateAlertPageState extends State<CreateAlertPage> {
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
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            'Tạo cảnh báo',
            style: AppTextStyles.appbarTitle,
          ),
          backgroundColor: AppColor.secondDark,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: AppColor.primaryGradientBackground,
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.isGold ? 'Giá vàng' : 'Giá ngoại tệ \$',
                      style: AppTextStyles.appbarTitle.copyWith(
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Giá hiện tại:',
                          style: AppTextStyles.appbarTitle.copyWith(
                            color: AppColor.textSafe,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          widget.isGold ? '865.000.000 VND' : '23.000 VND',
                          style: AppTextStyles.appbarTitle.copyWith(
                            color: AppColor.textSafe,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: ' Thông báo cho tôi khi ',
                            style: AppTextStyles.appbarTitle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: widget.isGold ? '1 chỉ vàng' : '1\$',
                            style: AppTextStyles.appbarTitle.copyWith(
                              color: AppColor.primaryGold,
                              fontWeight: FontWeight.w200,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: ' vượt mức',
                            style: AppTextStyles.appbarTitle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 14),
                        Text(
                          'VND',
                          style: AppTextStyles.appbarTitle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 22),
                        Expanded(child: myTextField()),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: handleDelete,
                          onLongPress: () => handleDelete(true),
                          behavior: HitTestBehavior.translucent,
                          child: Container(
                            padding:
                                const EdgeInsets.fromLTRB(12, 12, 14, 12),
                            child: Icon(
                              Icons.backspace_rounded,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.width / 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
              AddElevatedButton(
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
                    widget.isGold
                        ? addStringToList(
                            keyboardController.text.trim(), 'myAlertsGoldList')
                        : addStringToList(keyboardController.text.trim(),
                            'myAlertsCurrencyList');
                    showAlertDialog();
                  }
                },
                text: 'Tạo cảnh báo',
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

import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/constants/text_styles.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({
    super.key,
    required this.keyboardNumber,
    required this.keyboardCharacter,
    required this.onTap,
  });

  final String keyboardNumber;
  final String keyboardCharacter;
  final void Function(String character) onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width / 6,
        minHeight: MediaQuery.of(context).size.width / 6,
      ),
      child: ElevatedButton(
        onPressed: () => onTap(keyboardNumber),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          foregroundColor: AppColor.royalBlue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              keyboardNumber,
              style: AppTextStyles.txt14MediumBlack200.copyWith(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
            keyboardCharacter == ''
                ? const SizedBox(
                    height: 12,
                  )
                : Text(
                    keyboardCharacter,
                    style: AppTextStyles.txt14MediumBlack200.copyWith(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/colors.dart';

class MyElevatedButton extends StatelessWidget {
  void Function()? onPressed;
  String text;
  MyElevatedButton({required this.onPressed, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            width: 3,
            color: AppColor.textNormal,
          ),
          backgroundColor: AppColor.secondDark,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColor.textNormal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

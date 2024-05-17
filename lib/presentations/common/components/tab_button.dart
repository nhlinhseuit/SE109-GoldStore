// import 'package:flutter/material.dart';
// import 'package:se109_goldstore/presentations/general/price_page.dart';

// class TabButton extends StatefulWidget {
//   final String text;
//   final PriceType type;
//   const TabButton({required this.text, required this.type, super.key});

//   @override
//   State<TabButton> createState() => _TabButtonState();
// }

// class _TabButtonState extends State<TabButton> {
//   @override
//   Widget build(BuildContext context) {
//     bool isSelected = widget.type == selectedType;
//     return InkWell(
//       onTap: () => onTabChange(type),
//       child: Container(
//         height: 36,
//         padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//         decoration: BoxDecoration(
//           gradient: isSelected ? AppColor.primaryDarkGradientButton : null,
//           borderRadius: BorderRadius.circular(24),
//           border: isSelected
//               ? null
//               : Border.all(
//                   width: 2,
//                   color: AppColor.secondDark,
//                 ),
//           color: isSelected ? AppColor.secondDark : Colors.transparent,
//         ),
//         child: Text(
//           text,
//           style: AppTextStyles.txt14BoldBlack.copyWith(
//             color: isSelected ? AppColor.textNormal : AppColor.textNormal,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }

// Widget tabButton(String text, PriceType type) {}

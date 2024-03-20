import 'dart:core';
import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/colors.dart';

import '../common/components/page_header.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  late int numberOfItem;
  int _selectedChoiceIndex = 0;
  final List<String> _choiceChips = ['Gold Price', 'Popular'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const Header(
          firstLine: "Gold Price",
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            children: [
              ..._choiceChips.map((chip) => 
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(chip),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                    selectedColor: AppColor.primaryGold,
                    disabledColor: AppColor.grey,
                    selected: _selectedChoiceIndex == _choiceChips.indexOf(chip),
                    showCheckmark: false,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedChoiceIndex = selected ? 
                          _choiceChips.indexOf(chip) 
                          : (_choiceChips.indexOf(chip) - 1).abs();
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        // _selectedChoiceIndex == 0
        //     ? ImageStreamView(
        //         user: currentUser, imagesStream: MyImage.imagesStream())
        //     : ImageStreamView(
        //         user: currentUser,
        //         imagesStream: MyImage.imagesPopularStream()),

      ]),
    );
  }
}

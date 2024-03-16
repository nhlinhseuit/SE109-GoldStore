import 'dart:core';
import 'package:flutter/material.dart';

import '../common/components/page_header.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  late int numberOfItem;
  int _selectedChoiceIndex = 0;
  final List<String> _choiceChips = ['Gold Pr', 'Popular'];

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
              ChoiceChip(
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(_choiceChips[0]),
                ),
                selectedColor: Theme.of(context).colorScheme.primary,
                selected: _selectedChoiceIndex == 0,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedChoiceIndex = selected ? 0 : 1;
                  });
                },
              ),
              const SizedBox(
                width: 8,
              ),
              ChoiceChip(
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(_choiceChips[1]),
                ),
                selectedColor: Theme.of(context).colorScheme.primary,
                selected: _selectedChoiceIndex == 1,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedChoiceIndex = selected ? 1 : 0;
                  });
                },
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

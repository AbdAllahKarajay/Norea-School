import 'package:flutter/material.dart';
import 'package:norea_school_student/pages/recitations_page_2.dart';

import '../Theme/Colors.dart';

class ResultChips extends StatefulWidget {
  const ResultChips({super.key, required this.notifyParent});

  final int count = 5;
  final Function(bool, bool) notifyParent;

  @override
  State<ResultChips> createState() => _ResultChipsState();
}

class _ResultChipsState extends State<ResultChips> {
  final chipsTexts = [
    "اليوم",
    "الكل",
    "اسبوع",
    "شهر",
    "موسم",
  ];
  int _indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: Colors.transparent),
        child: SizedBox(
          height: 50,
          child: Center(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: widget.count * 2 + 1,
                itemBuilder: (context, index) {
                  if (index.isEven) return const SizedBox(width: 8);
                  return ChoiceChip(
                    label: Text(chipsTexts[index~/2 ]),
                    selected: isSelected(index),
                    backgroundColor: AppColors.Downy.withOpacity(0.0),
                    shadowColor: Colors.greenAccent.shade400,
                    selectedColor: AppColors.secondaryColor.withOpacity(0.0),
                    labelStyle: TextStyle(
                        color: isSelected(index)
                            ? AppColors.secondaryColor
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.025),
                    onSelected: (value) {
                      if (_indexSelected != index ~/ 2) {
                        setState(() {
                          _indexSelected = index ~/ 2;
                        });
                      }
                      if (index ~/ 2 == 1) {
                        widget.notifyParent(false, false);
                      } else if (index ~/ 2 < 1) {
                        widget.notifyParent(false, true);
                      } else {
                        widget.notifyParent(true, false);
                      }
                    },
                  );
                }),
          ),
        ),
        // backgroundColor: Colors.transparent, // or any other color
      // ),
    );
  }

  bool isSelected(int index) => _indexSelected == index ~/ 2;
}

import 'package:flutter/material.dart';

import '../Theme/Colors.dart';

class MyChoiceChips extends StatefulWidget {
  const MyChoiceChips({super.key, required this.count});
  final int count;

  @override
  State<MyChoiceChips> createState() => _MyChoiceChipsState();
}

class _MyChoiceChipsState extends State<MyChoiceChips> {
  int _indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget.count * 2+1,
            itemBuilder: (context, index) {
              if (index.isEven) return const SizedBox(width: 8);
              return ChoiceChip(
                label: Builder(builder: (context){
                  String number = '';
                  switch(index ~/ 2 + 1){
                    case 1: number = 'الأول'; break;
                    case 2: number = 'الثاني'; break;
                    case 3: number = 'الثالث'; break;
                    case 4: number = 'الرابع'; break;
                    case 5: number = 'الخامس'; break;
                    case 6: number = 'السادس'; break;
                    case 7: number = 'السابع'; break;
                    case 8: number = 'الثامن'; break;
                    case 9: number = 'التاسع'; break;
                  }
                  return Text(number);
                },),
                selected: _indexSelected == index ~/ 2,
                backgroundColor: AppColors.Downy.withOpacity(0.7),
                shadowColor: Colors.greenAccent.shade400,
                selectedColor: AppColors.secondaryColor.withOpacity(0.7),
                onSelected: (value) {
                  if (_indexSelected != index ~/ 2) {
                    setState(() {
                      _indexSelected = index ~/ 2;
                    });
                  }
                },
              );
            }
            ),
      ),
    );
  }
}

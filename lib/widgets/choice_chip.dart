import 'package:flutter/material.dart';

import '../Theme/Colors.dart';

class MyChoiceChips extends StatefulWidget {
  const MyChoiceChips({super.key, required this.tomesCount});
  final int tomesCount;

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
            reverse: true,
            itemCount: widget.tomesCount * 2+1,
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
            //   const SizedBox(width: 8),
            //   ChoiceChip(
            //     label: const Text('الثاني'),
            //     selected: _indexSelected == 1,
            //     backgroundColor: AppColors.Downy.withOpacity(0.7),
            //     shadowColor: Colors.greenAccent.shade400,
            //     selectedColor: AppColors.secondaryColor.withOpacity(0.7),
            //     onSelected: (value) {
            //       if(_indexSelected != 1) {
            //         setState(() {
            //           _indexSelected = 1;
            //         });
            //       }
            //     },
            //   ),
            //   const SizedBox(width: 8),
            //   ChoiceChip(
            //     label: const Text('الثالث'),
            //     selected: _indexSelected == 2,
            //     backgroundColor: AppColors.Downy.withOpacity(0.7),
            //     shadowColor: Colors.greenAccent.shade400,
            //     selectedColor: AppColors.secondaryColor.withOpacity(0.7),
            //     // selectedShadowColor: Colors.greenAccent,
            //     onSelected: (value) {
            //       if(_indexSelected != 2) {
            //         setState(() {
            //           _indexSelected = 2;
            //         });
            //       }
            //     },
            //   ),
            //   const SizedBox(width: 8),
            //   ChoiceChip(
            //     label: const Text('الرابع'),
            //     backgroundColor: AppColors.Downy.withOpacity(0.7),
            //     shadowColor: Colors.greenAccent.shade400,
            //     selected: _indexSelected == 3,
            //     selectedColor: AppColors.secondaryColor.withOpacity(0.7),
            //     onSelected: (value) {
            //       if(_indexSelected != 3) {
            //         setState(() {
            //           _indexSelected = 3;
            //         });
            //       }
            //     },
            //   ),
            // ],
            ),
      ),
    );
  }
}

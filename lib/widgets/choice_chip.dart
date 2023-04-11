import 'package:flutter/material.dart';

import '../Theme/Colors.dart';

class MyChoiceChips extends StatefulWidget {
  const MyChoiceChips({super.key, required this.count, required this.color});
  final int count;
  final Color color;

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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                label: Builder(builder: (context){
                  String number = '';
                  switch(index ~/ 2 + 1){
                    case 1: number = 'المجلد الأول'; break;
                    case 2: number = 'المجلد الثاني'; break;
                    case 3: number = 'المجلد الثالث'; break;
                    case 4: number = 'المجلد الرابع'; break;
                    case 5: number = 'المجلد الخامس'; break;
                    case 6: number = 'المجلد السادس'; break;
                    case 7: number = 'المجلد السابع'; break;
                    case 8: number = 'المجلد الثامن'; break;
                    case 9: number = 'المجلد التاسع'; break;
                  }
                  return Text(number,style: const TextStyle(color: Colors.white),);
                },),
                selected: _indexSelected == index ~/ 2,
                backgroundColor: widget.color,
                shadowColor: Colors.greenAccent.shade400,
                selectedColor: widget.color.withOpacity(0.4),
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

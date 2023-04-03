import 'package:flutter/material.dart';
import 'package:norea_school_student/pages/recitations_page_2.dart';

import '../Theme/Colors.dart';

class ResultChips extends StatefulWidget {
  const ResultChips({super.key, required this.notifyParent});
  final int count = 4;
  final Function(bool) notifyParent;

  @override
  State<ResultChips> createState() => _ResultChipsState();
}

class _ResultChipsState extends State<ResultChips> {
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
                  String text = '';
                  switch(index ~/ 2 + 1){
                    case 1: text = 'اليوم'; break;
                    case 2: text = 'التسميعات'; break;
                    case 3: text = 'اسبوعية'; break;
                    case 4: text = 'شهرية'; break;
                  }
                  return Text(text);
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
                  if(index ~/2 > 1 ){
                    widget.notifyParent(true);
                  }else{
                    widget.notifyParent(false);
                  }
                },
              );
            }
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norea_school_student/features/recitations_page/recitations_page_2.dart';

import '../Theme/Colors.dart';
import '../features/recitations_page/bloc/filter_enum.dart';
import '../features/recitations_page/bloc/rec_bloc.dart';
import '../main.dart';

class ResultChips extends StatefulWidget {
  const ResultChips({super.key});

  final int count = 5;

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
  final recBloc = getIt.get<RecBloc>();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: Colors.transparent),
        child: SizedBox(
          height: 50,
          child: Center(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: widget.count,
                separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 8),
                itemBuilder: (context, index) => BlocBuilder<RecBloc, RecState>(
                  builder: (context,state) {
                    return ChoiceChip(
                        label: Text(chipsTexts[index]),
                        selected: isSelected(index),
                        backgroundColor: AppColors.Downy.withOpacity(0.0),
                        selectedColor: AppColors.secondaryColor.withOpacity(0.0),
                        labelStyle: TextStyle(
                            color: isSelected(index)
                                ? AppColors.secondaryColor
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height * 0.025),
                        onSelected: (value) {
                          if (recBloc.state.filter.index != index) {
                            recBloc.add(RecFiltering(Filter.values[index]));
                          }
                        },
                      );
                  }
                ),
            ),
          ),
        ),
    );
  }

  bool isSelected(int index) => recBloc.state.filter.index == index;
}

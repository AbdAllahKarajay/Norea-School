import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:norea_school_student/Sahih_Screen/Logic/sahih_states.dart';
import 'package:norea_school_student/Sahih_Screen/Logic/sahih_cubit.dart';
import 'package:norea_school_student/Theme/colors.dart';
import 'package:norea_school_student/Theme/fonts.dart';
import 'package:norea_school_student/pages/progress_in_book.dart';

class SahihScreen extends StatefulWidget {
  const SahihScreen({Key? key}) : super(key: key);
  final List<double> progress = const [100, 100, 100, 100, 20, 0, 0, 0];

  @override
  State<SahihScreen> createState() => _SahihScreenState();
}

class _SahihScreenState extends State<SahihScreen> {
  @override
  void initState() {
    BlocProvider.of<SahihCubit>(context).getColors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/Background Image.jpg"),
              fit: BoxFit.cover)),
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
        child: BlocBuilder<SahihCubit, SahihStates>(
          builder: (context, state) {
            if (state is SahihLoaded) {
              return GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing:
                          MediaQuery.of(context).size.height * 0.02,
                      crossAxisSpacing:
                          MediaQuery.of(context).size.width * 0.05),
                  itemBuilder: (context, index) => SahihWidget(
                        name: state.names[index],
                        color: (widget.progress[index] > 0)
                            ? state.colors[index]
                            : Colors.grey,
                        number: index,
                        progress: widget.progress[index],
                      ));
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ));
            }
          },
        ),
      ),
    );
  }
}

class SahihWidget extends StatefulWidget {
  final int number;
  final String name;
  final Color color;
  final double progress;

  const SahihWidget(
      {Key? key,
      required this.name,
      required this.color,
      required this.number,
      required this.progress})
      : super(key: key);

  @override
  State<SahihWidget> createState() =>
      SahihWidgetState(name, color, number, progress);
}

class SahihWidgetState extends State<SahihWidget> {
  final int number;
  final String name;
  final Color color;
  final double progress;

  SahihWidgetState(this.name, this.color, this.number, this.progress);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => (color != Colors.grey)
          ? Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProgressInBook(
                    color: color,
                    bookNumber: number,
                    progress: progress,
                  )))
          : null,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.16,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                (color != Colors.grey) ? Colors.transparent : Colors.grey,
                BlendMode.saturation,
              ),
              child: Image.asset(
                "images/$name.png",
                height: MediaQuery.of(context).size.height * 0.17,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              child: Transform.rotate(
                angle:  pi / 180 * 180,
                child: LiquidLinearProgressIndicator(
                  value: progress * 0.01,
                  valueColor: AlwaysStoppedAnimation((color != Colors.grey)
                      ? Colors.white.withOpacity(0.3)
                      : Colors.grey.shade800),
                  backgroundColor: color,
                  borderWidth: 0,
                  borderColor: color,
                  direction: Axis.horizontal,
                  center: Transform.rotate(
                    angle: pi / 180 * 180,
                    child: Text(
                      "${progress.toInt()}%",
                      style: TextStyle(
                          color: (progress == 100) ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            // LinearProgressIndicator(
            //   value: progress * 0.01,
            //   valueColor: AlwaysStoppedAnimation(
            //       (color != Colors.grey) ?
            //       // (progress == 100) ?
            //       color.withOpacity(0.8)
            //       // : color
            //       : Colors.grey.shade800),
            // ),
            const SizedBox(
              height: 14,
            )
          ],
        ),
      ),
    );
  }
}

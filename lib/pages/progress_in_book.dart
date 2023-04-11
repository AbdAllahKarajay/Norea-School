import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

import '../Theme/Colors.dart';
import '../Theme/Fonts.dart';
import '../widgets/choice_chip.dart';

class ProgressInBook extends StatefulWidget {
  final Color color;

  const ProgressInBook(
      {Key? key, required this.color, required this.bookNumber, required this.progress})
      : super(key: key);
  final int bookNumber;
  final double progress;

  @override
  State<ProgressInBook> createState() => _ProgressInBookState(color, progress);
}

class _ProgressInBookState extends State<ProgressInBook> {
  final Color color;
  Color currentColor = Colors.cyan;
  Color pickerColor = Colors.cyan;
  List<int> selectedPages = [];
  final List booksTomes = [1, 4, 9, 4, 4, 4, 4, 4];
  final double progress;

  _ProgressInBookState(this.color, this.progress);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: color),
            backgroundColor: color,
            centerTitle: true,
            title: Text("اسم الطالبة"),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 10, bottom: 10),
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    splashColor: color.withOpacity(0.5),
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('اختري لون'),
                              content: SingleChildScrollView(
                                child: BlockPicker(
                                  onColorChanged: (value) =>
                                      setState(() => pickerColor = value),
                                  pickerColor: pickerColor,
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll(
                                              AppColors.secondaryColor)),
                                  child: const Text('Got it'),
                                  onPressed: () {
                                    setState(
                                        () => currentColor = pickerColor);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            )),
                    child: Image.asset(
                      "images/colors.png",
                    ),
                  ))
            ],
          ),
          body: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              MyChoiceChips(count: booksTomes[widget.bookNumber], color: color),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.width * 0.036,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GridView.builder(
                      itemCount: 526,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing:
                            MediaQuery.of(context).size.height * 0.00,
                      ),
                      itemBuilder: (context, index) => SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                            width: MediaQuery.of(context).size.width * 0.01,
                            child: Center(
                              child: Stack(
                                children: [
                                  if(526 * progress/100 - index > 0)
                                  Center(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.099,
                                      decoration: BoxDecoration(
                                          color: currentColor.withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                  Center(
                                    child: Icon(
                                      FlutterIslamicIcons.quran2,
                                      size: MediaQuery.of(context).size.height *
                                          0.04,
                                      color: Colors.black.withOpacity(0.15),
                                    ),
                                  ),
                                  Center(
                                    child: Text((index + 1).toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            fontFamily: AppFonts.secondaryFont,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ],
                              ),
                            ),
                          )),
                ),
              ),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:norea_school_student/widgets/choice_chip.dart';

import '../Theme/Colors.dart';
import '../Theme/Fonts.dart';

class ProgressInBook extends StatefulWidget {
  const ProgressInBook({Key? key, required this.bookName, required this.bookNumber}) : super(key: key);
  final String bookName;
  final int bookNumber;

  @override
  State<ProgressInBook> createState() => _ProgressInBookState();
}

class _ProgressInBookState extends State<ProgressInBook> {
  Color currentColor = Colors.cyan;
  Color pickerColor = Colors.cyan;
  final List booksTomes = [1, 4, 9, 4 ,4 ,4 ,4];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.bookName),
          backgroundColor: AppColors.primaryColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.color_lens_rounded,
                    size: MediaQuery.of(context).size.height * 0.05),
                color: Colors.pinkAccent, onPressed: () => showDialog(context: context, builder: (context) => AlertDialog(
                    title: const Text('اختري لون'),
                    content: SingleChildScrollView(
                      child: BlockPicker(
                        onColorChanged: (value) => setState(() => pickerColor = value),
                        pickerColor: pickerColor,
                      ),
                    ),
                actions: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.secondaryColor)),
                    child: const Text('Got it'),
                    onPressed: () {
                      setState(() => currentColor = pickerColor);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
                  )),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            MyChoiceChips(count: booksTomes[widget.bookNumber]),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.secondaryColor.withOpacity(0.6),
                            AppColors.secondaryColor.withOpacity(0.4),
                            AppColors.secondaryColor.withOpacity(0.4),
                            AppColors.secondaryColor.withOpacity(0.6),

                          ]),
                      borderRadius: BorderRadius.circular(20)),
                  child: SingleChildScrollView(
                    child: GridView.builder(
                        itemCount: 526,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          mainAxisSpacing: MediaQuery.of(context).size.height * 0.00,
                        ),
                        itemBuilder: (context, index) => Container(
                          height: MediaQuery.of(context).size.height * 0.01,
                              width: MediaQuery.of(context).size.width * 0.01,
                              child: Center(
                                child: Stack(
                                  children: [
                                    Center(
                                      child: CircleAvatar(
                                        radius: MediaQuery.of(context).size.width * 0.04,
                                        backgroundColor: (index > 10 && index < 20 || index > 30  && index < 45)? currentColor.withOpacity(0.8) : Colors.transparent,
                                      ),
                                    ),
                                    Center(
                                      child: Icon(
                                        FlutterIslamicIcons.quran2,
                                        size: MediaQuery.of(context).size.height * 0.04,
                                        color: AppColors.primaryColor.withOpacity(0.35),
                                      ),
                                    ),
                                    Center(
                                      child: Text((index + 1).toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context).size.height * 0.025,
                                              fontFamily: AppFonts.secondaryFont,
                                              fontWeight: FontWeight.w600
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:norea_school_student/widgets/choice_chip.dart';

import '../Theme/Colors.dart';
import '../Theme/Fonts.dart';

class ProgressInBook extends StatelessWidget {
  ProgressInBook({Key? key, required this.bookName, required this.bookNumber}) : super(key: key);
  final String bookName;
  final int bookNumber;

  final List booksTomes = [1, 4, 9, 4 ,4 ,4 ,4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(bookName),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          MyChoiceChips(tomesCount: booksTomes[bookNumber]),
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
                          Colors.orangeAccent.shade200,
                          Colors.yellow.shade700,
                          Colors.yellow.shade700,
                          Colors.orangeAccent.shade200,
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
                                    child: Icon(
                                      FlutterIslamicIcons.quran2,
                                      size: MediaQuery.of(context).size.height * 0.04,
                                      color: Colors.white70.withOpacity(0.25),
                                    ),
                                  ),
                                  Center(
                                    child: Text((index + 1).toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context).size.height *
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
            ),
          ),
        ],
      ),
    );
  }
}

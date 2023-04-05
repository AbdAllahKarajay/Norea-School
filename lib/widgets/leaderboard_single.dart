import 'package:flutter/material.dart';
import 'package:norea_school_student/Theme/Colors.dart';

class LeaderBoardSingle extends StatelessWidget {
  const LeaderBoardSingle({Key? key, required this.color, required this.txt, required this.name, required this.avg, required this.height}) : super(key: key);

  final Color color;
  final String txt;
  final String name;
  final double avg;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.09),
              child: Container(
                height: MediaQuery.of(context).size.height * height,
                width: MediaQuery.of(context).size.height * 0.16,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.4),
                  border: Border.all(color: color, width: 3),
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(35), topLeft: Radius.circular(35))
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.029),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      if(txt == '1')
                      Image.asset(
                        'images/crown.png',
                        height: MediaQuery.of(context).size.height * 0.058,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.061),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: color, width: 3),
                            color: Colors.grey.shade300
                          ),
                          child: Icon(Icons.person_rounded, size: MediaQuery.of(context).size.height * 0.089, color: Colors.grey.shade500,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.145, left: MediaQuery.of(context).size.height * 0.035),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.03,
                          width: MediaQuery.of(context).size.height * 0.03,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: color
                          ),
                          child: Center(child: Text(txt, style: const TextStyle(color: Colors.white, ),),)
                        ),
                      )
                    ],
                  ),
                  Text(name, style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height * 0.03),),
                  Text('$avg', style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height * 0.03),),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

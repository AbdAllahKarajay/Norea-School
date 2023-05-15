import 'dart:async';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:norea_school_student/pages/personal_page.dart';
import '../Theme//Colors.dart';
import '../data/students.dart';
import '../models/student.dart';
import '../widgets/leaderboard_single.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  late List<Student> students;

  late ConfettiController _confettiController;

  bool fire = false;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController();
    students = List.of(stuData);
    _playConfetti();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _playConfetti() {
    if (fire == false) {
      _confettiController.play();
      Timer(const Duration(seconds: 1), () {
        _confettiController.stop();
        // fire = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      // backgroundColor: AppColors.secondaryColor.withOpacity(0.6),//Color.fromARGB(255, 243, 193, 84),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("الأوائل"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            height: 350,
            child: Stack(
              children: [
                ConfettiWidget(
                  confettiController: _confettiController,
                  shouldLoop: true,
                  // blastDirectionality: BlastDirectionality.explosive,
                  blastDirection: -1 / 3 * pi,
                  emissionFrequency: 0.5,
                  maxBlastForce: 100,
                  gravity: 0.1,
                ),
                ConfettiWidget(
                  confettiController: _confettiController,
                  shouldLoop: true,
                  blastDirection: -2 / 3 * pi,
                  emissionFrequency: 0.5,
                  maxBlastForce: 100,
                  gravity: 0.1,
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LeaderBoardSingle(
                      color: AppColors.bronze,
                      txt: '3',
                      name: students[2].name,
                      avg: students[2].avg,
                      height: 0.2),
                  LeaderBoardSingle(
                    color: AppColors.gold,
                    txt: '1',
                    name: students[0].name,
                    avg: students[0].avg,
                    height: 0.3,
                  ),
                  LeaderBoardSingle(
                    color: AppColors.silver,
                    txt: '2',
                    name: students[1].name,
                    avg: students[1].avg,
                    height: 0.25,
                  )
                ],
              ),
              Expanded(child: Container()),
              // const Divider(thickness: 1.5,),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(height: 1.5,
                  decoration: BoxDecoration(
                    // color: Colors.grey,
                    gradient: LinearGradient(colors: [
                      AppColors.bronze.withOpacity(0.5),
                      AppColors.gold.withOpacity(0.5),
                      AppColors.silver.withOpacity(0.5),
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      AppColors.bronze,
                      AppColors.gold,
                      AppColors.silver,
                    ]),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.6),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: ListTile(
                          splashColor: AppColors.primaryColor,
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              PersonalPage()
                          )),
                          title: const Text(
                            "اسم الطالبة",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text('3.6',
                                style: TextStyle(color: Colors.white),),
                              Spacer(
                                flex: 2,
                              ),
                              Text(
                                "البخاري",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          // leading: Container(
                          //   height: 45,
                          //   width: 45,
                          //   decoration: const BoxDecoration(
                          //     gradient: LinearGradient(
                          //         colors: [
                          //           AppColors.bronze,
                          //           AppColors.gold,
                          //           AppColors.silver,
                          //     ]),
                          //     borderRadius: BorderRadius.all(Radius.circular(25)),
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(3),
                          //     child: Container(
                          //       decoration: BoxDecoration(
                          //         color: Colors.white.withOpacity(0.15),
                          //         borderRadius: BorderRadius.all(Radius.circular(25)),
                          //       ),
                          //       child: const Center(child: Text("19", style: TextStyle(color: Colors.white, fontSize: 17),))),
                          //   )
                          // ),
                          // trailing: CircleAvatar(
                          //   radius: 22,
                          //   backgroundColor: Colors.white,
                          //   foregroundColor: Colors.grey,
                          //   child: Icon(
                          //     Icons.person_rounded,
                          //   ),
                          // ),
                          trailing: Container(
                            height: 70,
                            width: 50,
                            child: Stack(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          AppColors.bronze,
                                          AppColors.gold,
                                          AppColors.silver,
                                        ]),
                                    borderRadius: BorderRadius.all(Radius.circular(25)),
                                  ),
                                  child: const Center(
                                    child: CircleAvatar(
                                      radius: 22,
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.grey,
                                      child: Icon(
                                        Icons.person_rounded,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.03,
                                    width: MediaQuery.of(context).size.height * 0.03,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            AppColors.bronze,
                                            AppColors.gold,
                                            AppColors.silver,
                                          ]),
                                      shape: BoxShape.circle
                                    ),
                                    child: const Center(child: Text("19", style: TextStyle(color: Colors.white),))
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
            ],
          )
        ],
      ));
}

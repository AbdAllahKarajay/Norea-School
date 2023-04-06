import 'dart:async';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
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
      // backgroundColor: AppColors.secondaryColor,//Color.fromARGB(255, 243, 193, 84),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("الأوائل"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            height: 250,
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.2),
                      child: LeaderBoardSingle(
                          color: AppColors.bronze,
                          txt: '3',
                          name: students[2].name,
                          avg: students[2].avg,
                          height: 0.2),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _playConfetti();
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.2),
                        child: LeaderBoardSingle(
                          color: AppColors.gold,
                          txt: '1',
                          name: students[0].name,
                          avg: students[0].avg,
                          height: 0.3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.2),
                      child: LeaderBoardSingle(
                        color: AppColors.silver,
                        txt: '2',
                        name: students[1].name,
                        avg: students[1].avg,
                        height: 0.25,
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  "اسم الطالبة الفارشة",
                  textDirection: TextDirection.rtl,
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('3.6'),
                    Spacer(
                      flex: 2,
                    ),
                    Text(
                      "البخاري",
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                leading: const CircleAvatar(child: Text("19")),
                trailing: const CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.grey,
                  child: Icon(
                    Icons.person_rounded,
                  ),
                ),
              )
            ],
          )
        ],
      ));
}

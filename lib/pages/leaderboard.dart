import 'package:flutter/material.dart';
import '../Theme//Colors.dart';
import '../data/students.dart';
import '../models/student.dart';
import '../widgets/leaderboard_single.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  final gold = const Color.fromRGBO(255, 215, 0, 1);
  final silver = const Color.fromRGBO(192, 192, 192, 1);
  final bronze = const Color.fromRGBO(205, 127, 50, 1);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  late List<Student> students;

  @override
  void initState() {
    super.initState();
    students = List.of(stuData);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      // backgroundColor: AppColors.secondaryColor,//Color.fromARGB(255, 243, 193, 84),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("الأوائل"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
              child: LeaderBoardSingle(
                color: widget.bronze, txt: '3',
                name: students[2].name, avg: students[2].avg,
                height: 0.2
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
              child: LeaderBoardSingle(
                color: widget.gold, txt: '1',
                name: students[0].name, avg: students[0].avg,
                height: 0.3,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
              child: LeaderBoardSingle(
                color: widget.silver, txt: '2',
                name: students[1].name, avg: students[1].avg,
                height: 0.25,
              ),
            )
          ],
        ),
      )
  );
}

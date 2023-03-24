import 'package:flutter/material.dart';
import 'package:norea_school_student/models/Recitation.dart';
import '../Theme//Colors.dart';
import '../data/recitations.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  late List<Recitation> recitations;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();
    recitations = List.of(recData);
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("اسم الطالبة"),
          backgroundColor: AppColors.primaryColor,
        ),
        body: Placeholder()
      );

}
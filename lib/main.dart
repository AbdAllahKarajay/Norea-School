import 'dart:async';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:norea_school_student/Opening_Screen.dart';
import 'package:norea_school_student/pages/leaderboard.dart';
import 'package:norea_school_student/pages/progress_page.dart';
import 'package:norea_school_student/pages/recitations_page.dart';
import 'package:norea_school_student/pages/recitations_page_2.dart';
import 'package:norea_school_student/Theme/Colors.dart';
import 'package:norea_school_student/Theme/Fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Demo',
      theme: ThemeData(
        fontFamily: AppFonts.primaryFont,
      ),
      home: const Opening_Screen(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ConfettiController _confettiController;

  bool fire = false;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController();
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
        fire = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Scaffold(
            appBar: AppBar(
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor),
              centerTitle: true,
              title: const Text("اسم الطالبة"),
              backgroundColor: AppColors.primaryColor,
              actions: [
                IconButton(
                    icon: const Icon(Icons.leaderboard),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Leaderboard()))),
              ],
              leading: IconButton(
                  icon: const Icon(Icons.table_chart),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecitationsPage2()))),
            ),
            bottomNavigationBar: BottomAppBar(
              color: AppColors.secondaryColor,
              child: TabBar(
                indicatorPadding: const EdgeInsets.only(bottom: 46),
                indicatorColor: /*AppColors.secondaryColor,*/
                    AppColors.MainTitleColor,
                indicatorWeight: 2.4,
                labelColor: /*Colors.white,*/ AppColors.MainTitleColor,
                tabs: const [
                  Tab(text: 'تسميعاتي'),
                  Tab(text: 'المسار الكلي'),
                ],
                onTap: (int index) => _playConfetti(),
              ),
            ),
            body: const TabBarView(
              children: [RecitationsPage(), ProgressPage()],
            ),
          ),
          Positioned(
            left: -10,
            child: ConfettiWidget(
              confettiController: _confettiController,
              shouldLoop: true,
              // blastDirectionality: BlastDirectionality.explosive,
              blastDirection: -1 / 3 * pi,
              emissionFrequency: 0.5,
              maxBlastForce: 100,
              gravity: 0.1,
            ),
          ),
          Positioned(
            right: 10,
            child: ConfettiWidget(
              confettiController: _confettiController,
              shouldLoop: true,
              blastDirection: -2 / 3 * pi,
              emissionFrequency: 0.5,
              maxBlastForce: 100,
              gravity: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}

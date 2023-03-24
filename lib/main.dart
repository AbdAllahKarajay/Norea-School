import 'package:flutter/material.dart';
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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("اسم الطالبة"),
          backgroundColor: AppColors.primaryColor,
          actions: [
            IconButton(icon: const Icon(Icons.leaderboard),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Leaderboard()))
            ),
          ],
          leading: IconButton(icon: const Icon(Icons.table_chart),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>const RecitationsPage2()))
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: AppColors.secondaryColor,
          child: TabBar(
            indicatorPadding: const EdgeInsets.only(bottom:46),
            indicatorColor: AppColors.MainTitleColor,
            labelColor: AppColors.MainTitleColor,
            tabs: const [
              Tab(text: 'تسميعاتي'),
              Tab(text: 'المسار الكلي'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [RecitationsPage(), ProgressPage()],
        ),
      ),
    );
  }
}

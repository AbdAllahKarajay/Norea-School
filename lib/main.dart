import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:norea_school_student/Opening_Screen.dart';
import 'package:norea_school_student/pages/leaderboard.dart';
import 'package:norea_school_student/pages/progress_page.dart';
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
        home: Opening_Screen());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              CircleAvatar(
                child: Image.asset('null.png'),
              ),
            ],
            automaticallyImplyLeading: false,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor),
            centerTitle: true,
            title: const Text("اسم الطالبة"),
            backgroundColor: AppColors.primaryColor,
            // leading: IconButton(icon: const Icon(Icons.table_chart),
            //     onPressed: () => Navigator.push(context,
            //         MaterialPageRoute(builder: (context)=>const RecitationsPage2()))
            // ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Leaderboard())),
            child: const Icon(Icons.leaderboard),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Container(
            color: AppColors.secondaryColor.withOpacity(0.35),
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              color: AppColors.secondaryColor,
              child: TabBar(
                // indicatorPadding: const EdgeInsets.only(bottom: 46),
                indicatorColor: Colors.transparent, //AppColors.MainTitleColor,
                // indicatorSize: TabBarIndicatorSize.tab,
                // indicatorWeight: 2.4,
                labelColor: /*Colors.white,*/ AppColors.MainTitleColor,
                unselectedLabelColor: Colors.black54,
                // physics: NeverScrollableScrollPhysics(),
                tabs: const [
                  Tab(
                    text: 'تسميعاتي',
                  ), // icon: Icon(Icons.person_rounded), iconMargin: EdgeInsets.all(0)),
                  Tab(
                    text: 'المسار الكلي',
                  ) // icon: Icon(Icons.trending_up_rounded),  iconMargin: EdgeInsets.all(0)),
                ],
              ),
            ),
          ),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [RecitationsPage2(), ProgressPage()],
          ),
        ),
      ),
    );
  }
}

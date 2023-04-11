import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norea_school_student/Sahih_Screen/Presentation/sahih_select_screen.dart';
import 'package:norea_school_student/pages/Opening_Screen.dart';
import 'package:norea_school_student/pages/leaderboard.dart';
import 'package:norea_school_student/pages/personal_page.dart';
import 'package:norea_school_student/pages/recitations_page_2.dart';
import 'package:norea_school_student/Theme/Colors.dart';
import 'package:norea_school_student/Theme/Fonts.dart';

import 'Sahih_Screen/Logic/sahih_cubit.dart';
import 'Sahih_Screen/Logic/sahih_states.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // supportedLocales: const [
        //   Locale("ar"),
        // ],
        // locale:  const Locale("ar"),
        title: 'Student Demo',
        theme: ThemeData(
          fontFamily: AppFonts.primaryFont,
        ),
        home: const Opening_Screen());
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
              GestureDetector(
                onTap: () => Navigator.push(context,MaterialPageRoute(
                  builder: (context) => PersonalPage(),)),
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.06,
                  backgroundColor: Colors.grey.shade400,
                  child: Icon(Icons.person_rounded, color: Colors.grey.shade700, size: MediaQuery.of(context).size.width * 0.11,)// Image.asset('null.png'),
                ),
              ),
              const SizedBox(width: 10,),
            ],
            automaticallyImplyLeading: false,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor),
            centerTitle: true,
            title: const Text("اسم الطالبة", style: TextStyle(fontFamily: 'fonts/Sahel-VF.ttf'),),
            backgroundColor: AppColors.primaryColor,
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
                indicatorColor: Colors.transparent,
                labelColor: AppColors.MainTitleColor,
                unselectedLabelColor: Colors.black54,
                tabs: const [
                  Tab(
                    text: 'تسميعاتي',
                  ),
                  Tab(
                    text: 'المسار الكلي',
                  )
                ],
              ),
            ),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [const RecitationsPage2(), BlocProvider(create: (context)=>SahihCubit(SahihInitial()),child: const SahihScreen())],
          ),
        ),
      ),
    );
  }
}

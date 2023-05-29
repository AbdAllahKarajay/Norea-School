import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:norea_school_student/data/repos/remote_repos/remote_rec_repo.dart';

import 'package:norea_school_student/features/opening_screen/bloc/login_bloc.dart';
import 'package:norea_school_student/features/opening_screen/Opening_Screen.dart';
import 'package:norea_school_student/Theme/Fonts.dart';
import 'package:norea_school_student/features/recitations_page/bloc/rec_bloc.dart';

import 'data/repos/local_repos/local_rec_repo.dart';
import 'data/repos/local_repos/local_student_repo.dart';
import 'data/repos/remote_repos/remote_student_repo.dart';

import 'objectbox.g.dart';

void main() {
  setUpGetIT();
  runApp(const MyApp());
}

final getIt = GetIt.instance;

void setUpGetIT(){
  // final Store store = openStore();
  // getIt.registerSingleton<LocalStudentRepo>(LocalStudentRepo(store));
  // getIt.registerSingleton<LocalRecRepo>(LocalRecRepo(store));
  //TODO: set endpoints
  getIt.registerSingleton<RemoteStudentRepo>(RemoteStudentRepo(""));
  getIt.registerSingleton<RemoteRecRepo>(RemoteRecRepo(""));

  getIt.registerSingleton<LoginBloc>(LoginBloc());
  getIt.registerSingleton<RecBloc>(RecBloc());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        // supportedLocales: const [
        //   Locale("ar"),
        // ],
        // locale:  const Locale("ar"),
        title: 'Student Demo',
        theme: ThemeData(
          fontFamily: AppFonts.primaryFont,

        ),
        home: const OpeningScreen()
    );
  }
}

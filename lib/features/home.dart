import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norea_school_student/features/opening_screen/bloc/login_bloc.dart';

import 'package:norea_school_student/features/progress/Logic/sahih_cubit.dart';
import 'package:norea_school_student/features/progress/Presentation/sahih_select_screen.dart';
import 'package:norea_school_student/features/leaderboard/leaderboard.dart';
import 'package:norea_school_student/features/personal_page/personal_page.dart';
import 'package:norea_school_student/features/recitations_page/recitations_page_2.dart';
import 'package:norea_school_student/Theme/Colors.dart';

import '../data/models/student.dart';
import '../main.dart';


class TabCubit extends Cubit<bool> {
  TabCubit() : super(true);

  void tab(index) => emit((index==0)?true: false);
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final chipsController = ScrollController();
  final loginBloc = getIt.get<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: loginBloc,),
        BlocProvider(create: (_) => TabCubit()),
      ],
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: BlocBuilder<TabCubit, bool>(
                builder: (context, isFirst) {
                  if(!isFirst) return const Center();
                  return IconButton(
                    icon: const Icon(Icons.calendar_month),
                    onPressed: () => chipsController.animateTo(chipsController.offset == 0? 100:0, duration: const Duration(milliseconds: 1000), curve: Curves.ease),
                  );
                }
              ),
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
              systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor),
              centerTitle: true,
              title: BlocBuilder<LoginBloc, LoginState>(
                  builder:(context, state) {
                    final user = state.props[0] as Student;
                    return Text(user.name,
                      style: const TextStyle(fontFamily: 'fonts/Sahel-VF.ttf'));
                  }),
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
            bottomNavigationBar: BlocBuilder<TabCubit, bool>(
              builder: (context, isFirst){
                return Container(
                  color: (isFirst)? AppColors.secondaryColor.withOpacity(0.35): Colors.white,
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
                      onTap: (index) => context.read<TabCubit>().tab(index),
                    ),
                  ),
                );
              }
            ),
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                RecitationsPage2(chipsController: chipsController),
                BlocProvider(create: (context)=>SahihCubit(SahihInitial()),child: const SahihScreen())],
            ),
          ),
        ),
      ),
    );
  }
}
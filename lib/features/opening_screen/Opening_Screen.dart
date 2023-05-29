import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norea_school_student/Theme/Colors.dart';
import 'package:norea_school_student/Theme/Fonts.dart';

import '../../data/models/student.dart';
import '../../main.dart';
import '../home.dart';
import 'bloc/login_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({Key? key}) : super(key: key);

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  final loginBloc = getIt.get<LoginBloc>();

  @override
  void initState() {
    //TODO check user in local storage
    super.initState();
      EasyLoading.instance
        ..indicatorType = EasyLoadingIndicatorType.fadingCircle
        ..loadingStyle = EasyLoadingStyle.dark
        ..indicatorSize = 45.0
        ..radius = 10.0
        ..progressColor = Colors.yellow
        ..backgroundColor = Colors.green
        ..indicatorColor = Colors.yellow;
  }

  @override
  Widget build(BuildContext context) {
    String code = "";
    return BlocProvider.value(
      value: loginBloc,
      child: BlocListener(
        bloc: loginBloc,
        listener: (context, state) async {
          if(state is LoginLoadingState){
            await EasyLoading.show();
          }
          else if (state is LoginSuccessState) {
            // EasyLoading.dismiss();
            getIt.registerSingleton<Student>(state.user);
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return HomePage();
            }));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Color.fromARGB(200, 243, 193, 84)),
            //Color.fromARGB(255, 12, 205, 163).withOpacity(0.8)),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          body: Container(
            color: AppColors.primaryColor.withOpacity(0.9),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/png background.png"),
                fit: BoxFit.cover,
              )),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            "images/Logo.png",
                            fit: BoxFit.contain,
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.030,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 2, color: AppColors.secondaryColor)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextField(
                            style: const TextStyle(
                                color: AppColors.secondaryColor),
                            cursorColor: AppColors.secondaryColor,
                            //Color.fromARGB(255, 12, 205, 163),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'u3s5v2',
                              hintStyle: TextStyle(
                                  color: AppColors.secondaryColor
                                      .withOpacity(0.7)),
                            ),
                            onChanged: (value) => code = value,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.030,
                      ),
                      GestureDetector(
                          onTap: () => loginBloc.add(LoginRequestedEvent(code)),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color.fromARGB(255, 167, 133, 58),
                                      //Color.fromARGB(255, 12, 205, 163),
                                      Color.fromARGB(255, 243, 193, 84),
                                      //Color.fromARGB(255, 193, 252, 211),
                                      Color.fromARGB(255, 243, 193, 84),
                                      //Color.fromARGB(255, 193, 252, 211),
                                      Color.fromARGB(255, 167, 133, 58),
                                      //Color.fromARGB(255, 12, 205, 163),
                                    ])),
                            child: Center(
                                child: Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.03,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppFonts.primaryFont),
                            )),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

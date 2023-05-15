import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:norea_school_student/Theme/Colors.dart';
import 'package:norea_school_student/Theme/Fonts.dart';
import 'package:norea_school_student/main.dart';

class Opening_Screen extends StatefulWidget {
  const Opening_Screen({Key? key}) : super(key: key);

  @override
  State<Opening_Screen> createState() => _Opening_ScreenState();
}

class _Opening_ScreenState extends State<Opening_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(200, 243, 193, 84)),//Color.fromARGB(255, 12, 205, 163).withOpacity(0.8)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        color: AppColors.primaryColor.withOpacity(0.9),
        child: Container(
          // decoration: BoxDecoration(
          // // color: AppColors.primaryColor.withOpacity(1),
          //   gradient: RadialGradient(
          //     // begin: Alignment.bottomCenter,
          //     // end: Alignment.topCenter,
          //     center: FractionalOffset(0.5, 0.415),
          //       colors: [
          //     AppColors.secondaryColor.withOpacity(0.8),
          //     AppColors.secondaryColor.withOpacity(0.8),
          //     AppColors.secondaryColor.withOpacity(0.7),
          //     AppColors.secondaryColor.withOpacity(0.5),
          //     AppColors.secondaryColor.withOpacity(0.0),
          //     // Colors.white.withOpacity(0.2)
          //     // AppColors.secondaryColor.withOpacity(0.0),
          //     // AppColors.primaryColor.withOpacity(0.4),
          //   ])
          //
          // ),
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
                        width: MediaQuery.of(context).size.width ,
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
                          border: Border.all(width: 2,color: AppColors.secondaryColor//Color.fromARGB(255, 12, 205, 163)
                            )
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: TextField(
                          style: TextStyle(color: AppColors.secondaryColor//Color.fromARGB(255, 12, 205, 163)
                          ),
                          cursorColor: AppColors.secondaryColor, //Color.fromARGB(255, 12, 205, 163),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: AppColors.secondaryColor, fontWeight: FontWeight.bold),
                            hintText: 'u6a4b8',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.030,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage())),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 167, 133, 58),  //Color.fromARGB(255, 12, 205, 163),
                                  Color.fromARGB(255, 243, 193, 84), //Color.fromARGB(255, 193, 252, 211),
                                  Color.fromARGB(255, 243, 193, 84), //Color.fromARGB(255, 193, 252, 211),
                                  Color.fromARGB(255, 167, 133, 58),  //Color.fromARGB(255, 12, 205, 163),
                                ])),
                        child: Center(child: Text("تسجيل الدخول", style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFonts.primaryFont
                        ),)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

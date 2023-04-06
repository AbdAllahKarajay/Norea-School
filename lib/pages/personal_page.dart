import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Theme/Colors.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle:
        SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor),
        centerTitle: true,
        title: const Text("اسم الطالبة"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: AppColors.primaryColor.withOpacity(0.4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.34,
                    backgroundColor: Colors.grey.shade400,
                    child: Icon(Icons.person_rounded, color: Colors.grey.shade700, size: MediaQuery.of(context).size.width * 0.70,)// Image.asset('null.png'),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                    boxShadow: [BoxShadow(blurRadius: 2, spreadRadius: 0.3, color: Colors.black.withOpacity(0.8))]
                    // border: Border.all()
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Theme/Colors.dart';

class PersonalPage2 extends StatelessWidget {
  PersonalPage2({Key? key}) : super(key: key);
  final Map profileInfo = {
    'name': 'اسم الطالبة',
    'code': 'u6a4b8',
    'book': 'صحيح البخاري',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.primaryColor.withOpacity(1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.27,
                    backgroundColor: Colors.grey.shade400,
                    child: Icon(
                      Icons.person_rounded,
                      color: Colors.grey.shade700,
                      size: MediaQuery.of(context).size.width * 0.55,
                    ) // Image.asset('null.png'),
                    ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Center(
                  child: Text(
                    'اسم الطالبة',
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: MediaQuery.of(context).size.height * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Center(
                  child: Text(
                    'رمز التسجيل: u6a4b8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.024,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      border:
                          Border.all(color: AppColors.secondaryColor, width: 2)
                      // boxShadow: [
                      //   BoxShadow(
                      //       blurRadius: 2,
                      //       spreadRadius: 0.6,
                      //       color: AppColors.secondaryColor),
                      // ]
                      // border: Border.all()
                      ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('الكتاب'),
                          subtitle: Text(profileInfo['book']),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('emojis'),
                          subtitle: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return (index % 2 != 0)
                                        ? Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image.asset(
                                                'images/emoji.jpg',
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.07,
                                              ),
                                              Text('2023-4-1')
                                            ],
                                          );
                                  })),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('رسائل الشكر'),
                          subtitle: Container(
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.04),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 0.1),
                              ),
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: 15,
                                  itemBuilder: (context, index) => (index % 2 !=
                                          0)
                                      ? Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                            Text('2023-4-1'),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.1,
                                            ),
                                            Text('رسالة شكر ${index ~/ 2 + 1}'),
                                          ],
                                        )
                                      : SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                        ))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
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

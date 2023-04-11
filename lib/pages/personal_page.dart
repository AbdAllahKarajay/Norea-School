// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:norea_school_student/pages/personal_page2.dart';

import '../Theme/Colors.dart';

class PersonalPage extends StatelessWidget {
  PersonalPage({Key? key}) : super(key: key);
  final Map profileInfo = {
    'name': 'اسم الطالبة',
    'code': 'u6a4b8',
    'book': 'صحيح البخاري',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                  icon: Icon(Icons.sync_alt_outlined),
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonalPage2(),
                        ),
                      ))
            ],
            centerTitle: true,
            pinned: true,
            snap: true,
            floating: true,
            backgroundColor: AppColors.primaryColor,
            expandedHeight: MediaQuery.of(context).size.height * 0.355,
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.195,
                      backgroundColor: Colors.grey.shade400,
                      backgroundImage: AssetImage('images/person.jpg'),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.006),
                    Text(
                      'رمز التسجيل: u6a4b8',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                  ],
                ),
                centerTitle: true,
                title: Text(
                  "اسم الطالبة",
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: SliverList(
              delegate: SliverChildListDelegate([
                Card(
                  child: ListTile(
                    title: const Text('الكتاب'),
                    subtitle: Text(profileInfo['book']),
                  ),
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
                                      width: MediaQuery.of(context).size.width *
                                          0.03,
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
                Card(
                  child: ListTile(
                    title: const Text('رسائل الشكر'),
                    subtitle: Container(
                        margin: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.045),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.1),
                        ),
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 30,
                            itemBuilder: (context, index) => (index % 2 != 0)
                                ? Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                      ),
                                      Text(
                                        '2023-4-1',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                      ),
                                      Text(
                                        'رسالة شكر ${index ~/ 2 + 1}',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.03,
                                  ))),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

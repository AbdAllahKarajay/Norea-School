// ignore_for_file: prefer_const_constructors

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

import '../../Theme/Colors.dart';

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
            centerTitle: true,
            pinned: true,
            snap: true,
            floating: true,
            backgroundColor: AppColors.primaryColor,
            expandedHeight: MediaQuery.of(context).size.height * 0.34,
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04),
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.18,
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
                    subtitle: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.18,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return (index % 2 != 0)
                                  ? Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.03,
                                    )
                                  : Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 4),
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 220, 180, 220).withRed((index~/20)%2 > 0 ? 240- (index-(index~/20)*20)~/2*15: (index-(index~/20)*20)~/2*15+120),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              topRight: Radius.circular(25),
                                              bottomLeft: Radius.circular(25),
                                              // bottomRight: Radius.circular(20),
                                            )
                                      ),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(
                                              'images/emoji.png',
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.07,
                                            ),
                                            Text('2023-4-1',style: TextStyle(color: Colors.white.withOpacity(1), fontSize: 12))
                                          ],
                                        ),
                                    ),
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
                          image: DecorationImage(image: Image.asset("images/png background.png").image, repeat: ImageRepeat.repeatX,opacity: 0.7),
                          // color: AppColors.primaryColor.withOpacity(0.5),
                          // gradient: LinearGradient(
                          //   begin: Alignment.topCenter,
                          //   end: Alignment.bottomCenter,
                          //     colors: [
                          //       AppColors.primaryColor.withOpacity(0),
                          //       AppColors.primaryColor.withOpacity(0.5),
                          // ]),
                          border: Border.all(color: Colors.grey, width: 0.1),
                        ),
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 240,
                            itemBuilder: (context, index) => (index % 2 != 0)
                              ? Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 2),
                                    child: CustomPaint(
                                      painter: SpecialChatBubbleOne(
                                          color: Color.fromARGB(255, 220, 180, 220).withRed((index~/20)%2 > 0 ? 240- (index-(index~/20)*20)~/2*15: (index-(index~/20)*20)~/2*15+120),
                                          alignment: Alignment.topLeft,
                                          tail: true,),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context).size.width * .7,
                                        ),
                                        margin: EdgeInsets.fromLTRB(17, 7, 7, 2),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          textDirection: TextDirection.ltr,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(right: 4),
                                              constraints: BoxConstraints(
                                                maxWidth: MediaQuery.of(context).size.width * .55,
                                              ),
                                              child: Text(
                                                  "رسالة شكر ${index ~/ 2 + 1}",
                                                  style: TextStyle(color: Colors.white,),
                                                  textAlign: TextAlign.left,
                                                ),
                                            ),
                                            Container(
                                              constraints: BoxConstraints(
                                                maxWidth: MediaQuery.of(context).size.width * .15,
                                              ),
                                              child: Text(
                                                "2023/5/11",
                                                style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 10,),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ),
                                  ),
                              )
                                : SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.03,
                                  ))),
                  ),
                ),
                SizedBox(height: 50,),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

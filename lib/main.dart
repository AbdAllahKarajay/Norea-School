import 'package:flutter/material.dart';

import 'Theme/Colors.dart';
import 'Theme/Fonts.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map> recData = [{
    "inst_name": "اسم اللآنسة المسمعة",
    "pages":[10,11,12,13,14],
    "rate": "ممتاز",
    "NOM": 3,
    "date": "2023-3-22",
    "book": "صحيح مسلم",
    "tome": 1
  },
  {
  "inst_name": "اسم اللآنسة المسمعة 2",
  "pages": [15,16,17,18,19,20,21,22],
  "rate": "جيد جداً",
  "NOM": 4,
  "date": "2023-3-22",
  "book": "صحيح مسلم",
  "tome": 1
  },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("اسم الطالبة"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: ListView.builder(
        itemCount: recData.length*2,
          itemBuilder: (context, index){
            if(index % 2 == 1) {
              return Divider(color: AppColors.KashmirBlue, thickness: 2,);
            }
            return Column(

              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(recData[index~/2]["inst_name"]),
                    Text('عدد الصفحات:  ${recData[index ~/ 2]["pages"].length}'),
                    Text("${recData[index~/2]["book"]} ${recData[index~/2]["tome"]}"),
                  ],
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('التقدير:  ${recData[index ~/ 2]["rate"]}'),
                    Text('عدد الأخطاء:  ${recData[index ~/ 2]["NOM"]}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text('الصفحات:  ${recData[index ~/ 2]["pages"]}'),
                    Text(recData[index ~/ 2]["date"])
                  ],
                )
              ],
            );
          },
      )
    );
  }
}

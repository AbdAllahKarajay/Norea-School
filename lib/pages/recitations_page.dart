import 'package:flutter/material.dart';
import '../Theme/Colors.dart';
import '../data/recitations.dart';

class RecitationsPage extends StatefulWidget {
  const RecitationsPage({super.key});

  @override
  State<RecitationsPage> createState() => _RecitationsPageState();
}

class _RecitationsPageState extends State<RecitationsPage> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: recData.length*2,
        itemBuilder: (context, index) {
          if(index % 2 == 1) {
            return Divider(color: AppColors.KashmirBlue, thickness: 2,);
          }
          return Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(recData[index~/2].instName),
                  Text('عدد الصفحات:  ${recData[index ~/ 2].pages.length}'),
                  Text("${recData[index~/2].book} ${recData[index~/2].tome}"),
                ],
              ),
              Text('الصفحات:  ${recData[index ~/ 2].pages.join("-")}'),
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('%التقدير:  ${recData[index ~/ 2].rate}',
                    style: TextStyle(color: Color.fromARGB(200, 300 - (recData[index ~/ 2].rate*3), 100 + (recData[index ~/ 2].rate), 0)),),
                  Text('عدد الأخطاء:  ${recData[index ~/ 2].NOM}'),
                ],
              ),
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(recData[index ~/ 2].date),
                  Text("الوقت: ${recData[index~/2].time}")
                ],
              )
            ],
          );
        },
      );
  }
}
import 'package:flutter/material.dart';
import '../Theme//Colors.dart';
import '../data/students.dart';
import '../models/student.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  late List<Student> students;

  @override
  void initState() {
    super.initState();
    students = List.of(stuData);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("الأوائل"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: ListView.builder(
        itemCount: students.length+1,
          itemBuilder: (context, index){
            if(index == 0){
              return  Card(
                color: AppColors.Opal,
                child: const Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    leading: Text("الترتيب"),
                    title: Text("الاسم"),
                    trailing: Text("المعدل اليومي للتسميع"),
                  ),
                ),
              );
            }
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Card(
                color: index==1?
                const Color.fromRGBO(255, 215, 0, 0.5)
                    :(index ==2)? const Color.fromRGBO(192, 192, 192, 0.5)
                    :(index == 3)? const Color.fromRGBO(205, 127, 50, 0.4):
                AppColors.Pampas,
                child: ListTile(
                  leading: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.2),
                        borderRadius: BorderRadius.circular((10)),
                        color: index==1?
                        const Color.fromRGBO(255, 215, 0, 1)
                            :(index ==2)? const Color.fromRGBO(192, 192, 192, 1)
                            :(index == 3)? const Color.fromRGBO(205, 127, 50, 0.8):
                        Colors.transparent
                    ),
                    child: Center(child: Text("$index")),
                  ),
                  title:  Text(students[index-1].name),
                  trailing: Text("${students[index-1].avg}"),
                )
              ),
            );
      }
    )
  );
}

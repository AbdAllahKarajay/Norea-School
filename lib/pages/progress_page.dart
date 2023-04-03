import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import '../Theme/Colors.dart';
import 'progress_in_book.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  List books = [
    "رياض الصالحين",
    "صحيح البخاري",
    "صحيح مسلم",
    "النسائي",
    "الترمذي",
    "مسند الامام احمد",
    "ابن ماجه"
  ];
  List booksProgress = [100, 60, 100, 30, 75, 40, 0];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [
            AppColors.primaryColor.withOpacity(0.5),
            AppColors.secondaryColor.withOpacity(0.35),
            // AppColors.primaryColor.withOpacity(0.6),
          ])),
      child: GridView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProgressInBook(bookName: books[index], bookNumber: index))),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                color: AppColors.Pampas,
                shadowColor: AppColors.Laurel,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      books[index],
                      style: TextStyle(color: AppColors.KashmirBlue),
                    ),
                    Container(
                      width: double.infinity,
                      height: 18,
                      // padding: const  EdgeInsets.symmetric(horizontal: 8.0),
                      child: LiquidLinearProgressIndicator(
                        value: booksProgress[index]/100,
                        valueColor: AlwaysStoppedAnimation(
                            AppColors.Downy
                            // AppColors.primaryColor.withOpacity(0.7)
                        ),
                        backgroundColor: AppColors.Pampas,
                        borderColor: AppColors.Pampas,
                        borderWidth: 0.0,
                        direction: Axis.horizontal,
                        center: Text("${booksProgress[index]}%", style: const
                        TextStyle(color: Colors.white),),
                      ),
                    ),
                    // Column(
                    //   children: [
                    //     Text("${booksProgress[index]}%",style: TextStyle(color: AppColors.Downy),),
                    //     LinearProgressIndicator(
                    //       value: booksProgress[index]/100,
                    //       valueColor: AlwaysStoppedAnimation(AppColors.Downy),
                    //       backgroundColor: const Color.fromARGB(80, 109, 202, 173)
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          );
        },
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:norea_school_student/Theme/Colors.dart';
import 'package:norea_school_student/models/Recitation.dart';
import '../data/recitations.dart';
import '../widgets/results_chips.dart';

class RecitationsPage2 extends StatefulWidget {
  const RecitationsPage2({super.key});

  @override
  State<RecitationsPage2> createState() => _RecitationsPage2State();
}

class _RecitationsPage2State extends State<RecitationsPage2> {
  late List<Recitation> recitations;
  int? sortColumnIndex;
  bool isAscending = false;
  bool isDay = false;


  @override
  void initState() {
    super.initState();
    recitations = List.of(recData);
  }

  @override
  Widget build(BuildContext context) =>
        Container(
          decoration: BoxDecoration(gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [
                AppColors.primaryColor.withOpacity(0.5),
                AppColors.secondaryColor.withOpacity(0.35),
              ])),
          child: ListView(
            children:[
              // Container(
                // color: AppColors.primaryColor.withOpacity(0.5),
                  // child:
                  ResultChips(notifyParent: refresh),
              // ),
              SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  // child: Container(
                  //     decoration: BoxDecoration(gradient: LinearGradient(
                  //         begin: AlignmentDirectional.topCenter,
                  //         end: AlignmentDirectional.bottomCenter,
                  //         colors: [
                  //           AppColors.primaryColor.withOpacity(0.5),
                  //           AppColors.secondaryColor.withOpacity(0.35),
                  //           // AppColors.primaryColor.withOpacity(0.6),
                  //         ])),
                      child: buildDataTable())
              // ),
            ]
      ),
        );

  Widget buildDataTable() {
    final List<Widget> myColumns = const [
      Text('التاريخ'),
      Text('اسم الآنسة'),
      Text('الصفحات'),
      Icon(Icons.bookmark, color: Colors.red,),
      Icon(Icons.error_rounded),
      Icon(Icons.timelapse_rounded, color: Colors.transparent,),
      Icon(Icons.timelapse_rounded),
      Icon(Icons.my_library_books_rounded)
    ].reversed.toList();

    return DataTable(
      border: TableBorder(
          verticalInside: BorderSide(color: AppColors.Laurel),
          left: BorderSide(color: AppColors.Laurel),
          right: BorderSide(color: AppColors.Laurel),
          // bottom: BorderSide(color: AppColors.Laurel),
      ),

      columnSpacing: 20,
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(myColumns.getRange(0,isDay? 7: 8).toList()),
      rows: getRows(recitations),
    );
  }

  List<DataColumn> getColumns(List<Widget> columns) {
    return columns
      .map((column) => DataColumn(
    label: column,
    onSort: onSort,
  )).toList();
  }

  List<DataRow> getRows(List<Recitation> recitations) {
    int totalPages = 0;
    int totalTime = 0;

    List<DataRow> rowsList = recitations.map((Recitation recitation) {
    final List<DataCell> cells = [
      DataCell(Text('${recitation.pages.length}')),
      DataCell(Text('${recitation.time}')),
      DataCell(Icon(Icons.star, color: AppColors.gold,)),
      DataCell(Text('${recitation.NOM}')),
      DataCell(Text('${recitation.rate}')),
      DataCell(Text(recitation.pages.join(","))),
      DataCell(Text(recitation.instName)),
      DataCell(Text(recitation.date)),
    ].getRange(0, isDay? 7: 8).toList();

    totalPages += recitation.pages.length;
    totalTime += recitation.time;

    return DataRow(cells: cells);
  }).toList();

    final lastRowCells = [
      DataCell(Text('$totalPages')),
      DataCell(Text('$totalTime')),
      const DataCell(Text(' -- ')),
      const DataCell(Text(' -- ')),
      const DataCell(Text(' -- ')),
      const DataCell(Text(' -- ')),
      const DataCell(Text(' -- ')),
      const DataCell(Text(' -- ')),
    ].getRange(0, isDay? 7: 8).toList();

    final lastRow = DataRow(
      color: MaterialStateColor.resolveWith((states) {
        return Colors.red.withOpacity(0.3);
      }),
      cells: lastRowCells,
    );
    rowsList.add(lastRow);
    return rowsList;
  }

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();


  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 7) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.date, rec2.date));
    } else if (columnIndex == 6) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.instName, rec2.instName));
    } else if (columnIndex == 5) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.pages.first, rec2.pages.first));
    } else if (columnIndex == 4) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.rate, rec2.rate));
    } else if (columnIndex == 3) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.NOM, rec2.NOM));
    } else if (columnIndex == 1) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.time, rec2.time));
    }else if (columnIndex == 0) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.pages.length, rec2.pages.length));

    }

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareSame(bool ascending, dynamic value1, dynamic value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  refresh(isRes, isDay) {
    setState(() {
      sortColumnIndex = 0;
      this.isDay = isDay;
    });
  }

}
import 'package:flutter/material.dart';
import 'package:norea_school_student/models/Recitation.dart';
import '../Theme/Colors.dart';
import '../data/recitations.dart';

class RecitationsPage2 extends StatefulWidget {
  const RecitationsPage2({super.key});

  @override
  State<RecitationsPage2> createState() => _RecitationsPage2State();
}

class _RecitationsPage2State extends State<RecitationsPage2> {
  late List<Recitation> recitations;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();
    recitations = List.of(recData);
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("اسم الطالبة"),
          backgroundColor: AppColors.primaryColor,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: buildDataTable(),
          ),
        ),
      );

  Widget buildDataTable() {
    final columns = ['اسم الآنسة', 'عدد الصفحات', 'التاريخ', 'الأصل', 'المجلد', 'الصفحات', 'التقدير', 'عدد الأخطاء', 'الزمن'];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(recitations),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
    label: Text(column),
    onSort: onSort,
  ))
      .toList();

  List<DataRow> getRows(List<Recitation> recitations) => recitations.map((Recitation recitation) {
    final cells = [
      recitation.instName, recitation.pages.length,  recitation.date,
      recitation.book, recitation.tome, recitation.pages,
      recitation.rate, recitation.NOM, recitation.time,
    ];

    return DataRow(cells: getCells(cells));
  }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();


  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.instName, rec2.instName));
    } else if (columnIndex == 1) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.pages.length, rec2.pages.length));
    } else if (columnIndex == 2) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.date, rec2.date));
    } else if (columnIndex == 3) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.book, rec2.book));
    } else if (columnIndex == 4) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.tome, rec2.tome));
    } else if (columnIndex == 5) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.pages.first, rec2.pages.first));
    }else if (columnIndex == 6) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.rate, rec2.rate));
    }else if (columnIndex == 7) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.NOM, rec2.NOM));
    }else if (columnIndex == 8) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.time, rec2.time));

    }

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareSame(bool ascending, dynamic value1, dynamic value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
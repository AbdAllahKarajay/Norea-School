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
  bool isRes = false;


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
                // AppColors.primaryColor.withOpacity(0.6),
              ])),
          child: ListView(
            children:[
              ResultChips(notifyParent: refresh),
              SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: buildDataTable()
              ),
            ]
      ),
        );

  Widget buildDataTable() {
    final List<Widget> myColumns = const [
      Text('اسم الآنسة'),
      Text('التاريخ'),
      Text('الصفحات'),
      Icon(Icons.star_rate_rounded),
      Icon(Icons.error_rounded),
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
      columns: getColumns(myColumns.getRange(0, isRes? 2: 7).toList()),
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

  List<DataRow> getRows(List<Recitation> recitations) => recitations.map((Recitation recitation) {
    final cells = [
      recitation.pages.length,
      recitation.time,
      recitation.NOM,
      recitation.rate,
      recitation.pages.join(","),
      recitation.date,
      recitation.instName,
    ].getRange(0, isRes? 2: 7).toList();

    return DataRow(cells: getCells(cells));
  }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();


  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 6) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.instName, rec2.instName));
    } else if (columnIndex == 5) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.date, rec2.date));
    } else if (columnIndex == 4) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.pages.first, rec2.pages.first));
    } else if (columnIndex == 3) {
      recitations.sort((rec1, rec2) =>
          compareSame(ascending, rec1.rate, rec2.rate));
    } else if (columnIndex == 2) {
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

  refresh(isRes) {
    setState(() {
      sortColumnIndex = 0;
      this.isRes = isRes;
    });
  }

}
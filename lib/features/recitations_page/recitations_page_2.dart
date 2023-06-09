import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norea_school_student/Theme/Colors.dart';
import 'package:norea_school_student/data/models/recitation.dart';
import 'package:norea_school_student/data/repos/remote_repos/remote_rec_repo.dart';
import 'package:norea_school_student/features/recitations_page/bloc/rec_bloc.dart';
import 'package:norea_school_student/main.dart';
import '../../widgets/results_chips.dart';
import 'bloc/filter_enum.dart';

class RecitationsPage2 extends StatefulWidget {
  const RecitationsPage2({super.key, required this.chipsController});
  final ScrollController chipsController;

  @override
  State<RecitationsPage2> createState() => _RecitationsPage2State();
}

class _RecitationsPage2State extends State<RecitationsPage2> {
  List<Recitation> get recitations => recBloc.state.recs;
  final recBloc = getIt.get<RecBloc>();
  bool get isDay => recBloc.state.filter.index == 0;
  final remoteRepo = getIt.get<RemoteRecRepo>();

  @override
  Future<void> initState() async {
    super.initState();
    final recs = await remoteRepo.getUsersRecs(0);
    recBloc.emit(recBloc.state.copyWith(recs: recs));
    recBloc.add(RecFiltering(Filter.day));
  }

  @override
  Widget build(BuildContext context) =>
        BlocProvider.value(
          value: recBloc,
          child: Container(
            decoration: BoxDecoration(gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [
                  AppColors.primaryColor.withOpacity(0.5),
                  AppColors.secondaryColor.withOpacity(0.35),
                ])),
            child: ListView(
            controller: widget.chipsController,
            physics: const NeverScrollableScrollPhysics(),
              children:[
                const ResultChips(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: SingleChildScrollView(
                    child: SingleChildScrollView(
                          // physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                            child: buildDataTable(context)
                      ),
                  ),
                ),
              ]
            ),
          ),
        );

  Widget buildDataTable(BuildContext context) {
    final List<Widget> myColumns = const [
      Text('التاريخ'),
      Text('اسم الآنسة'),
      Text('الصفحات'),
      Icon(Icons.bookmark, color: Colors.red,),
      Icon(Icons.error_rounded),
      Icon(Icons.timelapse_rounded, color: Colors.transparent,),
      Icon(Icons.timelapse_rounded),
      Icon(Icons.my_library_books_rounded)
    ].reversed.map((e) => Center(child: e,)).toList();

    return BlocBuilder<RecBloc, RecState>(
      builder: (context,state) {
        return DataTable(
          border: const TableBorder(
              verticalInside: BorderSide(color: AppColors.Laurel),
              left: BorderSide(color: AppColors.Laurel),
              right: BorderSide(color: AppColors.Laurel),
              // bottom: BorderSide(color: AppColors.Laurel),
          ),

          columnSpacing: 20,
          sortAscending: recBloc.state.isAscending,
          sortColumnIndex: recBloc.state.sortingColumn,
          columns: getColumns(myColumns.getRange(0,isDay? 7: 8).toList()),
          rows: getRows(recitations),
        );
      }
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
      Text('${recitation.pages.length}'),
      Text('${recitation.time}'),
      const Icon(Icons.star, color: AppColors.gold,),
      Text('${recitation.NOM}'),
      Text('${recitation.rate}'),
      Text(recitation.pages.join(",")),
      Text(recitation.instName),
      Text(recitation.date),
    ].getRange(0, isDay? 7: 8).map((e) => DataCell(Center(child: e,))).toList();

    totalPages += recitation.pages.length;
    totalTime += recitation.time;

    return DataRow(cells: cells);
  }).toList();

    var lastRowCells = [
      Text('$totalPages'),
      Text('$totalTime'),
      const Text(' -- '),
      const Text(' -- '),
      const Text(' -- '),
      const Text(' -- '),
      const Text(' -- '),
      const Text(' -- '),
    ].getRange(0, isDay? 7: 8).map((e) => DataCell(Center(child: e,))).toList();

    var lastRow = DataRow(
      color: MaterialStateColor.resolveWith((states) {
        return Colors.red.withOpacity(0.3);
      }),
      cells: lastRowCells,
    );
    rowsList.add(lastRow);

    lastRowCells = [
      const Text(''),
      const Text(''),
      const Text(''),
      const Text(''),
      const Text(''),
      const Text(''),
      const Text(''),
      const Text(''),
    ].getRange(0, isDay? 7: 8).map((e) => DataCell(Center(child: e,))).toList();

    lastRow = DataRow(
      color: MaterialStateColor.resolveWith((states) {
        return Colors.red.withOpacity(0.3);
      }),
      cells: lastRowCells,
    );
    rowsList.add(lastRow);
    return rowsList;
  }


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

    recBloc.add(RecSorting(columnIndex, ascending));
  }

  int compareSame(bool ascending, dynamic value1, dynamic value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

}
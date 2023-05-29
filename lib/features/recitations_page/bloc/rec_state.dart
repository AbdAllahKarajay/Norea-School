import 'package:equatable/equatable.dart';
import 'package:norea_school_student/data/models/recitation.dart';

import 'filter_enum.dart';

class RecState extends Equatable {
  final Filter filter;
  final int sortingColumn;
  final bool isAscending;
  final List<Recitation> recs;

  const RecState(
      {required this.filter,
      required this.sortingColumn,
      required this.isAscending,
      required this.recs});

  @override
  List<Object?> get props => [filter, sortingColumn, isAscending];

  RecState copyWith(
      {Filter? filter,
      int? sortingColumn,
      bool? isAscending,
      List<Recitation>? recs}) {
    return RecState(
        filter: filter ?? this.filter,
        sortingColumn: sortingColumn ?? this.sortingColumn,
        isAscending: isAscending ?? this.isAscending,
        recs: recs ?? this.recs);
  }
}

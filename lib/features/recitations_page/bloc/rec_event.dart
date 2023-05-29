import 'filter_enum.dart';

abstract class RecEvent{}

class RecFiltering extends RecEvent{
  final Filter filter;
  RecFiltering(this.filter);
}

class RecSorting extends RecEvent{
  final int column;
  final bool isAscending;
  RecSorting(this.column, this.isAscending);
}
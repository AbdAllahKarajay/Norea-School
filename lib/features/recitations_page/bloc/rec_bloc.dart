import 'package:bloc/bloc.dart';
import 'package:norea_school_student/data/models/recitation.dart';
import 'package:norea_school_student/data/repos/local_repos/local_rec_repo.dart';
import 'package:norea_school_student/data/repos/remote_repos/remote_rec_repo.dart';
import 'filter_enum.dart';
import 'rec_event.dart';
import 'rec_state.dart';
export 'rec_event.dart';
export 'rec_state.dart';

import 'package:norea_school_student/main.dart';


class RecBloc extends Bloc<RecEvent, RecState> {
  final localRepo = getIt.get<LocalRecRepo>();
  RecBloc() : super(const RecState(filter: Filter.day,sortingColumn:  0,isAscending: true, recs: [])){
    on<RecFiltering>( (event,emit){
      List<Recitation> recs = localRepo.getWithFilter(event.filter);
      emit(state.copyWith(filter: event.filter, recs: recs));
    });
    on<RecSorting>((event,emit){
      emit(state.copyWith(sortingColumn: event.column, isAscending: event.isAscending));
    });
  }
}
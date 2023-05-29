import 'package:norea_school_student/data/models/recitation.dart';
import 'package:norea_school_student/data/repos/remote_repos/remote_base_repo.dart';

import '../../../features/recitations_page/bloc/filter_enum.dart';

class RemoteRecRepo extends RemoteBaseRepo<Recitation>{
  RemoteRecRepo(super.endPoint);

  Future<List<Recitation>> getUsersRecs(int id) async{
    //Post res: List<rec>
    return [];
  }
  // getWithFilter(Filter filter){
  //   //TODO: filter request
  //   switch(filter){
  //     case Filter.day:
  //       break;
  //     case Filter.all:
  //       break;
  //     case Filter.week:
  //       break;
  //     case Filter.month:
  //       break;
  //     case Filter.season:
  //       break;
  //   }
  // }
}
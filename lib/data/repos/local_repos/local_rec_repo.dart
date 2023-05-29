import '../../../features/recitations_page/bloc/filter_enum.dart';
import '../../models/recitation.dart';
import 'local_base_repo.dart';

class LocalRecRepo extends LocalBaseRepo<Recitation>{
  LocalRecRepo(super.store);
  getWithFilter(Filter filter){
    //TODO: filter request
    switch(filter){
      case Filter.day:
        break;
      case Filter.all:
        break;
      case Filter.week:
        break;
      case Filter.month:
        break;
      case Filter.season:
        break;
    }
  }
}
import 'package:objectbox/objectbox.dart';
import '../base_repo.dart';

abstract class LocalBaseRepo<T> implements BaseRepo<T>{
  late final Box<T> box;
  final Store store;
  LocalBaseRepo(this.store);


  Future init() async {
    box = Box<T>(store);
  }

  @override
  T? getById(int id) {
      return box.get(id);
  }

  @override
  List<T> getAll() {
    return box.getAll();
  }

  int save(T object) {
    return box.put(object);
  }

  void clear() {
    box.removeAll();
  }

}
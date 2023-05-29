abstract class BaseRepo<T>{
  T? getById(int id);

  List<T> getAll();
}

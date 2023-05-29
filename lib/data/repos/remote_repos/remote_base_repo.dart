import '../base_repo.dart';

abstract class RemoteBaseRepo<T> implements BaseRepo<T>{
  final String ip = "";
  final String endPoint;

  RemoteBaseRepo(this.endPoint);

  //TODO requests
  @override
  T? getById(int id) {
    return null;
  }

  @override
  List<T> getAll() {
    return [];
  }
}
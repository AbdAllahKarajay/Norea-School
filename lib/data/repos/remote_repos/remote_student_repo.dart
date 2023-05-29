import 'package:norea_school_student/data/models/student.dart';
import 'package:norea_school_student/data/repos/remote_repos/remote_base_repo.dart';

class RemoteStudentRepo extends RemoteBaseRepo<Student>{
  RemoteStudentRepo(super.endPoint);
  //remote
  //getById & getAll has no use
  Student? login(String code){
    final url = "${super.ip}/Api/login}";
    //Post res:token
    return null;
  }


  List<Student> getTopThree(){
    final url = "${super.ip}/${super.endPoint}/GetBestStudent";
    //post res:list<Map>
    //TODO request
    return [];
  }
}
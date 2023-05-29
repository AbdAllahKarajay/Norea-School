import 'package:norea_school_student/data/models/student.dart';

import '../../../../objectbox.g.dart';
import 'local_base_repo.dart';

class LocalStudentRepo extends LocalBaseRepo<Student>{
  LocalStudentRepo(super.store);
  //local
  //getAll has no use
  //use clear then save when updating after getting from remote
  List<Student> getTopThree() {
    Query<Student> query = box.query(Student_.isUser.equals(false)).build();
    return query.find();
  }

  Student? getUser(){
    Query<Student> query = box.query(Student_.isUser.equals(true)).build();
    return query.find().first;
  }
}
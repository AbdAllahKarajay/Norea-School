import 'package:objectbox/objectbox.dart';

@Entity()
class Student{
  @Id()
  int id;
  final bool isUser;
  final String name;
  final double avg;
  final int pLW;


  Student(this.name, this.avg, this.pLW, {this.id = 0, this.isUser = false});
}
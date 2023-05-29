import 'package:objectbox/objectbox.dart';


@Entity()
class Recitation{
  @Id()
  int id;
  final String instName;
  final String date;
  final String book;
  final int tome;
  @Property(type: PropertyType.byteVector)
  final List<int> pages;
  final int rate;
  final int NOM;
  final int time;

  Recitation(
      {this.id = 0,
      required this.instName,
      required this.date,
      required this.book,
      required this.tome,
      required this.pages,
      required this.rate,
      required this.NOM,
      required this.time});

  Recitation.auto(
      this.instName,
      this.date,
      this.book,
      this.tome,
      this.pages,
      this.rate,
      this.NOM,
      this.time,
     {this.id = 0}
      );
}

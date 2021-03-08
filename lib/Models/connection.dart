import 'package:plume/Models/teacher.dart';

class Connection{
  String id;
  String studentAns;
  Teacher teacher;

  Connection({this.id, this.studentAns, this.teacher});

  factory Connection.fromJson(Map json)
  {
    return Connection(
      id: json['_id'],
      studentAns: json['studentAns'],
      teacher: Teacher.fromJsonSimple(json['teacher'])
    );
  }
}
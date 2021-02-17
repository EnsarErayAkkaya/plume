import 'package:plume/Models/assignment.dart';

class Subject{
  String id;
  String name;
  String teacher;
  List<String> students;
  List<Assignment> assignments;

  Subject({this.id, this.name, this.students, this.teacher, this.assignments});

  factory Subject.fromJson(Map json)
  {
    //print(json);
    Iterable students = json['students'];
    List<String> list = students.map(
            (e) => e.toString()
    ).toList();

    Iterable assignmentIterable = json['assignments'];
    List<Assignment> assignmentList = assignmentIterable.map(
            (e) => Assignment.fromJson(e)
    ).toList();

    return Subject(
      id: json['id'],
      name: json['name'],
      students: list,
      teacher: json['teacher'],
      assignments: assignmentList
    );
  }
  void printData()
  {
    print("subject");
    print(name);
  }
}
import 'package:plume/Models/connection.dart';
import 'package:plume/Models/subject.dart';
import 'package:plume/Models/teacher.dart';

class Student{
  String email;
  String name;
  String surname;
  String id;
  List<Connection> teachers;
  List<Subject> subjects;

  Student({this.name,this.surname,this.email,this.id, this.teachers,this.subjects});
  Student.simple({this.name,this.surname,this.email,this.id});

  factory Student.fromJson(Map json)
  {
    Iterable subjectsList = json['subjects'];
    List<Subject> subjects = subjectsList.map((i) =>
        Subject.fromJson(i)).toList();

    Iterable teachersList = json['teachers'];
    List<Connection> teachers = teachersList.map((i) =>
        Connection.fromJson(i)).toList();

    return Student(
      name:json['name'],
      surname:json['surname'],
      email:json['email'],
      id:json['_id'],
      teachers: teachers,
      subjects: subjects
    );
  }
  factory Student.fromJsonSimple(Map json)
  {
    return Student.simple(
      name:json['name'],
      surname:json['surname'],
      email:json['email'],
      id:json['_id']
    );
  }
  void printData(){
    print('student');
    print(name);
    print(surname);
  }
}
import 'package:plume/Models/teacher.dart';

class Student{
  String email;
  String name;
  String surname;
  String id;
  List<Teacher> teachers;

  Student({this.name,this.surname,this.email,this.id, this.teachers});
  Student.simple({this.name,this.surname,this.email,this.id});

  factory Student.fromJson(Map json)
  {
    Iterable list = json['subjects'];

    List<Teacher> teachers = list.map((i) =>
        Teacher.fromJson(i)).toList();

    return Student(
      name:json['name'],
      surname:json['surname'],
      email:json['email'],
      id:json['_id'],
      teachers: teachers,
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
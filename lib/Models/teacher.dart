import 'package:plume/Models/student.dart';
import 'package:plume/Models/subject.dart';

class Teacher{
  String email;
  String name;
  String surname;
  String id;
  List<Subject> subjects;
  List<Student> students;

  Teacher({this.name,this.surname,this.email,this.id, this.subjects, this.students});
  Teacher.simple({this.name,this.surname,this.email,this.id});

  factory Teacher.fromJson(Map json)
  {
    Iterable subjectList = json['subjects'];

    List<Subject> subjects = subjectList.map((i) =>
        Subject.fromJson(i)).toList();

    Iterable studentList = json['students'];

    List<Student> students = studentList.map((i) =>
        Student.fromJsonSimple(i)).toList();

    return Teacher(
      name:json['name'],
      surname:json['surname'],
      email:json['email'],
      id:json['_id'],
      subjects: subjects,
      students: students
    );
  }
  factory Teacher.fromJsonSimple(Map json){
    return Teacher.simple(
        name:json['name'],
        surname:json['surname'],
        email:json['email'],
        id:json['_id']
    );
  }
  void printData()
  {
    print("teacher");
    print(name);
    print(surname);
    print(email);
    subjects.forEach((element) {element.printData();});
    students.forEach((element) {element.printData();});
  }
}
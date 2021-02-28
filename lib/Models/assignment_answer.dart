import 'package:plume/Models/student.dart';

class AssignmentAnswer{
  String id;
  String studentId;
  String file;
  int mark;
  String markDescription;
  bool checked;

  AssignmentAnswer({this.id, this.studentId, this.file, this.mark, this.markDescription, this.checked});

  factory AssignmentAnswer.fromJson(Map json){
    return AssignmentAnswer(
      id: json['id'],
      studentId: json['student'],
      file: json['file'],
      mark: int.parse(json['mark']),
      markDescription:  json['markDescription'],
      checked: json['checked']
    );
  }


}
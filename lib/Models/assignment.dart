import 'package:plume/Models/assignment_answer.dart';
import 'package:plume/Utilities/function_library.dart';

class Assignment{
  String id;
  String description;
  String title;
  DateTime startDate;
  DateTime endDate;
  String file;
  List<AssignmentAnswer> assignmentAnswers;

  Assignment({this.id, this.title, this.description, this.startDate, this.endDate, this.file, this.assignmentAnswers});

  factory Assignment.fromJson(Map json){

    return Assignment(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      file: json['file'],
      startDate: FunctionLibrary.formatDateForClient(DateTime.parse(json['startDate'])),
      endDate: FunctionLibrary.formatDateForClient(DateTime.parse(json['endDate'])),
      assignmentAnswers: []
    );
  }
  void set(Assignment a){
    this.id = a.id;
    this.description = a.description;
    this.title = a.title;
    this.startDate = a.startDate;
    this.endDate = a.endDate;
    this.file = a.file;
    assignmentAnswers = assignmentAnswers;
  }
}
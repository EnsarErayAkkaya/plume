import 'package:plume/Models/assignment_answer.dart';

class Assignment{
  String id;
  String description;
  String title;
  DateTime startDate;
  DateTime endDate;
  String fileURL;
  List<AssignmentAnswer> assignmentAnswers;

  Assignment({this.id, this.title, this.description, this.startDate, this.endDate, this.fileURL, this.assignmentAnswers});

  factory Assignment.fromJson(Map json){

    return Assignment(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      fileURL: json['fileURL'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      assignmentAnswers: []
    );
  }
}
import 'dart:convert';

import 'package:plume/Services/service_base.dart';

class RemoveStudent extends ServiceBase{
  String url;
  String teacher;
  String subject;
  String student;

  RemoveStudent(this.teacher, this.subject, this.student){
    url = baseURL + 'subjects/removeStudent';
  }
  Future<Map> sendAddStudentRequest () async {
    try {
      var body = json.encode({'teacher': teacher, 'subject': subject, 'student':student});
      Map response = await postRequest(url, body);
      return response;
    }
    catch(e){
      print(e);
      return null;
    }
  }
}
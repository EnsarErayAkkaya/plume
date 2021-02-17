import 'dart:convert';

import 'package:plume/Services/service_base.dart';

class AddStudent extends ServiceBase{
  String url;
  String teacher;
  String subject;
  String student;

  AddStudent(this.teacher, this.subject, this.student){
    url = baseURL + 'subjects/addStudent';
  }
  Future<Map> sendAddStudentRequest () async {
    try {
      var body = json.encode({'teacher': teacher, 'subject': subject, 'student':student});
      Map response = await postRequest(url, body);
      //print(response);
      /*print(response['success']);
      print(response['data']['name']);*/
      return response;
    }
    catch(e){
      print(e);
      return null;
    }
  }
}
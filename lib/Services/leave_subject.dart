import 'dart:convert';
import 'package:plume/Services/service_base.dart';

class LeaveSubject extends ServiceBase {
  String url;
  String student;
  String subject;

  LeaveSubject(this.student, this.subject) {
    url = baseURL + 'subjects/leave';
  }
  Future<Map> sendLeaveSubjectRequest () async {
    try {
      var body = json.encode({'student': student, 'subject': subject});
      Map response = await postRequest(url, body);
      print(response);
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
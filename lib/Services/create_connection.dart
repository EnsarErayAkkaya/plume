import 'dart:convert';

import 'package:plume/Services/service_base.dart';

class CreateConnection extends ServiceBase{
  String url;
  final String student;
  final String teacher;

  CreateConnection({this.student, this.teacher}){
    url = baseURL + 'connections/createConnection';
  }

  Future<Map> sendCreateConnectionRequest () async {
    try {
      var body =json.encode({
        'teacher': teacher,
        'student': student,
      });

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
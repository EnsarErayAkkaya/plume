import 'dart:convert';

import 'package:plume/Services/service_base.dart';

class AddSubject extends ServiceBase{
  String url;
  final String name;
  final String teacher;

  AddSubject({this.name, this.teacher}){
    url = baseURL +'subjects';
  }

  Future<Map> sendAddSubjectRequest () async {
    try {
      var body = json.encode({'name': name, 'teacher': teacher});
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
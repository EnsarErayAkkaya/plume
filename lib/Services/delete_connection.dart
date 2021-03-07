import 'dart:convert';

import 'package:plume/Services/service_base.dart';

class DeleteConnection extends ServiceBase{
  String url;
  final String student;
  final String teacher;

  DeleteConnection(this.student, this.teacher){
    url = baseURL + 'connections';
  }
  Future<Map> sendDeleteConnectionRequest() async{
    try {
      var body = json.encode({'student':student, 'teacher': teacher});
      Map response = await deleteRequestWithBody(url, body);
      //print(response);
      /*print(response['success']);*/
      //print(response['data']);
      return response;
    }
    catch(e){
      print(e);
      return null;
    }
  }
}
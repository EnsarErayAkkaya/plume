import 'dart:convert';

import 'package:plume/Services/service_base.dart';

class DeleteAssignment extends ServiceBase{
  String url;
  final String teacher;
  final String subject;
  DeleteAssignment(String id, this.teacher, this.subject){
    url = baseURL + 'assignments/' + id;
  }

  Future<Map> sendDeleteAssignment () async {
    try {
      var body = json.encode({'teacher': teacher, 'subject': subject});
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
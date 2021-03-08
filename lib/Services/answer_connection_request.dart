import 'dart:convert';

import 'package:plume/Services/service_base.dart';

class AnswerConnectionRequest extends ServiceBase {
  String url;
  final String studentAns;

  AnswerConnectionRequest(this.studentAns, String id){
    url = baseURL + 'connections/answerConnectionRequest/'+id;
  }

  Future<Map> sendAnswerConnectionRequest() async{
    try {
      var body = json.encode({'studentAns': studentAns});
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
import 'dart:convert';
import 'package:http/http.dart';
import 'package:plume/Services/service_base.dart';

class FetchStudentConnections extends ServiceBase{
  String url;

  FetchStudentConnections(String id){
    url = baseURL + 'connections/getTeachers/' + id;
  }

  Future<Map> sendFetchConnections () async {
    try {
      Map response = await getRequest(url);
      //print(response);
      /*print(response['success']);*/
      print(response['data']);
      return response;
    }
    catch(e){
      print(e);
      return null;
    }
  }
}
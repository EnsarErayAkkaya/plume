import 'dart:convert';
import 'package:http/http.dart';
import 'package:plume/Services/service_base.dart';

class GetStudents extends ServiceBase{
  String url;

  GetStudents(String id){
    url = baseURL + 'connections' + '/getStudents/' + id;
  }

  Future<Map> sendGetStudents () async {
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
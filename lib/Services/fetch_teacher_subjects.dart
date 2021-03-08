import 'dart:convert';
import 'package:http/http.dart';
import 'package:plume/Services/service_base.dart';

class FetchTeacherSubjects extends ServiceBase{
  String url;

  FetchTeacherSubjects(String id){
    url = baseURL + 'subjects/teacherSubjects/' + id;
  }

  Future<Map> sendFetchSubjects () async {
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
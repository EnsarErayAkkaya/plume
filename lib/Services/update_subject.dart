import 'dart:convert';

import 'package:plume/Services/service_base.dart';

class UpdateSubject extends ServiceBase{
  String url;
  String name;
  String teacherId;
  UpdateSubject(String id, String name, String teacherId){
    this.name = name;
    this.teacherId = teacherId;
    url = baseURL + 'subjects/' + id;
  }

  Future<Map> sendUpdateSubject () async {
    var body = json.encode({'name': name, 'teacher': teacherId});
    try {
      Map response = await putRequest(url, body);
      return response;
    }
    catch(e){
      print(e);
      return null;
    }
  }
}
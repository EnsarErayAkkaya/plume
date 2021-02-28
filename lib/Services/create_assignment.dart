import 'dart:convert';

import 'package:http/http.dart';
import 'package:plume/Services/service_base.dart';
import 'package:plume/Utilities/function_library.dart';

class CreateAssignment extends ServiceBase{
  String url;
  final String title;
  final String desc;
  final DateTime startDate;
  final DateTime endDate;
  final String filename;
  final String subject;

  CreateAssignment(this.title, this.desc, this.startDate, this.endDate, this.filename, this.subject){
    url = baseURL + 'assignments';
  }

  Future<Map> sendCreateAssignmentRequest () async {
    try {
      print('subject:' +subject);
      Map<String, String> body =
      {
        'title': title,
        'description': desc,
        'startDate': FunctionLibrary.formatDateForServer(startDate).toString(),
        'endDate': FunctionLibrary.formatDateForServer(endDate).toString(),
        'subject': subject
      };

      Map response = await postMultipartRequest(url, filename, body);
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
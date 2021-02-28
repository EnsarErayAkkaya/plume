import 'dart:convert';

import 'package:http/http.dart';
import 'package:plume/Services/service_base.dart';
import 'package:plume/Utilities/function_library.dart';

class EditAssignment extends ServiceBase{
  String url;
  final String title;
  final String desc;
  final DateTime startDate;
  final DateTime endDate;
  final String filename;
  final String subject;

  EditAssignment(this.title, this.desc, this.startDate, this.endDate, this.filename, this.subject, String id){
    url = baseURL + 'assignments/'+id;
  }

  Future<Map> sendEditAssignmentRequest () async {
    try {
      print('subject:' +subject);

      Map<String, String> body =  {};
      title != null && title != ''? body['title'] = title:null;
      desc != null && desc != ''? body['description'] = desc:null;

      startDate != null && startDate.toString() != ''?
        body['startDate'] = FunctionLibrary.formatDateForServer(startDate).toString():null;

      endDate != null && endDate.toString() != ''?
        body['endDate'] = FunctionLibrary.formatDateForServer(endDate).toString():null;

      subject != null && subject != ''? body['subject'] = subject:null;

      Map response = await putMultipartRequest(url, filename, body);
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
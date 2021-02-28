import 'dart:convert';

import 'package:plume/Services/service_base.dart';

class SearchStudents extends ServiceBase{
  String url;
  final String searchString;

  SearchStudents({this.searchString}){
    url = baseURL + 'students/byName';
  }

  Future<Map> sendSearchStudents () async {
    try {
      List<String> names = searchString.split(' ');
      var body;
      if(names.length == 1) {
        body = json.encode({'name': names[0], 'surname': ''});
      }
      else if(names.length == 2) {
        body = json.encode({'name': names[0], 'surname': names[1]});
      }
      else if(names.length > 2) {
        body = json.encode({'name': names.getRange(0, names.length - 1).join(' '), 'surname': names.last});
      }
      else{
        body = json.encode({'name': names[0], 'surname': ''});
      }
      Map response = await getRequestWithBody(url, body.toString());
      //print('response: ' + response.toString());
      /*print(response['success']);*/
      //print('data: ' + response['data']);
      return response;
    }
    catch(e){
      print('Search Students Error: ' + e.toString());
      return null;
    }
  }
}
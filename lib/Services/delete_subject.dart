import 'package:plume/Services/service_base.dart';

class DeleteSubject extends ServiceBase{
  String url;

  DeleteSubject(String id){
    url = baseURL + 'subjects/' + id;
  }

  Future<Map> sendDeleteSubject () async {
    try {
      Map response = await deleteRequest(url);
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
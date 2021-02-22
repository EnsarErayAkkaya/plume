import 'package:plume/Services/service_base.dart';

class SendFile extends ServiceBase{
  String url;
  final String filename;

  SendFile(this.filename, String urlExtension){
    url = baseURL + urlExtension;
  }

  Future<Map> sendCreateAssignmentRequest () async {
    try{
      Map response = await putMultipartRequest(url, filename);
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
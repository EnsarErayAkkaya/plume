import 'dart:convert';
import 'package:http/http.dart';
import 'package:plume/Services/service_base.dart';

class Login extends ServiceBase{
  String url;
  String email;
  String password;

  Login(this.email, this.password, String userRole){
    url = baseURL + userRole + 's/login';
  }

  Future<Map> sendLoginRequest () async {
    try {
      var body = json.encode({'email': email, 'password': password});
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
import 'dart:convert';
import 'package:plume/Services/service_base.dart';

class SignUp extends ServiceBase{
  String url;
  String name;
  String surname;
  String email;
  String password;

  SignUp(this.name, this.surname, this.email, this.password, String userRole){
    url = baseURL + userRole + 's/register';
  }

  Future<Map> sendRegisterRequest () async {
    try {
      var body = json.encode({'name': name, 'surname': surname,'email': email, 'password': password});
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
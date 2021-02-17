import 'dart:convert';
import 'package:http/http.dart';

class ServiceBase{
  final String baseURL = 'http://192.168.1.3:5000/api/v1/';
}

Future<Map> postRequest(String url, dynamic body) async {
  printURL(url);
  Response response = await post(
    url,
    body: body,
    headers: {"Content-Type": "application/json"},
  );

  return mapData(response.body);
}
Future<Map> putRequest(String url, dynamic body) async {
  printURL(url);
  Response response = await put(
    url,
    body: body,
    headers: {"Content-Type": "application/json"},
  );
  print(response.body);
  return mapData(response.body);
}
Future<Map> getRequest(String url) async {
  printURL(url);
  Response response = await get(
    url
  );
  print(response.body);
  return mapData(response.body);
}
Future<Map> deleteRequest(String url) async {
  printURL(url);
  Response response = await delete(
      url
  );
  print(response.body);
  return mapData(response.body);
}

Map mapData(String s)
{
  return jsonDecode(s);
}
void printURL(String url)
{
  print(url);
}
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ServiceBase{
  final String baseURL = 'http://192.168.1.3:5000/api/v1/';
}

Future<Map> postRequest(String url, dynamic body) async {
  printURL(url);
  http.Response response = await http.post(
    url,
    body: body,
    headers: {"Content-Type": "application/json"},
  );

  return mapData(response.body);
}
Future<Map> postMultipartRequest(String url, String filename, Map<String, String> json) async {
  printURL(url);
  printURL(json.toString());
  var request = http.MultipartRequest('POST', Uri.parse(url));
  if(filename != null && filename != '') {
    request.files.add(
        http.MultipartFile.fromBytes(
            'file',
            File(filename).readAsBytesSync(),
            filename: filename
                .split("/")
                .last
        )
    );
  }
  request.fields.addAll(json);

  http.StreamedResponse response = await request.send();

  return mapData(await response.stream.bytesToString());
}
Future<Map> putMultipartRequest(String url, String filename, Map<String, String> json) async {
  printURL(url);
  printURL(json.toString());
  var request = http.MultipartRequest('PUT', Uri.parse(url));
  if(filename != null && filename != '') {
    request.files.add(
        http.MultipartFile.fromBytes(
            'file',
            File(filename).readAsBytesSync(),
            filename: filename
                .split("/")
                .last
        )
    );
  }
  request.fields.addAll(json);

  http.StreamedResponse response = await request.send();

  return mapData(await response.stream.bytesToString());
}
Future<Map> putRequest(String url, dynamic body) async {
  printURL(url);
  http.Response response = await http.put(
    url,
    body: body,
    headers: {"Content-Type": "application/json"},
  );
  print(response.body);
  return mapData(response.body);
}
Future<Map> getRequest(String url) async {
  printURL(url);
  http.Response response = await http.get(
    url
  );
  print(response.body);
  return mapData(response.body);
}
Future<Map> getRequestWithBody(String url, var body) async {
  printURL(url);
  print(body);
  try{

    var request = http.Request('GET', Uri.parse(url));
    request.headers.addAll(<String, String>{
      "Content-Type": "application/json",
    });
    request.body = body;

    http.StreamedResponse response = await request.send();
    return mapData(await response.stream.bytesToString());
  }
  catch(e){
    print(e);
    return {};
  }
}
Future<Map> deleteRequest(String url) async {
  printURL(url);
  http.Response response = await http.delete(
      url
  );
  print(response.body);
  return mapData(response.body);
}
Future<Map> deleteRequestWithBody(String url, dynamic body) async {
  printURL(url);
  final request = http.Request("DELETE", Uri.parse(url));

  request.headers.addAll(<String, String>{
    "Content-Type": "application/json",
  });
  request.body = body;

  final response = await request.send();
  return mapData(await response.stream.bytesToString());
}

Map mapData(String s)
{
  return jsonDecode(s);
}
void printURL(String url)
{
  print(url);
}
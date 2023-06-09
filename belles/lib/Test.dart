import 'dart:convert';
import 'package:universal_html/html.dart';
import 'package:universal_html/parsing.dart';
import 'dart:io';

void main() {
  loadHtml("");
}

Future<String> reqHttp(String uri) async {
  var url = Uri.parse(uri);
  var httpClient = HttpClient();
  var request = await httpClient.getUrl(url);
  var response = await request.close();
  var data = await utf8.decoder.bind(response).toList();
  print('Response ${response.statusCode}: data : ${data.isNotEmpty}');
  httpClient.close();
  return data[0];
}

void loadHtml(String page) async {
  reqHttp("http://www.baidu.com").then((value) {

    final htmlDocument = parseHtmlDocument(value);
    var title = htmlDocument.querySelector("title")?.toString();
    print("----- $title ----");

  });
}

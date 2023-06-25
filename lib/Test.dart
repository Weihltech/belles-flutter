import 'girlnets.dart';

void main() {
  var girlNets = GirlNets();
  var xiuParse = XiuParser();
  Future<String>.sync(() => girlNets.reqHost(xiuParse.mote)).then((value) {
    var doc = xiuParse.parseContent(value);
    xiuParse.parseMotes(doc);
  });
}
//
// Future<String> reqHttp(String uri) async {
//   var url = Uri.parse(uri);
//   var httpClient = HttpClient();
//   var request = await httpClient.getUrl(url);
//   var response = await request.close();
//   var data = await utf8.decoder.bind(response).toList();
//   print('Response ${response.statusCode}: data : ${data.isNotEmpty}');
//   httpClient.close();
//   return data[0];
// }
//
// void loadHtml(String page) async {
//   reqHttp("https://www.yiwuxian.com/renxiang/xiezhenzhao").then((value) {
//
//     final htmlDocument = parseHtmlDocument(value);
//     var title = htmlDocument.querySelector("title")?.toString();
//     htmlDocument.querySelectorAll("img").toList().toString();
//     print("----- $title ----");
//
//   });
// }

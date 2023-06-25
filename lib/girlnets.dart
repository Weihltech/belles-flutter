// 图集合，资源网站获取

// https://6666rt.com/
// https://69bp.com/ 大集合
// https://99xx5.xyz
// https://99x1.top
// https://99xx2.xyz
// https://yinaw.com/category/article
// http://www.mmshipin.top/
// // 推荐
// https://www.tujigu.top/
// http://521call.net/
// https://www.taotucd.com/
// https://xiannvwu.top/ 视频
// https://www.xiurenwang.cc/  高清

import 'dart:convert';
import 'package:universal_html/html.dart';
import 'dart:io';
import 'package:universal_html/parsing.dart';

class GirlNets {
  Future<String> reqHost(String uri) async {
    var httpC = await HttpClient().getUrl(Uri.parse(uri));
    var resp = await httpC.close();
    var data = await utf8.decoder.bind(resp).first;
    httpC.close();
    return data;
  }
}

// 解析 xiu
class XiuParser {
  //人气榜单列表，关键字 <a>
  final String mote = "https://www.xiurenwang.cc/mote";
  final List<String> motes = [""];

  HtmlDocument parseContent(String content) {
    return parseHtmlDocument(content);
  }

  void parseMotes(HtmlDocument doc) {
    var eles = doc.querySelectorAll("span");
    var lazyEles = doc.getElementsByClassName('mtlist');

    print(eles);
  }
}

// Copyright @2023
import 'package:belles/classes_7/_opt_host.dart';
import 'package:belles/classes_7/_opt_mark.dart';

import '_opt_file.dart';

/// @desc
///
/// @author Weihl
/// @date 2023/6/21

enum Opt {
  Exit("退出 ChatOpt ?", ExitOpt()),
  ReadFile("读取文件 ?", FileOpt()),
  RequestHost("访问网站 ？", HostOpt()),
  MarkChat("取消记录对话语句（默认：开启）？", MarkOpt());

  final String desc;
  final IOpt iOpt;

  const Opt(this.desc, this.iOpt);

  String chatStr() {
    return "指令：$index ; 描述：$desc";
  }
}

class IOpt {
  bool holder() => false;
}


class ExitOpt implements IOpt {
  const ExitOpt();

  @override
  bool holder() => false;
}

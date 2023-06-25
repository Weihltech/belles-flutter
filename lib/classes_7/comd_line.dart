// Copyright @2023
/// @desc
///
/// @author Weihl
/// @date 2023/6/20
import 'dart:io';

import 'package:belles/classes_7/_opt.dart';

void main() {
  ChatOpt().run();
}

class ChatOpt {
  run() {
    var inputEff = false;
    do {
      stdout.write(nowChat());
      var inputStr = stdin.readLineSync();
      inputEff = stdinAction(inputStr);
    } while (inputEff);
  }

  // 对话
  String? nowChat() {
    StringBuffer sayHi = StringBuffer();
    sayHi.writeln("ChatOpt,简易 Dart 命令行应用程序");
    for (var element in Opt.values) {
      sayHi.writeln(element.chatStr());
    }
    sayHi.write("指令@：");
    return sayHi.toString();
  }

  // 检查输入是否合法
  bool stdinAction(String? inputStr) {
    if (inputStr != null && inputStr.isNotEmpty) {
      try {
        var inCode = int.parse(inputStr);
        if (inCode < 0 || inCode > Opt.values.length) throw "non in service";
        try {
          return Opt.values[inCode].iOpt.holder();
        } catch (e) {
          stdout.writeln(e);
        }
        return false;
      } catch (err) {
        stdout.writeln("你输入错误，对话就此结束");
        return false;
      }
    }
    return false;
  }
}

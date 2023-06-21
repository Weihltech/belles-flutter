// Copyright @2023
/// @desc
///
/// @author Weihl
/// @date 2023/6/20
import 'dart:ffi';
import 'dart:io';
import 'dart:convert';

void main() {
  ChatOpt().run();
}

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

class FileOpt implements IOpt {
  const FileOpt();

  @override
  bool holder() {
    bool hResult = true;
    do {
      stdout.writeln("FileOpt:[ 0-exit ], Input target file path !");
      var path = stdin.readLineSync();
      try {
        if (path == null) throw "error input";
        if ('0' == path) {
          hResult = false;
          throw "exit FileOpt";
        }
        stdout.writeln(File(path).readAsStringSync());
        stdout.writeln("----");
      } catch (e) {
        stdout.writeln(e);
      }
    } while (hResult);
    return true;
  }
}

class HostOpt implements IOpt {
  const HostOpt();

  @override
  bool holder() {
    // TODO: implement holder
    throw UnimplementedError();
  }
}

class MarkOpt implements IOpt {
  const MarkOpt();

  @override
  bool holder() {
    // TODO: implement holder
    throw UnimplementedError();
  }
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

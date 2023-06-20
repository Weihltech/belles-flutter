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

// enum Opt{
//    int _id = 0;
//   final String desc;
//    ReadFile(1,"读取文件");
// }

class ChatOpt {
  run() {
    var inputEff = false;
    do {
      stdout.writeln(_whatCallDo());
      var inputStr = stdin.readLineSync();
      inputEff = _checkInputEff(inputStr);
    } while (inputEff);
  }

  String? _whatCallDo() {
    return "0、退出对话；1、读取文件；2、记录对话；3、读取网络网页并过滤必要信息；";
  }

  bool _checkInputEff(String? inputStr) {
    if (inputStr != null && inputStr.isNotEmpty) {
      try {
        var inputComd = int.parse(inputStr);
        if (inputComd < 0 || inputComd > 4) throw "non in service";
        return true;
      } catch (err) {
        stdout.writeln("你输入错误，对话就此结束");
        return false;
      }
    }
    return false;
  }
}

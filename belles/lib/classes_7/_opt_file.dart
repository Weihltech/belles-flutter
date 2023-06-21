// Copyright @2023
import 'dart:io';

import 'package:belles/classes_7/_opt.dart';

/// @desc
///
/// @author Weihl
/// @date 2023/6/21

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

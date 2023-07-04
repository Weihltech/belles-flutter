// Copyright @2023
import 'dart:async';

/// @desc
///
/// @author Weihl
/// @date 2023/6/29

/// Future 异步函数，代表需要等待计算/处理的函数，Stream 结合 inteable 迭代器理解，及代表一系列的 Future
/// 创建、修改、等等

void main() async {
  // do something

  var count = 10.0 * 2;
  var message = "$count cows";
  if (message != "20.0 cows") throw Exception("Unexpected: $message");

  var streamSub =
      timeCounter(const Duration(seconds: 1), maxCount: 10).listen((event) {
    print("object:$event");
  });

  Timer.periodic(const Duration(seconds: 1), (timer) {

    if (timer.tick == 2) streamSub.pause(Future.delayed(const Duration(seconds: 5)));
    if (timer.tick == 4) streamSub.resume();
    if (timer.tick == 5) timer.cancel(); // 5秒后，停止操作
    if (timer.tick == 6) streamSub.cancel();
    // if(timer.tick == 4) streamSub.resume();
  });
}

Stream<int> timeCounter(Duration duration, {int maxCount = 10}) {
  var con = StreamController<int>();

  var count = 0;
  reportFu() {
    Future.delayed(const Duration(seconds: 1), () {
      if (count <= maxCount) {
        con.add(count);
        reportFu();
      } else {
        con.close();
      }
    });
  }

  reportFu();
  return con.stream;
}

bListen() {
  print("object");
}

Stream<int> countStream(int count) async* {
  for (int i = 0; i <= count; i++) {
    yield i;
  }
}

Future<int> sum(Stream<int> stream) async {
  int v = 0;
  await for (final int s in stream) {
    v += s;
  }
  return v;
}

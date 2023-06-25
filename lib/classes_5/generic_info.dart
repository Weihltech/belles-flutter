
/// 泛型
/// 为什么要使用泛型；代码类型安全，避免不必要的类型转换报错；编译时检查代码，避免代码错误；代码复用

/// 泛型集合以及它们所包含的类型
/// 与 Java 不同的是，Java 中的泛型是类型 擦除 的，这意味着泛型类型会在运行时被移除。
/// 在 Java 中你可以判断对象是否为 List 但不可以判断对象是否为 List<String>。

List<String> abc = <String>[];


class Covert<I,O>{
  O covert(I i){
    return i as O;
  }
}

class MCovert implements Covert<String,int>{
  @override
  int covert(String i) {
    // TODO: implement covert
    throw UnimplementedError();
  }

}

/// package 与 Library
// import 引入包
// import "" as abc ,修改别名
// import "" show foo ,引入部分
// import "" hide foo ,隐藏不符

/// 使用 deferred as 关键字来标识需要延时加载的代码库，目前只支持 js ；flutter 与 Dart 不支持
// import 'package:greetings/hello.dart' deferred as hello;
// Future<void> greet() async {
//   await hello.loadLibrary();
//   hello.printGreeting();
// }

// loadLibrary 函数可以调用多次也没关系，代码库只会被加载一次。
// 延迟加载的代码库中的常量需要在代码库被加载的时候才会导入，未加载时是不会导入的。
// 导入文件的时候无法使用延迟加载库中的类型。如果你需要使用类型，则考虑把接口类型转移到另一个库中然后让两个库都分别导入这个接口库。
// Dart会隐式地将 loadLibrary() 导入到使用了 deferred as 命名空间 的类中。 loadLibrary() 函数返回的是一个 Future。


//异步支持
//Dart 代码库中有大量返回 Future 或 Stream 对象的函数，这些函数都是 异步 的，
// 它们会在耗时操作（比如I/O）执行完毕前直接返回而不会等待耗时操作执行完毕。
//async 和 await 关键字用于实现异步编程，并且让你的代码看起来就像是同步的一样。
//尽管 async 函数可能会执行一些耗时操作，但是它并不会等待这些耗时操作完成，相反，
// 异步函数执行时会在其遇到第一个 await 表达式时返回一个 Future 对象，
// 然后等待 await 表达式执行完毕后继续执行。
// 使用 try、catch 以及 finally 来处理使用 await 导致的异常：
// await 表达式的返回值通常是一个 Future 对象；如果不是的话也会自动将其包裹在一个 Future 对象里。
// Future 对象代表一个“承诺”， await 表达式会阻塞直到需要的对象返回。
// 如果函数没有返回有效值，需要设置其返回类型为 Future<void>。











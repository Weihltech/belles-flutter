
/// Dart 中的并发
/// async-await ; isolate ; Future - Stream
/// 1、在应用中，所有的 Dart 代码都在 isolate 中运行。
/// 2、每一个 Dart 的 isolate 都有独立的运行线程，它们无法与其他 isolate 共享可变对象。
/// 3、在需要进行通信的场景里，isolate 会使用消息机制。
/// 4、很多 Dart 应用都只使用一个 isolate，也就是 main isolate。
/// 5、你可以创建额外的 isolate 以便在多个处理器核心上执行并行代码。
///
///
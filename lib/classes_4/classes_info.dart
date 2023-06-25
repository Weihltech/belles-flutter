
/// 类
/// 认识：在未实例前，fun 称函数 ，var ..称字段；这些统称类成员；实例后，fun 称方法，var ..称数据、实例变量；方法的调用需要类对象来完成
/// 1、成员调用：.  ?.

/// 2、类实例化：通过构造函数，类名() 或 类名.**() ;
/// 2-1、常量构造函数用 const 标记构造函数，函数参数成员要求必须是 final
/// 2-2、常量构造函数有个特点：两个使用相同构造函数相同参数值构造的编译时常量是同一个对象：
/// var a = const ImmutablePoint(1, 1);
/// var b = const ImmutablePoint(1, 1);
/// assert(identical(a, b)); // They are the same instance!
/// var c = ImmutablePoint(1, 1); // Does NOT create a constant
/// assert(!identical(a, c)); // NOT the same instance!

/// 3、获取对象的类型  对象.runtimeType方法
/// 4、方法是为对象提供行为的函数
main() {
  // 类

}

class Person {
  String? firstName;

  /// 如果不特别声明，则默认生成无参构造函数
  // Person(this.firstName);
  // Person.fromJson(Map<String,int> meta){
  //   firstName = meta['firstName'].toString();
  // }
}

// class IAnimal{
//   int age = 0;
//  void onRun(){
//    print("Animal.onRun");
//  }
// }
//
// class Pet implements IAnimal{
//   @override
//   void onRun() { }
// }


class Employee extends Person {

  /// 默认构造函数
  // int age = 0;
  // 若父类有构造函数，子类比如对父类的构造参数入参且必须是 super 修饰
  // Employee(super.firstName,int age){ this.age = age; }
  // Employee(super.firstName,this.age) // 超类的一种写法
  // Employee(String firstName,this.age):super(firstName)
  // Employee(this.age):super("defaultName")

  /// 超类参数
  // Employee(super.firstName,this.age) ，将父类参数在子类构造函数中通过 super 调用

  /// 构造函数不被继承
  // 也就是父类的构造函数不被子类所见，但可以重写且通 super 关键字调用

  /// 命名式构造函数
  // int age = 0;
  // String color = "";
  // Employee.orign()
  //     :age = 0 ,// 这里其实就是默认入参，可以使用 const 关键字
  //      color = ""

  /// 调用父类非默认构造函数
  // 更精确的表达构造的意图，同理，若父类有相同命名构造函数，子类若重写需要对父类进行构造入参
  // 调用顺序：子类初始化列表 - 在父类 - 后子类
  // Employee.fromJson(Map meta) : super.fromJson(null){
  //   age = meta['age'];
  // }
  // 另外还可以这样写 ：先通过入参参数对类实例变量进行赋值，在执行构造函数体
  // int x = 0;
  // int y = 0;
  // Employee.fromJson(Map<String, int> json) : x = json['x']!,y = json['y']!
  // Employee.fromJson(Map<String, int> json) : x = json['x']!,y = json['y']! {
  //   json['y'] = 3;
  //   print('In Point.fromJson(): ($x, $y)');
  // }

  /// 重定向构造函数
  // 也就是类的其他构造函数通过 :this() 重定向到本类的其他构造函数上

  /// 常量构造函数
  // 使用关键字 const 修饰构造函数前缀且入参对应实例变量标记为 final ,
  // 特点：相同入参值实例化的对象，是同一对象

  /// 工厂构造函数
  // 使用关键字 factory 修饰构造函数
  // int age = 0;
  // String color = "";
  // static final _iMap = <String,Employee>{};
  // factory Employee(String name) => _iMap.putIfAbsent(name, () => Employee._create(0, ""));
  // factory Employee.fromJson(Map<String,String> meta) => Employee(meta['name']??"def");
  // Employee._create(this.age,this.color)

  /// 重写操作符 operator
  // Employee operator +(Employee employee) {
  //   firstName = "$firstName,${employee.firstName}";
  //   return this;
  // }
  // Employee operator +(Employee employee) => Employee();

  /// Getter 和 Setter
  // 非 final , _ 编译自动生成 get set 方法；可以声明自定义 get set 方法
  // int left = 0, top = 0, width = 0, height = 0;
  // int get right => left + width;
  // set right(int value) => left = value - width;

  /// 隐式接口
  // Dart 没有 interface 接口关键字，每个类都是隐式的接口；实现类的成员及函数忽视具体实现逻辑

  /// 扩展一个类 extends
  // 继承
  /// 重写类成员 ; 是成员不是函数

  /// noSuchMethod 方法 ：如果调用了对象上不存在的方法或实例变量将会触发 noSuchMethod 方法，
  /// 你可以重写 noSuchMethod 方法来追踪和记录这一行为：
  /// https://github.com/dart-lang/language/blob/main/archive/feature-specifications/nosuchmethod-forwarding.md

  /// 扩展方法 https://dart.cn/guides/language/extension-methods
  /// extension <extension name>? on <type> {
  ///   (<member definition>)*
  /// }

  /// 枚举类型
  /// 增强型枚举类型
  /// 1、实例的字段必须是 final，包括由 mixin 混入的字段。
  /// 2、所有的 实例化构造 必须以 const 修饰。
  /// 3、工厂构造 只能返回已知的一个枚举实例。
  /// 4、由于 Enum 已经自动进行了继承，所以枚举类不能再继承其他类。
  /// 5、不能重载 index、hashCode 和比较操作符 ==。
  /// 6、不能声明 values 字段，否则它将与枚举本身的静态 values getter 冲突。
  /// 7、在进行枚举定义时，所有的实例都需要首先进行声明，且至少要声明一个枚举实例。

  /// 使用 Mixin 为类添加功能
  // 以 Mixin Able Ible 结尾
// mixin Run{
//   int count = 0;
//   void onRun(){
//     print("run${++count}");
//   }
// }
//
// class Animal with Run{
//
//   void go(){
//     onRun();
//   }
// }

  /// 类变量和方法
  // 使用关键字 static 可以声明类变量或类方法
  // static const int abc = 123

}




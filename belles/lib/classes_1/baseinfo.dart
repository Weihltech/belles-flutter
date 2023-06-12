// 基础类型？
void main() {
  notionType();
  baseType();
  listType();
  setType();
  mapType();
  runesTab();
}

void notionType() {
  // 1 一切皆对象，[数字、函数、null 等] 都是对象，变量引用存储的是对象地址；
  // 2 空安全，原则上初始值都是非空，" int? = null " 可赋值为 null ；开启空安全有助于编写代码做检查
  // 3 尽管 Dart 是强类型静态语言，但变量声明是也允许可选，理由编译时会根据值推断引用类型，比如 " var i = 0 " ;i 推算为 num(int) 类型
  // 4 Object 是所有对象基类，dynamic 是所有基础类型的基类；dynamic 标识的变量将关闭代码检查，在运行中确认类型，灵活但不建议常用，容易造成报错；
  // 5 支持 泛型、顶级函数、顶级变量；顶级函数、变量就是指不属于任何类或对象的函数、变量
  // 6 私有函数、变量，在字段名前加下横杠 "int _i = 0"; 没有 [public、product、private] 的关键字
  // 7 警告 和 错误 两种类型的问题。警告表明代码可能有问题但不会阻止其运行。错误分为编译时错误和运行时错误；编译时错误代码无法运行；运行时错误会在代码运行时导致 异常。
  // 8 常亮 final const ,都可以标识为常亮且都赋值一次，后不可改变；final 运行时赋值，只能修饰变量，const 编译时赋值既可以修饰变量也可以修饰构造函数；
  // 9 语句与表达式的关系：多个表达式组合、串联，即常规的函数
}

void baseType() {
  // Numbers  Strings  Boolean  Lists  Sets  Maps  Chars  其他

  // Numbers : int  double ;

  // Strings : var a = 'abc' 或 var b = "abc" ;两者编译后结果无差别；但在编码时略有不同；比如：
  // 双引号可以不专义需要单引号标识：print( 'abc\'cc' == "abc'cc" ) is true ； print( 'abc\"cc' == "abc\"cc" ) is true
  // 字符串模版：""" ... """ 与 ''' ... ''' ，一样字符串不专义表示；严格按照域内格式输出；模版或注释
  // StringBuffer： 高效字符串操作；线程安全？不要好意思 Dart 没有线程；类似参考 isolate 并发编程
  // 字符串表达式： "abc${obj???123}cc"
  // 字符串拼接：可以使用 + 运算符或并列放置多个字符串来连接字符串
  // 字符串前加上 r 作为前缀创建 “raw” 字符串（即不会被做任何处理（比如转义）的字符串）；比如：var r = r'abc'c'
}

void runesTab() {
  // 在 Dart 中，runes 公开了字符串的 Unicode 码位。
  // 使用 characters 包 来访问或者操作用户感知的字符，
  // 也被称为 Unicode (扩展) grapheme clusters。

  // 字符对应的默认 icon ???
  // import 'package:characters/characters.dart';
  // var hi = 'Hi 🇩🇰';
  // print('The end of the string: ${hi.substring(hi.length - 1)}');
  // print('The last character: ${hi.characters.last}');
}

void mapType() {
  // 无序的、键值映射的集合
  // 1. 无确定类型 { "key1":1 ,"key2":"abc" ,1:"eee"} ,确定类型 <String,String>{"key":"value"}
  // 2. 值得一提：map['key'] = value ; 此表达式，若 key 不存在，会向 map 补充 key-value ;若已存在，则覆盖 key 映射的 value

  // 扩展操作符
  // var map = {"a":234 ,"b":123};
  // var map2 = {...map,"c":123};

  // 集合操作符
  // var map = {"a":234 ,"b":123};
  // var map2 = { for(int i=0 ;i<5;i++) "a":123, ...map};
  // var map3 = { if(c==0) "c":0,...map}
}

void setType() {
  // 无序的、可增长的、去重的集合
  // 1. 无确定类型 {"a",1,"b"} , 确定类型 <String>{"a","b"}
  // 2. 扩展操作符 {"a",...map,"1"} 或 {"a",...?map,"1"}
  // 3. 集合操作符 {"a",if(i == 0) "b","1"} 或 {"a",for(int i=0 ;i<5;i++) "$i","1"}
  // 4. 固定长度，限制操作：cost {"a","b"} ; 编译时确定；运行时限制集合操作
}

void listType() {
  // var 适合局部变量表示；作为全局变量，应该明确其类型；
  // new 关键字可选；非必要
  // 有序的，可增长的集合，@列表/数组
  // 1. 局部表示：var a = [1,2,3]; 无类型集合，即 <Object>[] ; 全局表示：List<Object> a = [1,2,3]
  // 2. 确定类型集合：var b = <String>["1","2"] ;，此时添加 add(1) 报错；
  // 3. 不可增长，固定长度：const a = [1,2,3] ;编译时确定：length = 3; add(4)-会报错

  // 扩展操作符： ...list ，将其他列表直接引用在创建中
  // 1.创建补充或添加 ，var a = [1,2,3] ,var b = <int>[0,...a,5] ; // b = 0,1,2,3,5
  // 2.扩展判空，var b = <int>[0,...?a,5];

  // 集合操作符： 将语句逻辑直接引用到列表创建中
  // 1.判断  var a = [1,2, if(c== 1) 3]
  // 2.循环 var a = ["1","2",for(int i=0 ; i<5 ; i++) "$i"]
}

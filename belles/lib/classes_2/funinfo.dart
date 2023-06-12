

/// 函数 void 返回值可选；在规范编程建议加上返回类型
void fun() {}

/// 常规入参，
/// 1. 参数： i , s  不可设定默认值
/// 2. 按 '顺序入参' 或 '参数名:值' ;
/// 比如： fun(1,"1") 或 fun(b:"1",a:1) 或 fun(b:"1",1)
param(int a, String b) {}

/// 可选！！命名参数 {} ；
/// 1. 参数 i ,d ,不可缺少
/// 2. {a,b,c} 默认不可为空除非标记为可空类型；;可以有默认值，可以不按顺序入参，但必须是 [参数名:值]
/// 3. 固定参数按规定入参，可选命名参数可任意位置入参；比如：fun(1,a:"") 或 fun(1,a:"",c:"") 或 ....
/// 4. {String? a , b, c} ，规定入参 a 为 String 类型且可以为 null
/// 5. {String a = "a" , b, c} ，规定入参 a 为 String 类型且不可为空，必须赋予初始值
selNameParam(int i, int d, {String? a, b, c = 123}) {}

/// 可选！！位置参数 []
/// 1. 参数 i ,d ,不可缺少
/// 2. [a,b,c] 默认可为空，可指定类型，必须按顺序入参
selLocParam(int i, int d, [a, b, c = 123]) {}

/// 由 required 修饰的参数 为强制入参参数
/// 不可设置默认参数
/// 只修饰可选命名参数，不可修饰常规、可选位置参数
forceParam(int i,{ required String a}){}
// forceParam1(int i,[ required String a = "123"]){}  ，required 报错 !!

void main() {

}



/// 算数运算符：+ - * / % ~/
/// 关系运算符：> < >= <= == !=
/// 类型判断运算符：as is is!
///
/// 赋值运算符: = ??=
/// 算术结合赋值符：=	*=	%=	>>>=	^=  +=	/=	<<=	&=	|=  -=	~/=	>>=
///
/// 逻辑运算符: 与&& 或|| 非！
/// 按位、移位运算符: << >> >>> ~取反(0->1,1->0) ; &按位与  |按位或  ^按位异或(不同为1，想通为0)
/// 条件表达式: ? -:- ??:
/// 级联运算符: .., ?.. 可以嵌套属于 Dart 特殊语法；效果类似 Kotlin: also apply 即返回该对象
/// 其他运算符: () [] ?[] ?. . !
main(){

  // 操作符
  // 流程控制语句
  // 异常

}

/// 流程控制语句：
/// if-else switch-case try-catch do-while while for-each assert(开发阶段生效，发布阶段编译器会过滤但里面的判断语句会执行？)

/// 异常：
/// 1、throw ，try-on-catch(on 指定异常信息，catch 捕获异常信息，可以同时使用 on Exception catch (e))
/// 2、catch , 妙用大，catch (e, s) e参数为抛出的异常对象，s参数为栈信息 StackTrace 对象
/// 3、rethrow , 可以将捕获的异常信息再次抛出
/// 4、Finally , 无论是否抛出异常，finally 语句始终执行，如果没有指定 catch 语句来捕获异常，则异常会在执行完 finally 语句后抛出 ;finally 语句会在任何匹配的 catch 语句后执行
/// 5、StackTrace 堆栈信息，比如打印调用日志等调试手段有作用；参考： https://api.dart.cn/stable/3.0.5/dart-core/StackTrace-class.html


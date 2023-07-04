// Copyright @2023
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @desc
///
/// @author Weihl
/// @date 2023/7/3

void main() {
  runApp(const BellesApp());
}

class BellesApp extends StatelessWidget {
  const BellesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Learn Demo",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: const BellesHomePage(),
    );
  }
}

class BellesHomePage extends StatelessWidget {
  const BellesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key("sample_row"),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const GooText(),
        Image.asset("images/lake.png", fit: BoxFit.fill),
        Image.network("https://i.mydramalist.com/Zn7pY_5c.jpg",width: 100,height: 100),
        const Center(
          child: Text('Hello World'),
        ),
      ],
    );
  }
}

class GooText extends StatefulWidget {
  const GooText({super.key});

  @override
  State<StatefulWidget> createState() => _GooState();
}

class _GooState extends State<GooText> with TickerProviderStateMixin {
  int _clickCount = 0;
  late AnimationController animationController;

  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    curvedAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.fastLinearToSlowEaseIn);

    Timer(const Duration(seconds: 1), () {
      _markClickTxt();
      print("object --- 1 seconds");
    });
  }

  void _markClickTxt() {
    setState(() {
      ++_clickCount;
    });
    animationController.reset();
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _markClickTxt();
      },
      child: FadeTransition(
        opacity: curvedAnimation,
        child: Text("Click Count :$_clickCount"),
      ),
    );
  }
}

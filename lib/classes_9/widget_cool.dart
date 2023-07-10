// Copyright @2023
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @desc
///
/// @author Weihl
/// @date 2023/7/7

void main() {
  // do something

  runApp(const MaterialApp(
    home: Scaffold(
      body: CoolPage(),
    ),
  ));
}

class CoolPage extends StatelessWidget {
  const CoolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: createWrapItem(),
          ),
        ),
      ],
    );
  }

  createWrapItem() {
    var list = <Widget>[];
    for (int i = 0; i < 30; i++) {
      list.add(Expanded(
          child: Container(
        color: Colors.grey,
        child: Text(
          "data:$i",
          style: TextStyle(fontSize: 30),
        ),
      )));
    }
    return list;
  }
}

// Copyright @2023
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

/// @desc
///
/// @author Weihl
/// @date 2023/7/4

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      // appBar: AppBar(
      //   title: const Text("Adapter UI Design"),
      // ),
      body: PageBuilder(),
    ),
  ));
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    if (isLandscape) {
      return const WideLayout();
    }
    return const NarrowLayout();
  }
}

class WideLayout extends StatefulWidget {
  const WideLayout({super.key});

  @override
  State<WideLayout> createState() => _WideLayoutState();
}

class _WideLayoutState extends State<WideLayout> {
  Person? _person;

  void _dtlPersonDisplay(Person p) {
    setState(() {
      _person = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: PersonList((person) {
              _dtlPersonDisplay(person);
            })),
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[100],
              child:
                  PersonDtl(_person ?? const Person("name", "phone", "email")),
            ))
      ],
    );
  }
}

class NarrowLayout extends StatelessWidget {
  const NarrowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return PersonList((person) => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SamplePage(PersonDtl(person)))));
  }
}

class PersonList extends StatelessWidget {
  const PersonList(this.onTap, {super.key});

  final Function(Person person) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: personList
          .map((p) => ListTile(
                leading: CircleAvatar(
                  child: Text(p.name.substring(1, 3)),
                ),
                title: Text(p.name),
                subtitle: Text("${p.email} ${p.phone}"),
                onTap: () => {onTap(p)},
              ))
          .toList(),
    );
  }
}

class SamplePage extends StatelessWidget {
  final Widget _body;

  const SamplePage(this._body, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
        ),
        title: const Text("Person Detail Info"),
      ),
      body: _body,
    );
  }
}

class PersonDtl extends StatelessWidget {
  final Person p;

  const PersonDtl(this.p, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(p.name), Text(p.phone), Text(p.email),const SizedBox(height: 20,),Text("${UniversalPlatform.isWeb}")],
      ),
    );
  }
}

List<Person> personList = const <Person>[
  Person("竹溪燕舞", "138008000", "123456789@qq.com"),
  Person("竹溪烟雾", "1380031200", "12312@qq.com"),
  Person("竹溪艳舞", "138235100", "209384@qq.com"),
  Person("仰义艳舞", "138004300", "20938498@qq.com"),
  Person("仰义艳舞", "13803100", "209098@qq.com"),
  Person("仰义艳舞", "1344581100", "20938098@qq.com"),
  Person("仰义艳舞", "1386456100", "209098@qq.com"),
];

class Person {
  final String name;
  final String phone;
  final String email;

  const Person(this.name, this.phone, this.email);
}

const orgJson = """
[
{
"name":"西渚细夕",
"phone":13800138000,
"email":"123456789@qq.com"
},
{
"name":"西夕竹溪",
"phone":13800138000,
"email":"123456789@qq.com"
},
{
"name":"夕西竹溪",
"phone":13800138011,
"email":"123456789@qq.com"
},
{
"name":"西夕竹溪",
"phone":13800138022,
"email":"123456789@qq.com"
},
{
"name":"西竹溪夕",
"phone":13800138033,
"email":"123456789@qq.com"
}
]
""";

// Copyright @2023
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @desc
///
/// @author Weihl
/// @date 2023/7/4

void main() {
  runApp(const MaterialApp(
      key: Key("cake-card"), home: Center(child: CakeCard())));
}

class CakeCard extends StatelessWidget {
  const CakeCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.all(10.0),
      height: 450.0,
      child: const Card(
          elevation: 9.0,
          shadowColor: Colors.red,
          clipBehavior:Clip.antiAlias,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          child: Row(children: [CakeInfo(), CakeImage()])));
}

class CakeInfo extends StatelessWidget {
  const CakeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 260.0,
      child: Column(
        children: [Text("data")],
      ),
    );
  }
}

class CakeImage extends StatelessWidget {
  const CakeImage({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
        child: Stack(
          children: [
            Image.network(
              "https://media.istockphoto.com/id/615736056/photo/berry-pavlova-cake-with-strawberries-and-raspberries.jpg?s"
                  "=612x612&w=0&k=20&c=y_S1Nw3e1gTnGsyBHFR56MCvWshQUhuUlJkUDECbV_w=",
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: ClipOval(
                  child: Container(
                    color: Colors.white38,
                    width: 80,
                    height: 80,
                    padding: const EdgeInsets.all(18),
                    child: Image.asset(
                      "images/lake.png",
                      fit: BoxFit.cover,
                    ),
                  )
              ),
            )
          ],
        ),
      );
}

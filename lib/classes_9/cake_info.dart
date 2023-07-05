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
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          child: Row(children: [
            SizedBox(
              width: 16,
            ),
            CakeInfo(),
            SizedBox(
              width: 16,
            ),
            CakeImage()
          ])));
}

class CakeInfo extends StatelessWidget {
  const CakeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        flex: 1,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Strawberry Pavlova",
              maxLines: 1,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w100,
                  color: Colors.black87),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
                "它是用面粉与鸡蛋、牛奶、坚果和蜂蜜混合而成的。他们还有一种叫做“satura”的蛋糕，是一种扁平的重蛋糕。在罗马时期，蛋糕的名称变成了源",
                maxLines: 6,
                style: TextStyle(fontSize: 18, color: Colors.black54),
                textAlign: TextAlign.center),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StarScores(),
                SizedBox(
                  width: 18,
                ),
                Text("170 Revlews")
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Descs()
          ],
        ));
  }
}

class Descs extends StatelessWidget {
  const Descs({super.key});

  @override
  Widget build(BuildContext context) => const Row(
        children: [
          SizedBox(
            width: 16,
          ),
          Expanded(child: Tipsub(Icons.kitchen, "PREP", "25 min")),
          Expanded(child: Tipsub(Icons.timelapse_outlined, "COOK", "1 hr")),
          Expanded(child: Tipsub(Icons.restaurant, "FEEDS", "4 ~ 6")),
          SizedBox(
            width: 16,
          ),
        ],
      );
}

class Tipsub extends StatelessWidget {
  final String title;
  final String sub;
  final IconData icon;

  const Tipsub(this.icon, this.title, this.sub, {super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Icon(
            icon,
            color: Colors.redAccent,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(title.toUpperCase(),maxLines: 1,),
          const SizedBox(
            height: 9,
          ),
          Text(sub.toLowerCase(),maxLines: 1,)
        ],
      );
}

class StarScores extends StatelessWidget {
  const StarScores({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 100,
        height: 35,
        child: Row(
          children: [
            Expanded(
                child: Icon(
              Icons.star,
              color: Colors.yellow.shade800,
            )),
            Expanded(
                child: Icon(
              Icons.star,
              color: Colors.yellow.shade800,
            )),
            Expanded(
                child: Icon(
              Icons.star,
              color: Colors.yellow.shade800,
            )),
            Expanded(
                child: Icon(
              Icons.star,
              color: Colors.yellow.shade800,
            )),
            const Expanded(
                child: Icon(
              Icons.star,
              color: Colors.black26,
            )),
          ],
        ),
      );
}

class CakeImage extends StatelessWidget {
  const CakeImage({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
        flex: 2,
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
              padding: const EdgeInsets.all(10.0),
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
              )),
            )
          ],
        ),
      );
}

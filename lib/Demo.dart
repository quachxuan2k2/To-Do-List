import 'package:flutter/material.dart';

class DemoApp extends StatelessWidget {
  DemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                boxMethod("box 1", Alignment.bottomRight),
                boxMethod("box 2", Alignment.bottomLeft),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  boxMethod("box 3", Alignment.topRight),
                  boxMethod("box 4", Alignment.topLeft),
                ],
              ),
            ]),
            Center(
                child: boxMethod("Hello Xuân", Alignment.center, true))
          ],
        ));
  }

  Container boxMethod(String name, Alignment direction, [bool boxRadius = false]) {
    return Container(
      decoration: BoxDecoration(
          color: boxRadius? const Color.fromARGB(255, 34, 221, 246):Colors.green,
          borderRadius: BorderRadius.circular(boxRadius ? 100:0)),
      alignment: direction,
      width: 160,
      height: 160,
      child: Text(name,
          style: TextStyle(
              fontSize: 20, color: Colors.pink, fontWeight: FontWeight.bold)),
    );
  }
}
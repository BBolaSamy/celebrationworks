import 'package:flutter/material.dart';
import 'fireworks.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:200.0),
                child: Sperklesanimation(50),
              ),
              Padding(
                padding: const EdgeInsets.only(left:200.0),
                child: Sperklesanimation(100),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:100.0),
                child: Sperklesanimation(150),
              ),
              Padding(
                padding: const EdgeInsets.only(top:100.0),
                child: Sperklesanimation(200),
              ),
              Padding(
                padding: const EdgeInsets.only(top:300.0),
                child: Sperklesanimation(100),
              ),
            ],
          )),
    );
  }
}

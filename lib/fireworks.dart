import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'sperklesdata.dart';

class Sperklesanimation extends StatefulWidget {
  final double changepadding;
  Sperklesanimation(this.changepadding);
  @override
  _SperklesanimationState createState() => _SperklesanimationState();
}

class _SperklesanimationState extends State<Sperklesanimation>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  Random random;

  double _sparklesAngle = 0.0;
  var _firstsparkles;

  Future _onchange() async {
    setState(() {
      animationController.forward(from: 0.0);
      _sparklesAngle = random.nextDouble() * (2 * pi);
    });
  }

  Future sleep() {
    return new Future.delayed(
        const Duration(milliseconds: 1000), () => _onchange());
  }

  Future change() async {
    while (true) {
      await sleep();
      print("object");
    }
  }

  @override
  void initState() {
    super.initState();
    random = new Random();
    _sparklesAngle = random.nextDouble() * (2 * pi);
    _firstsparkles = _sparklesAngle;
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = new CurvedAnimation(
        parent: animationController, curve: Curves.easeOutQuart);

    change();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget chile) {
            return Stack(
              children: List.generate(5, (index) {
                var currentAngle = (_firstsparkles + ((2 * pi) / 5) * (index));
                var sparklesOpacity = (1 - animation.value);
                var sparkleRadius = (animationController.value * 50);
                return Padding(
                  padding: EdgeInsets.only(
                      top: widget.changepadding, left: widget.changepadding),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: (sparkleRadius * cos(currentAngle)) + 20,
                        top: (sparkleRadius * sin(currentAngle)) + 20,
                        child: Transform.rotate(
                          angle: currentAngle - pi / 2,
                          child: Opacity(
                            opacity: sparklesOpacity,
                            child: Image.asset(
                              sperklesdata[index].imagepath,
                              height: 30,
                              width: 30,
                              color: sperklesdata[index].color,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );
          }),
    );
  }
}
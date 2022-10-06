import 'dart:math';
import 'package:flutter/material.dart';

double shipsWidth = 25;
double bigShipHeight = 166;
double mediumShipHeight = 133;
double smallShipHeight = 100;

var shipImage = Image.asset('lib/assets/images/shipImage.png');

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  AnimationController? animationController1;
  AnimationController? animationController2;
  AnimationController? animationController3;
  AnimationController? animationController4;
  Animation<double>? animation1;
  Animation<double>? animation2;
  Animation<double>? animation3;
  Animation<double>? animation4;
  int rotateTime = 0;

  @override
  void initState() {
    animationController1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animationController2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animationController3 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animationController4 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation1 =
        Tween<double>(begin: 0, end: pi / 2).animate(animationController1!);
    animation2 =
        Tween<double>(begin: pi / 2, end: pi).animate(animationController2!);
    animation3 = Tween<double>(begin: pi, end: pi + pi / 2)
        .animate(animationController3!);
    animation4 = Tween<double>(begin: pi + pi / 2, end: pi + pi)
        .animate(animationController4!);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationController1?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Draggable(
      child: Container(
        width: shipsWidth,
        height: bigShipHeight,
        child: GestureDetector(
          onTap: _rotateChildContinuously,
          child: RotateTrans(
            Image.asset(
              'lib/assets/images/shipImage.png',
              fit: BoxFit.fill,
            ),
            buildAnimation(),
          ),
        ),
      ),
      childWhenDragging: Container(
        color: Colors.brown[100],
      ),
      feedback: Container(
        width: shipsWidth,
        height: bigShipHeight,
        child: Image.asset(
          'lib/assets/images/shipImage.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  _rotateChildContinuously() {
    print(rotateTime);
    setState(() {
      rotateTime++;
      if (rotateTime == 1) {
        animationController1!.forward(from: 0);
      } else if (rotateTime == 2) {
        animationController2!.forward(from: 0);
      } else if (rotateTime == 3) {
        animationController3!.forward(from: 0);
      } else if (rotateTime == 4) {
        animationController4!.forward(from: 0);
      }
    });
  }

  Animation<double> buildAnimation() {
    if (rotateTime == 1 || rotateTime == 0) {
      return animation1!;
    } else if (rotateTime == 2) {
      return animation2!;
    } else if (rotateTime == 3) {
      return animation3!;
    } else if (rotateTime == 4) {
      rotateTime = 0;
      return animation4!;
    }
    return animation4!;
  }
}

class RotateTrans extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  RotateTrans(this.child, this.animation);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        return Container(
          child: Transform.rotate(
            angle: animation.value,
            child: Container(
              child: child,
            ),
          ),
        );
      },
    );
  }
}

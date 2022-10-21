import 'dart:math';
import 'package:battleships/map.dart';
import 'package:flutter/material.dart';

bool isStartButtonVisible = false;
bool isBigVisible = false;
bool isSmallVisible = false;
bool isSmall2Visible = false;
bool smallShip2True = true;
bool smallShipTrue = true;
bool bigShipTrue = true;
double shipsWidth = 25;
double bigShipHeight = 166;
double smallShipHeight = 100;
double smallShip2Height = 100;

int isBigShipRotate = 0;
int isSmallShipRotate = 0;
int isSmallShip2Rotate = 0;
Color? smallBeforeColor = Colors.red[
    200]; // gemilere farklı renkler verme sebebi => dragTarget-onAccetp fonksiyonunda
Color? small2BeforeColor = Colors.red[300];

// hangi objenin droplandığını ayırt edebilmek
Color? bigBeforeColor = Colors.red[400];

ImageProvider<Object> shipImage = AssetImage('lib/assets/images/shipImage.png');

class SmallShip2 extends StatefulWidget {
  @override
  State<SmallShip2> createState() => _SmallShip2State();
}

class _SmallShip2State extends State<SmallShip2> with TickerProviderStateMixin {
  AnimationController? animationController1;
  AnimationController? animationController2;
  AnimationController? animationController3;
  AnimationController? animationController4;
  AnimationController? animationController5;
  AnimationController? animationController6;
  AnimationController? animationController7;
  AnimationController? animationController8;
  Animation<double>? animation1;
  Animation<double>? animation2;
  Animation<double>? animation3;
  Animation<double>? animation4;
  Animation<double>? animation5;
  Animation<double>? animation6;
  Animation<double>? animation7;
  Animation<double>? animation8;
  int rotateTime = 0; // objenin kaç defa döndürüldüğü (şu anki durumu)

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
    animation5 =
        Tween<double>(begin: 0, end: pi / 2).animate(animationController1!);
    animation6 =
        Tween<double>(begin: pi / 2, end: pi).animate(animationController2!);
    animation7 = Tween<double>(begin: pi, end: pi + pi / 2)
        .animate(animationController3!);
    animation8 = Tween<double>(begin: pi + pi / 2, end: pi + pi)
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
    return IgnorePointer(
      ignoring: !smallShip2True,
      child: Opacity(
        opacity: smallShip2True ? 1 : 0,
        child: Draggable(
          onDragCompleted: () {
            if (dummyListSmall2[0] + dummyListSmall2[1] + dummyListSmall2[2] >
                0) {
              setState(() {
                smallShip2True = false;
                isSmall2Visible = true;
              });
            }
          },
          data: small2BeforeColor,
          child: Container(
            width: shipsWidth,
            height: smallShip2Height,
            child: GestureDetector(
              onTap: _rotateChildContinuously,
              child: RotateTrans(
                Image(
                  image: shipImage,
                  fit: BoxFit.fill,
                ),
                buildAnimation(),
              ),
            ),
          ),
          childWhenDragging: Container(
            color: Colors.brown[200],
          ),
          feedback: Container(
            width: shipsWidth,
            height: smallShip2Height,
            child: GestureDetector(
              onTap: _rotateChildContinuously,
              child: RotateTrans(
                  Image(
                    image: shipImage,
                    fit: BoxFit.fill,
                  ),
                  buildAnimation2()),
            ),
          ),
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
    if (rotateTime == 0) {
      isSmallShip2Rotate = 1;

      return animation1!;
    } else if (rotateTime == 1) {
      isSmallShip2Rotate = 0;
      return animation1!;
    } else if (rotateTime == 2) {
      isSmallShip2Rotate = 1;
      return animation2!;
    } else if (rotateTime == 3) {
      isSmallShip2Rotate = 0;
      return animation3!;
    } else if (rotateTime == 4) {
      isSmallShip2Rotate = 1;
      rotateTime = 0;
      return animation4!;
    }

    isSmallShip2Rotate = 1;
    return animation4!;
  }

  Animation<double> buildAnimation2() {
    if (rotateTime == 0) {
    } else if (rotateTime == 1) {
      return animation5!;
    } else if (rotateTime == 2) {
      return animation6!;
    } else if (rotateTime == 3) {
      return animation7!;
    } else if (rotateTime == 4) {
      rotateTime = 0;
      return animation8!;
    }

    return animation5!;
  }
}

class SmallShip extends StatefulWidget {
  @override
  State<SmallShip> createState() => _SmallShipState();
}

class _SmallShipState extends State<SmallShip> with TickerProviderStateMixin {
  AnimationController? animationController1;
  AnimationController? animationController2;
  AnimationController? animationController3;
  AnimationController? animationController4;
  AnimationController? animationController5;
  AnimationController? animationController6;
  AnimationController? animationController7;
  AnimationController? animationController8;
  Animation<double>? animation1;
  Animation<double>? animation2;
  Animation<double>? animation3;
  Animation<double>? animation4;
  Animation<double>? animation5;
  Animation<double>? animation6;
  Animation<double>? animation7;
  Animation<double>? animation8;
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
    animation5 =
        Tween<double>(begin: 0, end: pi / 2).animate(animationController1!);
    animation6 =
        Tween<double>(begin: pi / 2, end: pi).animate(animationController2!);
    animation7 = Tween<double>(begin: pi, end: pi + pi / 2)
        .animate(animationController3!);
    animation8 = Tween<double>(begin: pi + pi / 2, end: pi + pi)
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
    return IgnorePointer(
      ignoring: !smallShipTrue,
      child: Opacity(
        opacity: smallShipTrue ? 1 : 0,
        child: Draggable(
          onDragCompleted: () {
            if (dummyListSmall[0] + dummyListSmall[1] + dummyListSmall[2] > 0) {
              setState(() {
                smallShipTrue = false;
              });
            }
          },
          data: smallBeforeColor,
          child: Container(
            width: shipsWidth,
            height: smallShipHeight,
            child: GestureDetector(
              onTap: _rotateChildContinuously,
              child: RotateTrans(
                Image(
                  image: shipImage,
                  fit: BoxFit.fill,
                ),
                buildAnimation(),
              ),
            ),
          ),
          childWhenDragging: Container(
            color: Colors.brown[200],
          ),
          feedback: Container(
            width: shipsWidth,
            height: smallShipHeight,
            child: GestureDetector(
              onTap: _rotateChildContinuously,
              child: RotateTrans(
                  Image(
                    image: shipImage,
                    fit: BoxFit.fill,
                  ),
                  buildAnimation2()),
            ),
          ),
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
    if (rotateTime == 0) {
      isSmallShipRotate = 1;

      return animation1!;
    } else if (rotateTime == 1) {
      isSmallShipRotate = 0;
      return animation1!;
    } else if (rotateTime == 2) {
      isSmallShipRotate = 1;
      return animation2!;
    } else if (rotateTime == 3) {
      isSmallShipRotate = 0;
      return animation3!;
    } else if (rotateTime == 4) {
      isSmallShipRotate = 1;
      rotateTime = 0;
      return animation4!;
    }

    isSmallShipRotate = 1;
    return animation4!;
  }

  Animation<double> buildAnimation2() {
    if (rotateTime == 0) {
    } else if (rotateTime == 1) {
      return animation5!;
    } else if (rotateTime == 2) {
      return animation6!;
    } else if (rotateTime == 3) {
      return animation7!;
    } else if (rotateTime == 4) {
      rotateTime = 0;
      return animation8!;
    }

    return animation5!;
  }
}

class BigShip extends StatefulWidget {
  @override
  State<BigShip> createState() => _BigShipState();
}

class _BigShipState extends State<BigShip> with TickerProviderStateMixin {
  AnimationController? animationController1;
  AnimationController? animationController2;
  AnimationController? animationController3;
  AnimationController? animationController4;
  AnimationController? animationController5;
  AnimationController? animationController6;
  AnimationController? animationController7;
  AnimationController? animationController8;
  Animation<double>? animation1;
  Animation<double>? animation2;
  Animation<double>? animation3;
  Animation<double>? animation4;
  Animation<double>? animation5;
  Animation<double>? animation6;
  Animation<double>? animation7;
  Animation<double>? animation8;
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
    animationController5 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 0));
    animationController6 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 0));
    animationController7 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 0));
    animationController8 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 0));
    animation1 =
        Tween<double>(begin: 0, end: pi / 2).animate(animationController1!);
    animation2 =
        Tween<double>(begin: pi / 2, end: pi).animate(animationController2!);
    animation3 = Tween<double>(begin: pi, end: pi + pi / 2)
        .animate(animationController3!);
    animation4 = Tween<double>(begin: pi + pi / 2, end: pi + pi)
        .animate(animationController4!);
    animation5 =
        Tween<double>(begin: 0, end: pi / 2).animate(animationController1!);
    animation6 =
        Tween<double>(begin: pi / 2, end: pi).animate(animationController2!);
    animation7 = Tween<double>(begin: pi, end: pi + pi / 2)
        .animate(animationController3!);
    animation8 = Tween<double>(begin: pi + pi / 2, end: pi + pi)
        .animate(animationController4!);
    super.initState();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationController1?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !bigShipTrue,
      child: Opacity(
        opacity: bigShipTrue ? 1 : 0,
        child: Draggable(
          onDragCompleted: () {
            if (dummyListBig[0] + dummyListBig[1] + dummyListBig[2] > 0) {
              setState(() {
                bigShipTrue = false;
                isBigVisible = true;
              });
            }
          },
          data: bigBeforeColor,
          child: Container(
            width: shipsWidth,
            height: bigShipHeight,
            child: GestureDetector(
              onTap: _rotateChildContinuously,
              child: RotateTrans(
                Image(
                  image: shipImage,
                  fit: BoxFit.fill,
                ),
                buildAnimation(),
              ),
            ),
          ),
          childWhenDragging: Container(
            color: Colors.brown[200],
          ),
          feedback: Container(
            width: shipsWidth,
            height: bigShipHeight,
            child: GestureDetector(
              onTap: _rotateChildContinuously,
              child: RotateTrans(
                  Image(
                    image: shipImage,
                    fit: BoxFit.fill,
                  ),
                  buildAnimation2()),
            ),
          ),
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

  Animation<double> buildAnimation2() {
    if (rotateTime == 0 || rotateTime == 1) {
      return animation5!;
    } else if (rotateTime == 2) {
      return animation6!;
    } else if (rotateTime == 3) {
      return animation7!;
    } else if (rotateTime == 4) {
      rotateTime = 0;
      return animation8!;
    }

    return animation5!;
  }

  Animation<double> buildAnimation() {
    if (rotateTime == 0) {
      isBigShipRotate = 1;

      return animation1!;
    } else if (rotateTime == 1) {
      isBigShipRotate = 0;

      return animation1!;
    } else if (rotateTime == 2) {
      isBigShipRotate = 1;

      return animation2!;
    } else if (rotateTime == 3) {
      isBigShipRotate = 0;

      return animation3!;
    } else if (rotateTime == 4) {
      isBigShipRotate = 1;

      rotateTime = 0;
      return animation4!;
    }
    isBigShipRotate = 1;

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

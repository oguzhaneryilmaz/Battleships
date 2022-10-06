import 'package:flutter/material.dart';

double shipsWidth = 25;
double bigShipHeight = 166;
double mediumShipHeight = 133;
double smallShipHeight = 100;

ImageProvider<Object> shipImage = AssetImage('lib/assets/images/shipImage.png');

class BigShip extends StatelessWidget {
  const BigShip({super.key});

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: Container(
          width: shipsWidth,
          height: bigShipHeight,
          child: Image(
            image: shipImage,
            fit: BoxFit.fill,
          )),
      childWhenDragging: Container(
        color: Colors.brown[100],
      ),
      child: Container(
          width: shipsWidth,
          height: bigShipHeight,
          child: Image(
            image: shipImage,
            fit: BoxFit.fill,
          )),
    );
  }
}

class MediumShip extends StatelessWidget {
  const MediumShip({super.key});

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: Container(
          width: shipsWidth,
          height: mediumShipHeight,
          child: Image(
            image: shipImage,
            fit: BoxFit.fill,
          )),
      childWhenDragging: Container(
        color: Colors.brown[100],
      ),
      child: Container(
          width: shipsWidth,
          height: mediumShipHeight,
          child: Image(
            image: shipImage,
            fit: BoxFit.fill,
          )),
    );
  }
}

class SmallShip extends StatelessWidget {
  const SmallShip({super.key});

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: Container(
          width: shipsWidth,
          height: smallShipHeight,
          child: Image(
            image: shipImage,
            fit: BoxFit.fill,
          )),
      childWhenDragging: Container(
        color: Colors.brown[100],
      ),
      child: Container(
          width: shipsWidth,
          height: smallShipHeight,
          child: Image(
            image: shipImage,
            fit: BoxFit.fill,
          )),
    );
  }
}

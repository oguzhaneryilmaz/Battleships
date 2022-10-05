import 'package:flutter/material.dart';

double shipsWidth = 25;
double bigShipHeight = 166;
double mediumShipHeight = 133;
double smallShipHeight = 100;

class BigShip extends StatelessWidget {
  const BigShip({super.key});

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: Container(
        color: Colors.orange,
        width: shipsWidth,
        height: bigShipHeight,
      ),
      childWhenDragging: Container(
        color: Colors.brown[100],
      ),
      child: Container(
        color: Colors.green,
        width: shipsWidth,
        height: bigShipHeight,
      ),
    );
  }
}

class MediumShip extends StatelessWidget {
  const MediumShip({super.key});

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: Container(
        color: Colors.orange,
        width: shipsWidth,
        height: mediumShipHeight,
      ),
      childWhenDragging: Container(
        color: Colors.brown[100],
      ),
      child: Container(
        color: Colors.green,
        width: shipsWidth,
        height: mediumShipHeight,
      ),
    );
  }
}

class SmallShip extends StatelessWidget {
  const SmallShip({super.key});

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: Container(
        color: Colors.orange,
        width: shipsWidth,
        height: smallShipHeight,
      ),
      childWhenDragging: Container(
        color: Colors.brown[100],
      ),
      child: Container(
        color: Colors.green,
        width: shipsWidth,
        height: smallShipHeight,
      ),
    );
  }
}

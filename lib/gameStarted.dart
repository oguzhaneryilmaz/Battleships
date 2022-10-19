import 'package:battleships/map.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GameStarted extends StatefulWidget {
  @override
  State<GameStarted> createState() => _GameStartedState();
}

class _GameStartedState extends State<GameStarted> {
  String selected = "first";
  int numberOfSquares = 100;
  int isEmpty = 0;
  Color isHit = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: numberOfSquares,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10,
                  ),
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    if (dummyList.contains(index)) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = "Second";
                              });
                            },
                            child: Container(
                              color: selected == "first"
                                  ? Colors.blue
                                  : Colors.red,
                              child: Text(
                                1.toString(),
                                style: const TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Container(
                            color: Colors.blue,
                            child: Text(
                              isEmpty.toString(),
                              style: const TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

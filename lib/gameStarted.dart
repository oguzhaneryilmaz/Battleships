import 'package:battleships/map.dart';
import 'defineLists.dart';
import 'package:battleships/pixel.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GameStarted extends StatefulWidget {
  @override
  State<GameStarted> createState() => _GameStartedState();
}

class _GameStartedState extends State<GameStarted> {
  int numberOfSquares = 100;
  int clickedContainer = 0;

  Color hitShipColor = Colors.red;
  Color hitSeaColor = Colors.yellow;

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
                    for (int i = 0; i < 11; i++) {
                      if (dummyList[i] == index) {
                        return MyPixel(
                          onTap: () {
                            setState(() {
                              trueSelected[i] = "second";
                            });
                            ;
                          },
                          color: trueSelected[i] == "first"
                              ? mapColor
                              : hitShipColor,
                          child: Text(
                            "1",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        );
                      }
                    }
                    for (int i = 0; i < 100; i++) {
                      if (dummyList[i] != index) {
                        return MyPixel(
                          color: wrongSelected[index] == "first"
                              ? mapColor
                              : hitSeaColor,
                          child: Text(
                            "0",
                            style: TextStyle(fontSize: 25),
                          ),
                          onTap: () {
                            setState(() {
                              wrongSelected[index] = "second";
                            });
                          },
                        );
                      }
                    }

                    return MyPixel();
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

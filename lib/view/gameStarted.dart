import 'package:battleships/view/map.dart';
import 'package:battleships/viewmodel/shipsboomed.dart';
import '../viewmodel/defineLists.dart';
import 'package:battleships/viewmodel/pixel.dart';
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
                    for (int i = 0; i < 5; i++) {
                      if (dummyListBig[i] == index) {
                        return MyPixel(
                          onTap: () {
                            setState(() {
                              trueSelectedBig[i] = "second";
                              bigShipBoomed += 1;
                              if (bigShipBoomed == 5) {
                                bigShipBoomedFunc();
                              }
                              allShipsBoomed();
                            });
                            ;
                          },
                          color: trueSelectedBig[i] == "first"
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
                    for (int i = 0; i < 3; i++) {
                      if (dummyListSmall[i] == index) {
                        return MyPixel(
                          onTap: () {
                            setState(() {
                              trueSelectedSmall[i] = "second";
                              smallShipBoomed += 1;
                              if (smallShipBoomed == 3) {
                                smallShipBoomedFunc();
                              }
                              allShipsBoomed();
                            });
                            ;
                          },
                          color: trueSelectedSmall[i] == "first"
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
                    for (int i = 0; i < 3; i++) {
                      if (dummyListSmall2[i] == index) {
                        return MyPixel(
                          onTap: () {
                            setState(() {
                              trueSelectedSmall2[i] = "second";
                              smallShip2Boomed += 1;
                              if (smallShip2Boomed == 3) {
                                smallShip2BoomedFunc();
                              }
                              allShipsBoomed();
                            });
                            ;
                          },
                          color: trueSelectedSmall2[i] == "first"
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

                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///

                    for (int i = 0; i < 100; i++) {
                      if (dummyListSmall[i] != index ||
                          dummyListBig[i] != index ||
                          dummyListSmall2[i] != index) {
                        return MyPixel(
                          color: wrongSelectedBig[index] == "second" ||
                                  wrongSelectedSmall[index] == "second" ||
                                  wrongSelectedSmall2[index] == "second"
                              ? hitSeaColor
                              : mapColor,
                          child: Text(
                            "0",
                            style: TextStyle(fontSize: 25),
                          ),
                          onTap: () {
                            setState(() {
                              if (wrongSelectedBig[index] == "first") {
                                wrongSelectedBig[index] = "second";
                              } else if (wrongSelectedSmall[index] == "first") {
                                wrongSelectedSmall[index] = "second";
                              } else {
                                wrongSelectedSmall2[index] = "second";
                              }
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

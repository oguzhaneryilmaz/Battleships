import 'package:battleships/firebase_database_functions.dart';
import 'package:battleships/global_enough_player.dart';
import 'package:battleships/view/map.dart';
import 'package:battleships/viewmodel/main_menu.dart';
import 'package:battleships/viewmodel/shipsboomed.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../viewmodel/defineLists.dart';
import 'package:battleships/viewmodel/pixel.dart';
import 'package:flutter/material.dart';

class GameStarted extends StatefulWidget {
  const GameStarted({super.key});

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
        body: Observer(
      builder: (_) => Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://raw.githubusercontent.com/SimformSolutionsPvtLtd/battleship_flutter_flame/master/assets/images/background.png"))),
        child: Column(
          children: [
            if (globalWhoseTurn.turnWhose)
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: numberOfSquares,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 10,
                    ),
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      for (int i = 0; i < 5; i++) {
                        if (enemyBigShipLocation[i] == index) {
                          return MyPixel(
                            onTap: () {
                              setState(() {
                                if (trueSelectedBig[i] == "first") {
                                  remainingHits();
                                }
                                trueSelectedBig[i] = "second";
                                bigShipBoomed += 1;
                                if (bigShipBoomed == 5) {
                                  bigShipBoomedFunc();
                                }
                                allShipsBoomed();
                              });
                            },
                            color: trueSelectedBig[i] == "first"
                                ? mapColor
                                : hitShipColor,
                            child: const Text(
                              "1",
                              style: TextStyle(
                                fontSize: 5,
                              ),
                            ),
                          );
                        }
                      }
                      for (int i = 0; i < 3; i++) {
                        if (enemySmallShipLocation[i] == index) {
                          return MyPixel(
                            onTap: () {
                              setState(() {
                                if (trueSelectedSmall[i] == "first") {
                                  remainingHits();
                                }
                                trueSelectedSmall[i] = "second";
                                smallShipBoomed += 1;
                                if (smallShipBoomed == 3) {
                                  smallShipBoomedFunc();
                                }
                                allShipsBoomed();
                              });
                            },
                            color: trueSelectedSmall[i] == "first"
                                ? mapColor
                                : hitShipColor,
                            child: const Text(
                              "1",
                              style: TextStyle(
                                fontSize: 5,
                              ),
                            ),
                          );
                        }
                      }
                      for (int i = 0; i < 3; i++) {
                        if (enemySmallShip2Location[i] == index) {
                          return MyPixel(
                            onTap: () {
                              setState(() {
                                if (trueSelectedSmall2[i] == "first") {
                                  remainingHits();
                                }
                                trueSelectedSmall2[i] = "second";
                                smallShip2Boomed += 1;
                                if (smallShip2Boomed == 3) {
                                  smallShip2BoomedFunc();
                                }
                                allShipsBoomed();
                              });
                            },
                            color: trueSelectedSmall2[i] == "first"
                                ? mapColor
                                : hitShipColor,
                            child: const Text(
                              "1",
                              style: TextStyle(
                                fontSize: 5,
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
                        if (enemySmallShipLocation[i] != index ||
                            enemyBigShipLocation[i] != index ||
                            enemySmallShip2Location[i] != index) {
                          return MyPixel(
                            color: wrongSelectedBig[index] == "second" ||
                                    wrongSelectedSmall[index] == "second" ||
                                    wrongSelectedSmall2[index] == "second"
                                ? hitSeaColor
                                : mapColor,
                            child: const Text(
                              "0",
                              style: TextStyle(fontSize: 5),
                            ),
                            onTap: () {
                              setState(() {
                                FirebaseDatabase.instance
                                    .ref()
                                    .child('Whose-turn')
                                    .set(player);

                                if (wrongSelectedBig[index] == "first") {
                                  wrongSelectedBig[index] = "second";
                                } else if (wrongSelectedSmall[index] ==
                                    "first") {
                                  wrongSelectedSmall[index] = "second";
                                } else {
                                  wrongSelectedSmall2[index] = "second";
                                }
                              });
                            },
                          );
                        }
                      }

                      return const MyPixel();
                    },
                  ),
                ),
              ),
            if (!globalWhoseTurn.turnWhose)
              const SizedBox(
                height: 50,
              ),
            if (!globalWhoseTurn.turnWhose)
              const Center(
                child: Text(
                  "OPPONENT'S TURN",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            if (globalGameFinished.didUWin)
              AlertDialog(
                title: const Text('Game Finished'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: const <Widget>[
                      Text(
                        'You Won',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      finishGame();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainMenu(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            if (globalGameFinished.didULose)
              AlertDialog(
                title: const Text('Game Finished'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: const <Widget>[
                      Text(
                        'You Lost',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      finishGame();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainMenu(),
                        ),
                      );
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    ));
  }
}

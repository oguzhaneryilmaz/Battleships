import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import '../viewmodel/main_menu.dart';
import '../viewmodel/defineLists.dart';
import '../viewmodel/pixel.dart';
import '../view/map.dart';
import '../firebase_database_functions.dart';
import '../global_enough_player.dart';
import 'package:just_audio/just_audio.dart';

class GameStarted extends StatefulWidget {
  const GameStarted({super.key});

  @override
  State<GameStarted> createState() => _GameStartedState();
}

class _GameStartedState extends State<GameStarted> {
  int numberOfSquares = 100;
  int clickedContainer = 0;

  final AudioPlayer _player = AudioPlayer();

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
                            onTap: () async {
                              await _player
                                  .setAsset("lib/assets/audio/explosion.mp3");
                              await _player.play();
                              setState(() {
                                if (trueSelectedBig[i] == "first") {
                                  remainingHits();
                                }
                                trueSelectedBig[i] = "second";
                              });
                            },
                            color: trueSelectedBig[i] == "first"
                                ? mapColor
                                : hitShipColor,
                            child: const Text(
                              "1",
                              style: TextStyle(
                                fontSize: 1,
                              ),
                            ),
                          );
                        }
                      }
                      for (int i = 0; i < 5; i++) {
                        if (enemyBigShip2Location[i] == index) {
                          return MyPixel(
                            onTap: () async {
                              await _player
                                  .setAsset("lib/assets/audio/explosion.mp3");
                              await _player.play();
                              setState(() {
                                if (trueSelectedBig2[i] == "first") {
                                  remainingHits();
                                }
                                trueSelectedBig2[i] = "second";
                              });
                            },
                            color: trueSelectedBig2[i] == "first"
                                ? mapColor
                                : hitShipColor,
                            child: const Text(
                              "1",
                              style: TextStyle(
                                fontSize: 1,
                              ),
                            ),
                          );
                        }
                      }
                      for (int i = 0; i < 3; i++) {
                        if (enemySmallShipLocation[i] == index) {
                          return MyPixel(
                            onTap: () async {
                              await _player
                                  .setAsset("lib/assets/audio/explosion.mp3");
                              await _player.play();
                              setState(() {
                                if (trueSelectedSmall[i] == "first") {
                                  remainingHits();
                                }
                                trueSelectedSmall[i] = "second";
                              });
                            },
                            color: trueSelectedSmall[i] == "first"
                                ? mapColor
                                : hitShipColor,
                            child: const Text(
                              "1",
                              style: TextStyle(
                                fontSize: 1,
                              ),
                            ),
                          );
                        }
                      }
                      for (int i = 0; i < 3; i++) {
                        if (enemySmallShip2Location[i] == index) {
                          return MyPixel(
                            onTap: () async {
                              await _player
                                  .setAsset("lib/assets/audio/explosion.mp3");
                              await _player.play();
                              setState(() {
                                if (trueSelectedSmall2[i] == "first") {
                                  remainingHits();
                                }
                                trueSelectedSmall2[i] = "second";
                              });
                            },
                            color: trueSelectedSmall2[i] == "first"
                                ? mapColor
                                : hitShipColor,
                            child: const Text(
                              "1",
                              style: TextStyle(
                                fontSize: 1,
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
                            enemySmallShip2Location[i] != index ||
                            enemyBigShip2Location[i] != index) {
                          return MyPixel(
                            color: wrongSelectedBig[index] == "second" ||
                                    wrongSelectedBig2[index] == "second" ||
                                    wrongSelectedSmall[index] == "second" ||
                                    wrongSelectedSmall2[index] == "second"
                                ? hitSeaColor
                                : mapColor,
                            child: const Text(
                              "0",
                              style: TextStyle(fontSize: 1),
                            ),
                            onTap: () async {
                              await _player
                                  .setAsset("lib/assets/audio/miss.mp3");
                              await _player.play();
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

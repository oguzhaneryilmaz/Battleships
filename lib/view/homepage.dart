import 'package:battleships/view/gameStarted.dart';

import 'package:battleships/view/map.dart';
import 'package:flutter/material.dart';
import 'package:battleships/viewmodel/shipsandrotate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  denemeFunc() {
    if (isBigVisible == true &&
        isSmall2Visible == true &&
        isSmallVisible == true) {
      isStartButtonVisible = true;
    }
  }

  int numberOfSquares = 100;

  int isHit = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: Column(
        children: [
          const Expanded(
            flex: 2,
            child: MyMap(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.brown[200],
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            width: 30,
                            child: SmallShip(),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Container(
                            width: 30,
                            child: SmallShip2(),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Container(
                            width: 30,
                            child: BigShip(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                          child: Container(
                            color: Colors.red,
                            child: Text(
                              "START",
                              style: TextStyle(
                                fontSize: 24,
                                color: Color.fromARGB(255, 71, 21, 4),
                              ),
                            ),
                          ),
                          onTap: () {
                            if (isBigVisible == true &&
                                isSmall2Visible == true &&
                                isSmallVisible == true)
                              setState(() {
                                {
                                  isStartButtonVisible = true;
                                  print("Oyun başladı !!");
                                }
                              });
                            if (isStartButtonVisible == true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GameStarted(),
                                ),
                              );
                            } else {
                              print("Tüm gemileri yerleştirmediniz");
                            }
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:battleships/gameStarted.dart';

import 'tempfornow.dart';
import 'package:battleships/map.dart';
import 'package:flutter/material.dart';
import 'package:battleships/shipsandrotate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            // child: Container(
            //   child: Padding(
            //     padding: const EdgeInsets.all(20.0),
            //     child: GridView.builder(
            //       physics: const NeverScrollableScrollPhysics(),
            //       itemCount: numberOfSquares,
            //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 10,
            //       ),
            //       itemBuilder: (
            //         BuildContext context,
            //         int index,
            //       ) {
            //         return Padding(
            //           padding: const EdgeInsets.all(2.0),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(6),
            //             child: Container(
            //               color: Colors.blue[100],
            //               child: Text(
            //                 isHit.toString(),
            //                 style: const TextStyle(
            //                   fontSize: 25,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
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
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameStarted())),
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
                      ),
                    ),
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

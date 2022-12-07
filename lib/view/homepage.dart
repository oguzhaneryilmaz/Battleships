import 'package:battleships/firebase_database_functions.dart';
import 'package:battleships/view/map.dart';
import 'package:battleships/wait_page.dart';
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
                          const SizedBox(
                            width: 40,
                          ),
                          Container(
                            width: 30,
                            child: const SmallShip(),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          Container(
                            width: 30,
                            child: const SmallShip2(),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Container(
                            width: 30,
                            child: const BigShip(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                          child: Container(
                            color: Colors.red,
                            child: const Text(
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
                                isSmallVisible == true) {
                              setState(() {
                                {
                                  isStartButtonVisible = true;
                                  print("Oyun başladı !!");

                                  // ALTTAKİ YORUM SATIRLARI
                                  // GEMİLER YERLEŞTİRİLDİKTEN SONRA START TUŞUNA BASINCA
                                  // testInteger DEĞERİNİ ARTTIRARAK _test DEĞİŞKENİNİN
                                  // İÇİNE ATIYOR VE REALTİME DATABASE DE GÖSTERİYOR

                                  //
                                  createTest();

                                  //shipPlacement();

                                  //

                                }
                              });
                            }
                            if (isStartButtonVisible == true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WaitPage(),
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

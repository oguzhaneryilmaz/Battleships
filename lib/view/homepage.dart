import '../firebase_database_functions.dart';
import '../wait_page.dart';
import '../view/map.dart';
import '../viewmodel/shipsandrotate.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://raw.githubusercontent.com/SimformSolutionsPvtLtd/battleship_flutter_flame/master/assets/images/background.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 72.5,
                  vertical: 8.0,
                ),
                child: MyMap(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                            const SizedBox(
                              width: 100,
                            ),
                            Container(
                              width: 30,
                              child: const BigShip2(),
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
                                    createTest();
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
      ),
    );
  }
}

import 'package:battleships/view/homepage.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "MAIN MENU",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Text(
                    "PLAY",
                    style: TextStyle(fontSize: 30, color: Colors.amber),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

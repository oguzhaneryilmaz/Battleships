import 'package:battleships/homepage.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Column(
          children: [
            Expanded(
              child: Text("qwe"),
            ),
            Expanded(
              child: Text("qwe"),
            ),
            Expanded(
              child: GestureDetector(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      ),
                  child: Text("S O N")),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:battleships/firebase_database_functions.dart';
import 'package:battleships/global_enough_player.dart';
import 'package:battleships/view/gameStarted.dart';
import 'package:battleships/viewmodel/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'enough_player.dart';

class WaitPage extends StatefulWidget {
  const WaitPage({super.key});

  @override
  State<WaitPage> createState() => _WaitPageState();
}

class _WaitPageState extends State<WaitPage> {
  final enoughPlayer = EnoughPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Waiting for an opponent",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const MainMenu()),
                        ),
                      );
                    },
                    child: const Icon(Icons.close)),
                const SizedBox(
                  height: 20,
                ),
                if (globalEnoughPlayer.playerEnough)
                  TextButton(
                    onPressed: () {
                      playerMatch();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GameStarted(),
                          ));
                    },
                    child: const Text("Game Found"),
                  ),
                if (!globalEnoughPlayer.playerEnough)
                  const Text('Waiting Second Player...'),
                /*IgnorePointer(
                  ignoring: playerEnough,
                  child: TextButton(
                    onPressed: () {
                      playerMatch();
                    },
                    child: Text("Game Found"),
                  ),
                ),*/
              ]),
        );
      }),
    );

    /* SafeArea(
      child: 
    );*/
  }
}

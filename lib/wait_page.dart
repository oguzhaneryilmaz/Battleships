import 'package:restart_app/restart_app.dart';

import '../firebase_database_functions.dart';
import '../global_enough_player.dart';
import '../view/gameStarted.dart';
import '../viewmodel/main_menu.dart';
import 'enough_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
                TextButton(
                  child: const Text(
                    "CANCEL",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    cancelGame(context);

                    Restart.restartApp();
                  },
                ),
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
              ]),
        );
      }),
    );
  }
}

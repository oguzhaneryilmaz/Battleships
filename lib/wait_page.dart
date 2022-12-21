import 'package:restart_app/restart_app.dart';
import 'package:animated_background/animated_background.dart';

import '../firebase_database_functions.dart';
import '../global_enough_player.dart';
import '../view/gameStarted.dart';
import 'enough_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class WaitPage extends StatefulWidget {
  const WaitPage({super.key});

  @override
  State<WaitPage> createState() => _WaitPageState();
}

class _WaitPageState extends State<WaitPage> with TickerProviderStateMixin {
  final enoughPlayer = EnoughPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return AnimatedBackground(
          behaviour: BubblesBehaviour(
              options: const BubbleOptions(
            bubbleCount: 6,
          )),
          vsync: this,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Waiting for an opponent",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue.shade200,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (!globalEnoughPlayer.playerEnough)
                    TextButton(
                      child: Text(
                        "CANCEL",
                        style: TextStyle(
                            fontSize: 20, color: Colors.blue.shade300),
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
                    Text(
                      'Waiting Second Player...',
                      style: TextStyle(color: Colors.blue.shade400),
                    ),
                ]),
          ),
        );
      }),
    );
  }
}

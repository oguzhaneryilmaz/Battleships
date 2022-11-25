import 'package:battleships/firebase_database_functions.dart';
import 'package:battleships/global_enough_player.dart';
import 'package:battleships/global_is_hit_ship.dart';
import 'package:battleships/view/gameStarted.dart';
import 'package:battleships/view/homepage.dart';
import 'package:battleships/viewmodel/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'enough_player.dart';
import 'is_ship_hit.dart';
import 'package:battleships/viewmodel/defineLists.dart';
import 'firebase_database_functions.dart';

class waitPage extends StatefulWidget {
  const waitPage({super.key});

  @override
  State<waitPage> createState() => _waitPageState();
}

class _waitPageState extends State<waitPage> {
  final enoughPlayer = EnoughPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Waiting for an opponent",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => mainMenu()),
                      ),
                    );
                  },
                  child: Icon(Icons.close)),
              if (globalEnoughPlayer.playerEnough)
                TextButton(
                  onPressed: () {
                    if (player == whoseTurn) {
                      isHitShip.didShipHit = true;
                    }
                    playerMatch();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameStarted(),
                        ));
                  },
                  child: Text("Game Found"),
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
            ]);
      }),
    );

    /* SafeArea(
      child: 
    );*/
    ;
  }
}

import 'package:battleships/viewmodel/main_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global_enough_player.dart';
import '../viewmodel/defineLists.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';
import 'package:restart_app/restart_app.dart';

late String whoseTurnId;
var randomNum = const Uuid();
var uniqueRoom = randomNum.v1();

late Map dataAsMap;
late Map shipLocationAsMap;
String player = randomNum.v4();
Map testDataAsMap = {};
String testString = "Nickname";
int testInteger = trueSelectedBig.length +
    trueSelectedSmall.length +
    trueSelectedSmall2.length +
    trueSelectedBig2.length;
createTest() {
  globalEnoughPlayer.initBase();
  databasePlayerList.insert(0, player);
  DatabaseReference p1 =
      FirebaseDatabase.instance.ref().child('Waiting-room/$player');
  p1.set(testString);
  DatabaseReference bigShipLocation = FirebaseDatabase.instance
      .ref()
      .child("Waiting-room/${databasePlayerList[0]}/BigShipLocation");
  bigShipLocation.set(dummyListBig);
  DatabaseReference bigShip2Location = FirebaseDatabase.instance
      .ref()
      .child("Waiting-room/${databasePlayerList[0]}/BigShip2Location");
  bigShip2Location.set(dummyListBig2);
  DatabaseReference smallShipLocation = FirebaseDatabase.instance
      .ref()
      .child("Waiting-room/${databasePlayerList[0]}/SmallShipLocation");
  smallShipLocation.set(dummyListSmall);
  DatabaseReference smallShip2Location = FirebaseDatabase.instance
      .ref()
      .child("Waiting-room/${databasePlayerList[0]}/SmallShip2Location");
  smallShip2Location.set(dummyListSmall2);

  DatabaseReference ref = FirebaseDatabase.instance.ref('Waiting-room');
  ref.onValue.listen((DatabaseEvent event) {
    final data = event.snapshot.value;

    dataAsMap = data as Map;
    for (var key in dataAsMap.keys) {
      if (!databasePlayerList.contains(key)) {
        databasePlayerList.insert(0, key);
      }
    }
    if (databasePlayerList.length >= 2) {
      globalEnoughPlayer.playerEnoughChange(true);
      if (player != databasePlayerList[0]) {
        shipLocationAsMap = dataAsMap[databasePlayerList[0]];

        enemyBigShipLocation = List.from(shipLocationAsMap['BigShipLocation']);
        enemyBigShip2Location =
            List.from(shipLocationAsMap['BigShip2Location']);
        enemySmallShipLocation =
            List.from(shipLocationAsMap['SmallShipLocation']);
        enemySmallShip2Location =
            List.from(shipLocationAsMap['SmallShip2Location']);
      }
    } else {
      globalEnoughPlayer.playerEnoughChange(false);
    }
  });

  // whose turn kısmı

  FirebaseDatabase.instance.ref().child('Whose-turn').set(player);

  DatabaseReference ref1 = FirebaseDatabase.instance.ref('Whose-turn');
  ref1.onValue.listen((DatabaseEvent event1) {
    whoseTurnId = event1.snapshot.value as String;

    if (whoseTurnId != player) {
      globalWhoseTurn.turnWhoseChange(true);
    } else {
      globalWhoseTurn.turnWhoseChange(false);
    }
  });
}

remainingHits() {
  late int databaseRemainHitsA;
  late int databaseRemainHitsB;
  DatabaseReference test2 =
      FirebaseDatabase.instance.ref().child("Game-Room-1/rH-$player");
  testInteger--;
  test2.set(testInteger);
  DatabaseReference ref2 =
      FirebaseDatabase.instance.ref("Game-Room-1/rH-${databasePlayerList[0]}");
  ref2.onValue.listen((eventA) {
    databaseRemainHitsA = eventA.snapshot.value as int;
  });
  DatabaseReference ref3 =
      FirebaseDatabase.instance.ref("Game-Room-1/rH-${databasePlayerList[1]}");
  ref3.onValue.listen((eventB) {
    databaseRemainHitsB = eventB.snapshot.value as int;
  });
  DatabaseReference ref4 = FirebaseDatabase.instance.ref("Game-Room-1");
  ref4.onValue.listen((eventC) {
    if (databaseRemainHitsA == 0) {
      if (player == databasePlayerList[0]) {
        globalGameFinished.changeDidUWin(true);
        globalWhoseTurn.turnWhoseChange(false);
      } else {
        globalGameFinished.changeDidULose(true);
        globalWhoseTurn.turnWhoseChange(false);
      }
    }
    if (databaseRemainHitsB == 0) {
      if (player == databasePlayerList[1]) {
        globalGameFinished.changeDidUWin(true);
        globalWhoseTurn.turnWhoseChange(false);
      } else {
        globalGameFinished.changeDidULose(true);
        globalWhoseTurn.turnWhoseChange(false);
      }
    }
  });
}

cancelGame(BuildContext context) {
  FirebaseDatabase.instance
      .ref()
      .child('Waiting-room/${databasePlayerList[0]}')
      .remove();
  FirebaseDatabase.instance.ref().child('Whose-turn').remove();
  databasePlayerList.remove(player);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const MainMenu(),
    ),
  );
}

finishGame() {
  FirebaseDatabase.instance.ref().child('Game-Room-1').remove();
  FirebaseDatabase.instance.ref().child('Whose-turn').remove();
  FirebaseDatabase.instance
      .ref()
      .child('Waiting-room/${databasePlayerList[0]}')
      .remove();

  FirebaseDatabase.instance
      .ref()
      .child('Waiting-room/${databasePlayerList[1]}')
      .remove();
  Restart.restartApp();
}

playerMatch() {
  FirebaseDatabase.instance
      .ref()
      .child('Game-Room-1/p1/Player ID')
      .set(databasePlayerList[0]);

  DatabaseReference matchedP1ShipLocs =
      FirebaseDatabase.instance.ref().child('Game-Room-1/p1/ShipLocations');
  matchedP1ShipLocs.set(dataAsMap[databasePlayerList[0]]);
  FirebaseDatabase.instance
      .ref()
      .child('Game-Room-1/p2/Player ID')
      .set(databasePlayerList[1]);
  DatabaseReference matchedP2ShipLocs =
      FirebaseDatabase.instance.ref().child('Game-Room-1/p2/ShipLocations');

  matchedP2ShipLocs.set(dataAsMap[databasePlayerList[1]]);
}

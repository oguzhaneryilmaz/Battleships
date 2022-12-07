import 'package:battleships/global_enough_player.dart';
import 'package:battleships/viewmodel/defineLists.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

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
    trueSelectedSmall2.length;
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
        enemySmallShipLocation =
            List.from(shipLocationAsMap['SmallShipLocation']);
        enemySmallShip2Location =
            List.from(shipLocationAsMap['SmallShip2Location']);
        // print(
        //     'DÜŞMAN BİG SHİP : $enemyBigShipLocation \n DÜŞMAN SMALL SHİP : $enemySmallShipLocation \nDÜŞMAN SMALL SHİP 2 : $enemySmallShip2Location');

      }
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
        print("OYUNU KAZANDINIZ");
      } else {
        print("OYUNU KAYBETTİNİZ");
      }
    }
    if (databaseRemainHitsB == 0) {
      if (player == databasePlayerList[1]) {
        print("OYUNU KAZANDINIZ");
      } else {
        print("OYUNU KAYBETTİNİZ");
      }
    }
  });
}

// shipPlacement() {
//   DatabaseReference bigShipLoc = FirebaseDatabase.instance
//       .ref()
//       .child("Waiting-room/${databasePlayerList.length - 1}");
//   bigShipLoc.set(dummyListBig);
//   DatabaseReference smallShipLoc = FirebaseDatabase.instance
//       .ref()
//       .child("Waiting-room/${databasePlayerList.length - 1}");
//   smallShipLoc.set(dummyListSmall);
//   DatabaseReference smallShip2Loc = FirebaseDatabase.instance
//       .ref()
//       .child("Waiting-room/${databasePlayerList.length - 1}");
//   smallShip2Loc.set(dummyListSmall2);
// }

finishGame() {
  // FirebaseDatabase.instance.ref().child("room$uniqueRoom").remove();
}

playerMatch() {
  // if (databasePlayerList.length >= 2) {
  //   FirebaseDatabase.instance
  //       .ref()
  //       .child("Testing-room/${databasePlayerList[0]}");
  //   FirebaseDatabase.instance
  //       .ref()
  //       .child("game-room-UNİQUENUMBER/${databasePlayerList[0]}");
  //   FirebaseDatabase.instance
  //       .ref()
  //       .child("Testing-room/${databasePlayerList[1]}");
  //   FirebaseDatabase.instance
  //       .ref()
  //       .child("game-room-UNİQUENUMBER/${databasePlayerList[1]}");
  // } else {
  //   print("rakip bekleniyor");
  //   DatabaseReference fetchData = FirebaseDatabase.instance.ref('Testing-room');
  //   fetchData.onValue.listen((event) {
  //     final data = event.snapshot.value;
  //     databasePlayerList.insert(0, data);
  //     DatabaseReference listAddPlayer =
  //         FirebaseDatabase.instance.ref().child("Waiting-room");
  //     listAddPlayer.set(databasePlayerList);Game-Room-1
  //     FirebaseDatabase.instance.ref('Testing-room').remove();
  //   });
  // }

  if (databasePlayerList.length >= 2) {
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
    // FirebaseDatabase.instance
    //     .ref()
    //     .child('Waiting-room/${databasePlayerList[0]}')
    //     .remove();
    // FirebaseDatabase.instance
    //     .ref()
    //     .child('Waiting-room/${databasePlayerList[1]}')
    //     .remove();
    //   print('DATABASE PLAYER LİST : $databasePlayerList');
    //   databasePlayerList.clear();
    //   print('DATABASE PLAYER LİST : $databasePlayerList');
    // } else {
    //   print("rakip bekleniyor");
  }
}

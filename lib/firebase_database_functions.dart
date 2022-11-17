import 'package:battleships/enough_player.dart';
import 'package:battleships/global_enough_player.dart';
import 'package:battleships/viewmodel/defineLists.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

var randomNum = const Uuid();
var uniqueRoom = randomNum.v1();
late Map dataAsMap;
late Map shipLocationAsMap;
String player = randomNum.v4();

String testString = "Nickname";
int testInteger = trueSelectedBig.length +
    trueSelectedSmall.length +
    trueSelectedSmall2.length;
createTest() {
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
    print('FİRST FETCH DATA : $data');

    dataAsMap = data as Map;

    print('DATA THAT TRANSFORMED TO MAP : ${dataAsMap.keys}');
    dataAsMap.keys.forEach((key) {
      if (key != player) {
        databasePlayerList.insert(0, key);
      }
    });

    if (databasePlayerList.length >= 2) {
      globalEnoughPlayer.playerEnoughChange(true);
    } else {
      globalEnoughPlayer.playerEnoughChange(false);
    }
    print('DATABASE PLAYER LİST : $databasePlayerList');
  });
}

remainingHits() {
  DatabaseReference _test2 = FirebaseDatabase.instance
      .ref()
      .child("room$uniqueRoom/p$player/Kalan vuruş");
  testInteger--;
  _test2.set(testInteger);
  if (testInteger == 0) {
    finishGame();
  }
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
  //     listAddPlayer.set(databasePlayerList);
  //     FirebaseDatabase.instance.ref('Testing-room').remove();
  //   });
  // }

  if (databasePlayerList.length >= 2) {
    var uniqueGame = uniqueRoom;
    DatabaseReference p1 =
        FirebaseDatabase.instance.ref().child('$uniqueGame/p1');
    p1.set(databasePlayerList[0]);

    DatabaseReference matchedP1BigShipLoc =
        FirebaseDatabase.instance.ref().child('$uniqueGame/p1/BigShipLocation');
    matchedP1BigShipLoc.set(FirebaseDatabase.instance
        .ref()
        .child("Waiting-room/${databasePlayerList[0]}/BigShipLocation")
        .get());
    DatabaseReference p2 =
        FirebaseDatabase.instance.ref().child('$uniqueGame/p2');
    p2.set(databasePlayerList[1]);

    FirebaseDatabase.instance
        .ref()
        .child('Waiting-room/${databasePlayerList[0]}')
        .remove();
    FirebaseDatabase.instance
        .ref()
        .child('Waiting-room/${databasePlayerList[1]}')
        .remove();
    print('DATABASE PLAYER LİST : $databasePlayerList');
    databasePlayerList.clear();
    print('DATABASE PLAYER LİST : $databasePlayerList');
  } else {
    print("rakip bekleniyor");
  }
}

import 'package:battleships/viewmodel/defineLists.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

var randomNum = const Uuid();
var uniqueRoom = randomNum.v1();
late Map snapshotAsMap;
late Map shipLocationAsMap;
String player = randomNum.v4();

String testString = "Nickname";
int testInteger = trueSelectedBig.length +
    trueSelectedSmall.length +
    trueSelectedSmall2.length;

createTest() async {
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
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('Waiting-room').get();
  if (snapshot.exists) {
    snapshotAsMap = snapshot.value as Map;
    print('snapshotasmap : $snapshotAsMap');
    snapshotAsMap.keys.forEach((key) {
      databasePlayerList.insert(0, key);
    });
    snapshotAsMap.values.forEach((value) {
      shipLocationAsMap = value as Map;
    });
  }
  snapshotAsMap = snapshot.value as Map;
  print('snapshotasmap : $snapshotAsMap');
  snapshotAsMap.keys.forEach((key) {
    databasePlayerList.insert(0, key);
  });
  snapshotAsMap.values.forEach((value) {
    shipLocationAsMap = value as Map;
  });

  print('ship location map values : ${shipLocationAsMap.values}');
  print('database player list : $databasePlayerList');
  print(databasePlayerList.length);
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
  } else {
    print("rakip bekleniyor");
  }
}

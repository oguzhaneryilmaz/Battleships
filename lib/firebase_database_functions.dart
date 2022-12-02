import 'package:battleships/enough_player.dart';
import 'package:battleships/global_enough_player.dart';
import 'package:battleships/viewmodel/defineLists.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

Map turnMap = {};
late String whoseTurn;
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
      shipLocationAsMap = dataAsMap[databasePlayerList[0]];
      if (player != databasePlayerList[0]) {
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

  DatabaseReference whoseTurnDatabase =
      FirebaseDatabase.instance.ref().child("Whose-turn");
  whoseTurnDatabase.set(databasePlayerList[0]);
  // tek seferlik veri çekmek lazım burdan
  // whose turn database degerini object? olarak çek
  // stringe çevir ve tekrar dene
  final ref1 = FirebaseDatabase.instance.ref();
  final snapshot = ref.child('Whose-turn').get();
  turnMap = snapshot as Map;
  print('OGUZHAN : $turnMap');
}

remainingHits() {
  // DatabaseReference _test2 = FirebaseDatabase.instance
  //     .ref()
  //     .child("room$uniqueRoom/p$player/Kalan vuruş");
  // testInteger--;
  // _test2.set(testInteger);
  // if (testInteger == 0) {
  //   finishGame();
  // }
}

finishGame() {
  // FirebaseDatabase.instance.ref().child("room$uniqueRoom").remove();
}

playerMatch() {
  if (databasePlayerList.length >= 2) {
    var uniqueGame = uniqueRoom;
    DatabaseReference p1 =
        FirebaseDatabase.instance.ref().child('Game-Room-${uniqueGame}/p1');
    p1.set(databasePlayerList[0]);
    FirebaseDatabase.instance
        .ref()
        .child('Game-Room-${uniqueGame}/p1/Player ID')
        .set(databasePlayerList[0]);

    DatabaseReference matchedP1ShipLocs = FirebaseDatabase.instance
        .ref()
        .child('Game-Room-${uniqueGame}/p1/ShipLocations');
    matchedP1ShipLocs.set(dataAsMap[databasePlayerList[0]]);
    DatabaseReference p2 =
        FirebaseDatabase.instance.ref().child('Game-Room-${uniqueGame}/p2');
    p2.set(databasePlayerList[1]);
    FirebaseDatabase.instance
        .ref()
        .child('Game-Room-${uniqueGame}/p2/Player ID')
        .set(databasePlayerList[1]);
    DatabaseReference matchedP2ShipLocs = FirebaseDatabase.instance
        .ref()
        .child('Game-Room-${uniqueGame}/p2/ShipLocations');
    matchedP2ShipLocs.set(dataAsMap[databasePlayerList[1]]);
    FirebaseDatabase.instance
        .ref()
        .child('Waiting-room/${databasePlayerList[0]}')
        .remove();
    FirebaseDatabase.instance
        .ref()
        .child('Waiting-room/${databasePlayerList[1]}')
        .remove();

    //   print('DATABASE PLAYER LİST : $databasePlayerList');
    //   databasePlayerList.clear();
    //   print('DATABASE PLAYER LİST : $databasePlayerList');
    // } else {
    //   print("rakip bekleniyor");
  }
}

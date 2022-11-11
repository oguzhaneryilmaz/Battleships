import 'package:battleships/viewmodel/defineLists.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

var randomNum = const Uuid();
var uniqueRoom = randomNum.v1();
int player1 = 1;

String testString = "Oyuncu 1";
int testInteger = trueSelectedBig.length +
    trueSelectedSmall.length +
    trueSelectedSmall2.length;

createTest() {
  DatabaseReference _test =
      FirebaseDatabase.instance.ref().child("room$uniqueRoom/p$player1/");

  _test.set(testString);
}

remainingHits() {
  DatabaseReference _test2 = FirebaseDatabase.instance
      .ref()
      .child("room$uniqueRoom/p$player1/Kalan vuruş");
  testInteger--;
  _test2.set(testInteger);
}

shipPlacement() {
  DatabaseReference bigShipLoc = FirebaseDatabase.instance
      .ref()
      .child("room$uniqueRoom/p$player1/Ships/Big Ship Location");
  bigShipLoc.set(dummyListBig);
  DatabaseReference smallShipLoc = FirebaseDatabase.instance
      .ref()
      .child("room$uniqueRoom/p$player1/Ships/Small Ship Location");
  smallShipLoc.set(dummyListSmall);
  DatabaseReference smallShip2Loc = FirebaseDatabase.instance
      .ref()
      .child("room$uniqueRoom/p$player1/Ships/Small Ship 2 Location");
  smallShip2Loc.set(dummyListSmall2);
}

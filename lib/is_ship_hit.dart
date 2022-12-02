import 'package:battleships/firebase_database_functions.dart';
import 'package:battleships/global_is_hit_ship.dart';
import 'package:battleships/viewmodel/defineLists.dart';
import 'package:mobx/mobx.dart';
import 'global_enough_player.dart';
part 'is_ship_hit.g.dart';

class IsShipHit = _IsShipHitBase with _$IsShipHit;

abstract class _IsShipHitBase with Store {
  @observable
  bool didShipHit = false;

  void didShipHitChange() {
    didShipHit = !didShipHit;
  }
}

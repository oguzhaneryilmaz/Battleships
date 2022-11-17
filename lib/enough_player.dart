import 'package:mobx/mobx.dart';
import 'package:battleships/viewmodel/defineLists.dart';
part 'enough_player.g.dart';

class EnoughPlayer = _EnoughPlayerBase with _$EnoughPlayer;

abstract class _EnoughPlayerBase with Store {
  @observable
  bool playerEnough = false;

  @action
  void playerEnoughChange(bool newPlayerEnough) {
    playerEnough = newPlayerEnough;
  }
}

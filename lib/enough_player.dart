import 'package:mobx/mobx.dart';
part 'enough_player.g.dart';

class EnoughPlayer = _EnoughPlayerBase with _$EnoughPlayer;

abstract class _EnoughPlayerBase with Store {
  @observable
  bool playerEnough = false;

  void playerEnoughChange(bool newPlayerEnough) {
    playerEnough = newPlayerEnough;
  }

  initBase() {
    playerEnough = false;
  }
}

import 'package:mobx/mobx.dart';
part 'game_finished.g.dart';

class GameFinished = _GameFinishedBase with _$GameFinished;

abstract class _GameFinishedBase with Store {
  @observable
  bool didUWin = false;
  bool didULose = false;

  void changeDidUWin(bool newDidUWin) {
    didUWin = newDidUWin;
  }

  void changeDidULose(bool newDidULose) {
    didULose = newDidULose;
  }
}

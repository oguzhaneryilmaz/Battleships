import 'package:mobx/mobx.dart';
part 'whose_turn.g.dart';

class WhoseTurn = _WhoseTurnBase with _$WhoseTurn;

abstract class _WhoseTurnBase with Store {
  @observable
  bool turnWhose = false;

  void turnWhoseChange(bool newWhoseTurn) {
    turnWhose = newWhoseTurn;
  }
}

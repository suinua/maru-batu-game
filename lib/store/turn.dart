import 'package:maru_batu_game/model/player_type.dart';

Function _update;

class Turn {
  static void init(Function update) {
    _update = update;
  }
  static PlayerType _turn = PlayerType.First;

  static PlayerType current() => _turn;

  static void change() {
    _turn = _turn == PlayerType.First ? PlayerType.Second : PlayerType.First;
    _update();
  }
}

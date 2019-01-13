import 'package:flutter/material.dart';
import 'package:maru_batu_game/game_screens.dart';
import 'package:maru_batu_game/store/first_player.dart';
import 'package:maru_batu_game/store/second_player.dart';
import 'package:maru_batu_game/store/trout_table.dart';

class GameAction {
  static void reset(context) {
    FirstPlayer.reset();
    SecondPlayer.reset();
    TroutTable.reset();

    //微妙
    Navigator.pop(context);
    Navigator.pop(context);
  }

  static void start(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return GameScreen.main();
      }),
    );
  }
}

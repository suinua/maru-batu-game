import 'package:flutter/material.dart';
import 'package:maru_batu_game/model/player_type.dart';
import 'package:maru_batu_game/view/main_game_screen.dart';
import 'package:maru_batu_game/view/result_game_screen.dart';
import 'package:maru_batu_game/view/start_game_screen.dart';

class GameScreen {
  static Widget start() => StartGameScreen();
  static Widget main() => MainGameScreen();
  static Widget result(PlayerType winPlayer) => ResultGameScreen(winPlayer: winPlayer);
}
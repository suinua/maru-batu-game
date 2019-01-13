import 'package:flutter/material.dart';
import 'package:maru_batu_game/game_screens.dart';
import 'package:maru_batu_game/view/main_game_screen.dart';
import 'package:maru_batu_game/view/start_game_screen.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GameScreen.start(),
  ));
}

import 'package:flutter/material.dart';
import 'package:maru_batu_game/model/player_type.dart';

class Piece {
  Piece(this.ownerType);
  final PlayerType ownerType;

  Color _color(){
    if (ownerType == PlayerType.First) return Colors.red;
    if (ownerType == PlayerType.Second) return Colors.blue;
    return Colors.white;
  }

  Widget asWidget() => Card(
    color: _color(),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(65.0),
    ),
    child: this.icon(),
  );

  Widget icon() => ownerType == PlayerType.First
      ? Icon(Icons.close,color: Colors.white)
      : Icon(Icons.radio_button_unchecked,color: Colors.white);
}

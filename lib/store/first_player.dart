import 'package:flutter/material.dart';
import 'package:maru_batu_game/model/piece.dart';
import 'package:maru_batu_game/model/player_type.dart';
import 'package:maru_batu_game/store/player_data.dart';
import 'package:maru_batu_game/store/turn.dart';

PlayerData _firstPlayer = PlayerData(PlayerType.First);

class FirstPlayer {
  static PlayerData playerData = _firstPlayer;

  static void reset() => playerData = PlayerData(PlayerType.First);

  static List<Piece> get hasPieces => playerData.hasPieces;

  static void removePiece(Piece piece) => playerData.hasPieces.remove(piece);

  static List<Widget> hasPiecesWidget() =>
      hasPieces.map((Piece piece) => _hasPieceWidget(piece)).toList();

  static Widget _hasPieceWidget(Piece piece) {
    bool isYourTurn = Turn.current() == playerData.type;

    Widget notDragPiece() {
      return Stack(
        alignment: Alignment(0, 0),
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            child: piece.asWidget(),
          ),
          Opacity(
            opacity: 0.6,
            child: Center(child: Icon(Icons.lock, size: 50)),
          ),
        ],
      );
    }

    Widget dragPiece() {
      return Draggable(
        data: piece,
        child: Container(
          height: 80,
          width: 80,
          child: piece.asWidget(),
        ),
        feedback: Container(
          height: 80,
          width: 80,
          child: piece.asWidget(),
        ),
      );
    }

    return isYourTurn ? dragPiece() : notDragPiece();
  }
}

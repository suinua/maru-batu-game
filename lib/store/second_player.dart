import 'package:flutter/material.dart';
import 'package:maru_batu_game/model/piece.dart';
import 'package:maru_batu_game/model/player_type.dart';
import 'package:maru_batu_game/store/player.dart';
import 'package:maru_batu_game/store/turn.dart';

Player _secondPlayer = Player(PlayerType.Second);

class SecondPlayer {
  static void reset() => _secondPlayer = Player(PlayerType.Second);
  static List<Piece> get hasPieces => _secondPlayer.hasPieces;

  static List<Widget> hasPiecesWidget() => hasPieces
      .map((Piece piece) => Turn.current() == PlayerType.Second
          ? _pieceWidget(piece)
          : _dummyPieceWidget(piece))
      .toList();

  static Widget _dummyPieceWidget(Piece piece) {
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
          child: Center(child: Icon(Icons.lock,size: 50)),
        ),
      ],
    );
  }

  static Widget _pieceWidget(Piece piece) {
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

  static void removePiece(Piece piece) => _secondPlayer.hasPieces.remove(piece);
}
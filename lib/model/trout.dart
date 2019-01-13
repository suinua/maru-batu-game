import 'package:flutter/material.dart';
import 'package:maru_batu_game/model/piece.dart';
import 'package:maru_batu_game/model/player_type.dart';
import 'package:maru_batu_game/model/post.dart';
import 'package:maru_batu_game/game_screens.dart';
import 'package:maru_batu_game/store/first_player.dart';
import 'package:maru_batu_game/store/second_player.dart';
import 'package:maru_batu_game/store/trout_table.dart';
import 'package:maru_batu_game/store/turn.dart';

class Trout {
  Trout(this.post) : this.setPiece = null;

  Post post;
  Piece setPiece;

  Widget asWidget(BuildContext context) => DragTarget(
        builder: (context, List<Piece> candidateData, rejectedData) {
          return Container(
            width: 80,
            height: 80,
            child: Card(
              child: setPiece == null ? Container() : setPiece.asWidget(),
            ),
          );
        },
        onWillAccept: (Piece piece) {
          return setPiece == null;
        },
        onAccept: (Piece piece) {
          setPiece = piece;

          if (setPiece.ownerType == PlayerType.First)
            FirstPlayer.removePiece(piece);
          if (setPiece.ownerType == PlayerType.Second)
            SecondPlayer.removePiece(piece);

          Turn.change();
          PlayerType winPlayer = TroutTable.winPlayer();

          bool isStacked = FirstPlayer.hasPieces.length == 0 &&
              SecondPlayer.hasPieces.length == 0;

          if (winPlayer == null) {
            if (isStacked) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return GameScreen.result(winPlayer);
                }),
              );
            }
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) {
                return GameScreen.result(winPlayer);
              }),
            );
          }
        },
      );
}

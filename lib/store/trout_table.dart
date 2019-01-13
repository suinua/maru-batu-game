import 'package:flutter/material.dart';
import 'package:maru_batu_game/model/player_type.dart';
import 'package:maru_batu_game/model/post.dart';
import 'package:maru_batu_game/model/trout.dart';

class TroutTable {
  static List<Trout> _table = [
    Trout(Post(3, 1)),
    Trout(Post(3, 2)),
    Trout(Post(3, 3)),
    //---------------
    Trout(Post(2, 1)),
    Trout(Post(2, 2)),
    Trout(Post(2, 3)),
    //---------------
    Trout(Post(1, 1)),
    Trout(Post(1, 2)),
    Trout(Post(1, 3))
  ];
  static void reset() {
    _table = [
      Trout(Post(3, 1)),
      Trout(Post(3, 2)),
      Trout(Post(3, 3)),
      //---------------
      Trout(Post(2, 1)),
      Trout(Post(2, 2)),
      Trout(Post(2, 3)),
      //---------------
      Trout(Post(1, 1)),
      Trout(Post(1, 2)),
      Trout(Post(1, 3))
    ];
  }
  static PlayerType winPlayer() {
    List<Trout> firstRow =
        _table.where((Trout trout) => trout.post.column == 1).toList();
    List<Trout> secondRow =
        _table.where((Trout trout) => trout.post.column == 2).toList();
    List<Trout> thirdRow =
        _table.where((Trout trout) => trout.post.column == 3).toList();

    List<Trout> firstColumn =
        _table.where((Trout trout) => trout.post.row == 1).toList();
    List<Trout> secondColumn =
        _table.where((Trout trout) => trout.post.row == 2).toList();
    List<Trout> thirdColumn =
        _table.where((Trout trout) => trout.post.row == 3).toList();

    bool isComplete(List<Trout> troutLine) {
      if (troutLine.where((Trout trout) => trout.setPiece == null).length !=
          0) {
        return false;
      }
      List<PlayerType> owners = <PlayerType>[];
      troutLine.forEach((Trout trout) {
        if (trout.setPiece == null) {
          owners.add(null);
        } else {
          owners.add(trout.setPiece.ownerType);
        }
      });

      if (owners.contains(PlayerType.First) &&
          owners.contains(PlayerType.Second)) {
        return false;
      }
      return true;
    }

    if (isComplete(firstRow)) return firstRow[0].setPiece.ownerType;
    if (isComplete(secondRow)) return secondRow[0].setPiece.ownerType;
    if (isComplete(thirdRow)) return thirdRow[0].setPiece.ownerType;

    if (isComplete(firstColumn)) return firstColumn[0].setPiece.ownerType;
    if (isComplete(secondColumn)) return secondColumn[0].setPiece.ownerType;
    if (isComplete(thirdColumn)) return thirdColumn[0].setPiece.ownerType;
    return null;
  }


  static Widget asWidget(BuildContext context) {
    Widget rowWidget(int column) {
      List<Trout> targetRow =
          _table.where((Trout trout) => trout.post.column == column).toList();
      return Row(
        mainAxisSize: MainAxisSize.min,
        children:
            targetRow.map((Trout trout) => trout.asWidget(context)).toList(),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        rowWidget(3),
        rowWidget(2),
        rowWidget(1),
      ],
    );
  }
}

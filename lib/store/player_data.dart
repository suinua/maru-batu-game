import 'package:maru_batu_game/model/piece.dart';
import 'package:maru_batu_game/model/player_type.dart';

class PlayerData {
  PlayerData(this.type) : this.hasPieces = [
    Piece(type),
    Piece(type),
    Piece(type),
  ];

  final PlayerType type;
  final List<Piece> hasPieces;
}
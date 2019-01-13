import 'package:flutter/material.dart';
import 'package:maru_batu_game/action/game_action.dart';
import 'package:maru_batu_game/model/player_type.dart';

class ResultGameScreen extends StatefulWidget {
  final PlayerType winPlayer;

  const ResultGameScreen({Key key, @required this.winPlayer}) : super(key: key);

  _ResultGameScreenState createState() => _ResultGameScreenState();
}

class _ResultGameScreenState extends State<ResultGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            messageWidget(toFirstPlayer: message(PlayerType.First),toSecondPlayer: message(PlayerType.Second)),
          ],
        ),
      ),
    );
  }

  String message(PlayerType playerType){
    if (widget.winPlayer == null) return '引き分け';
    if (widget.winPlayer == playerType) return 'あなたの勝ち';
    return 'あなたの負け';
  }

  Widget messageWidget({String toFirstPlayer, String toSecondPlayer}) {
    return Column(
      children: <Widget>[
        RotatedBox(
          quarterTurns: 2,
          child: Text(toSecondPlayer, style: TextStyle(fontSize: 40)),
        ),
        RaisedButton(
          onPressed: () => GameAction.reset(context),
          child: Text('もう一回'),
        ),
        Text(toFirstPlayer, style: TextStyle(fontSize: 40)),
      ],
    );
  }
}

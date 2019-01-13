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
            RotatedBox(
              quarterTurns: widget.winPlayer == PlayerType.First ? 0 : 2,
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => GameAction.reset(context),
                    child: Text('OK'),
                  ),
                  Text('あなたの勝ち！！！',style: TextStyle(fontSize: 40)),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

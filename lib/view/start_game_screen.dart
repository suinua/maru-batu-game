import 'package:flutter/material.dart';
import 'package:maru_batu_game/action/game_action.dart';

class StartGameScreen extends StatefulWidget {
  _StartGameScreenState createState() => _StartGameScreenState();
}

GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

class _StartGameScreenState extends State<StartGameScreen> {
  TextStyle _gameTitleStyle = TextStyle(fontSize: 60);
  TextStyle _startTextStyle = TextStyle(fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('○×ゲーム', style: _gameTitleStyle),
            Padding(padding: const EdgeInsets.only(bottom: 30)),
            RaisedButton(
              padding: const EdgeInsets.only(
                  right: 30, left: 30, top: 10, bottom: 10),
              color: Colors.orangeAccent,
              colorBrightness: Brightness.dark,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              onPressed: () => GameAction.start(context),
              child: Text('Start!!', style: _startTextStyle),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: deviceHeight,
        width: deviceWwidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.yellowAccent[100],
            Colors.greenAccent[100],
          ], transform: GradientRotation(24)),
        ),
      ),
    );
  }
}

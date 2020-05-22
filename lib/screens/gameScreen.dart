import 'package:catcatcher/components/catContainer.dart';
import 'package:flutter/material.dart';
import 'package:catcatcher/configuration/static.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

bool showCat = true;

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.yellowAccent[100],
            Colors.greenAccent[100],
          ], transform: GradientRotation(24)),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: deviceHeight * .65,
                    width: deviceWidth * .85,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CatContainer(
                              deviceHeight: deviceHeight,
                              deviceWidth: deviceWidth,
                              showCat: showCat,
                              onTap: () {
                                setState(() {
                                  showCat = !showCat;
                                });
                              },
                            ),
                            CatContainer(
                              deviceHeight: deviceHeight,
                              deviceWidth: deviceWidth,
                              showCat: showCat,
                              onTap: () {
                                setState(() {
                                  showCat = !showCat;
                                });
                              },
                            ),
                            CatContainer(
                              deviceHeight: deviceHeight,
                              deviceWidth: deviceWidth,
                              showCat: showCat,
                              onTap: () {
                                setState(() {
                                  showCat = !showCat;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

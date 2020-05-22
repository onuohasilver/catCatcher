import 'dart:math';

import 'package:catcatcher/components/catContainer.dart';
import 'package:catcatcher/components/errorContainer.dart';
import 'package:catcatcher/configuration/static.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

bool showCat = true;

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  getContainer(index, deviceHeight, deviceWidth) {
    return showCatList[index]
        ? CatContainer(
            deviceHeight: deviceHeight,
            deviceWidth: deviceWidth,
            showCat: showCatList[index],
            onTap: () {
              setState(() {
                int randomIndex = Random().nextInt(12);
                for (int index = 0; index < showCatList.length; index++) {
                  if (index == randomIndex) {
                    showCatList[index] = true;
                  } else {
                    showCatList[index] = false;
                  }
                }
              });
            },
          )
        : ErrorContainer(deviceHeight: deviceHeight, deviceWidth: deviceWidth);
  }

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
                    height: deviceHeight * .75,
                    width: deviceWidth * .85,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height:4),
                        buildRow(deviceHeight, deviceWidth, [0, 1, 2, 3, 4, 5]),
                        buildRow(
                            deviceHeight, deviceWidth, [6, 7, 8, 9, 10, 11]),
                        buildRow(deviceHeight, deviceWidth, [12,13,14,15,16,17]),
                        buildRow(deviceHeight, deviceWidth, [18, 19, 20, 21, 22, 23]),
                        buildRow(deviceHeight, deviceWidth, [24, 25, 26, 27, 28, 29]),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildRow(double deviceHeight, double deviceWidth, List<int> index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        getContainer(index[0], deviceHeight, deviceWidth),
        getContainer(index[1], deviceHeight, deviceWidth),
        getContainer(index[2], deviceHeight, deviceWidth),
        getContainer(index[3], deviceHeight, deviceWidth),
        getContainer(index[4], deviceHeight, deviceWidth),
        getContainer(index[5], deviceHeight, deviceWidth),
      ],
    );
  }
}

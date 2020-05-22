import 'dart:math';
import 'package:catcatcher/components/audio.dart';
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
              playSound();
              setState(() {
                score = score + 1;
                print(score);
                int randomIndex = Random().nextInt(15);
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
        : ErrorContainer(
            deviceHeight: deviceHeight,
            deviceWidth: deviceWidth,
            onTap: () {
              setState(() {
                score = score - 1;
              });
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
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
              Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    '$score',
                    style: TextStyle(fontSize: 40),
                  )),
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
                          SizedBox(height: 4),
                          buildRow(
                              deviceHeight, deviceWidth, [0, 1, 2,3]),
                          buildRow(
                              deviceHeight, deviceWidth, [4,5,6,7]),
                          buildRow(deviceHeight, deviceWidth,
                              [8,9,10,11]),
                          buildRow(deviceHeight, deviceWidth,
                              [12,13,14,15]),
                          
                        ],
                      )),
                ),
              )
            ],
          ),
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

      ],
    );
  }
}

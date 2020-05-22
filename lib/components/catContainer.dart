import 'package:flutter/material.dart';
import 'package:catcatcher/configuration/static.dart';

class CatContainer extends StatelessWidget {
  const CatContainer(
      {Key key,
      @required this.deviceHeight,
      @required this.deviceWidth,
      @required this.onTap,
      @required this.showCat})
      : super(key: key);

  final double deviceHeight;
  final double deviceWidth;
  final Function onTap;
  final showCat;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: deviceHeight * .09,
        width: deviceWidth * .12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: showCat ? Colors.transparent : Colors.transparent,
        ),
        child: AnimatedOpacity(
          duration: Duration(milliseconds:400),
          opacity: showCat?1.0:0,
                child: Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            child: InkWell(
              customBorder: CircleBorder(),
              child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  
                  backgroundImage: showCat?kcatImage:null),
              onTap: onTap,
              splashColor: Colors.yellowAccent,
            ),
          ),
        ),
      ),
    );
  }
}

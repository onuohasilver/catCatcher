import 'package:flutter/material.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({
    Key key,
    @required this.deviceHeight,
    @required this.deviceWidth,
    @required this.onTap
  }) : super(key: key);

  final double deviceHeight;
  final double deviceWidth;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: deviceHeight * .14,
        width: deviceWidth * .19,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.yellowAccent.withOpacity(.1)),
            borderRadius: BorderRadius.circular(14)),
        child: Material(
          borderRadius: BorderRadius.circular(100),
          color: Colors.transparent,
          child: InkWell(
              customBorder: CircleBorder(),
              onTap: onTap,
              splashColor: Colors.red),
        ),
      ),
    );
  }
}

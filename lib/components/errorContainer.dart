import 'package:flutter/material.dart';
class ErrorContainer extends StatelessWidget {
  const ErrorContainer({
    Key key,
    @required this.deviceHeight,
    @required this.deviceWidth,
  }) : super(key: key);

  final double deviceHeight;
  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
          height: deviceHeight * .09,
          width: deviceWidth * .12,
          decoration: BoxDecoration(border:Border.all(color:Colors.yellowAccent),borderRadius: BorderRadius.circular(14)),
          child: Material(
            borderRadius: BorderRadius.circular(100),
            // shape: CircleBorder(),
            color: Colors.transparent,
            child: InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                splashColor: Colors.red),
          ),
        ),
    );
  }
}

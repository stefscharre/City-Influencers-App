import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final double heightCircle;
  final double widthCircle;
  final String color;

  const CircleWidget(
      {Key? key,
      required this.heightCircle,
      required this.widthCircle,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color2 = HexColor(color);
    return Expanded(
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Positioned(
              left: 30.0,
              top: 30.0,
              child: Container(
                color: color2,
                height: heightCircle,
                width: widthCircle,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

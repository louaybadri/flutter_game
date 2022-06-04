import 'package:flutter/material.dart';

class MyTextStyle extends StatelessWidget {
  const MyTextStyle({Key? key, required this.text, this.winning=false}) : super(key: key);
  final bool winning;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color = !winning?Colors.blue[700]!:Colors.green[700]!,
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}

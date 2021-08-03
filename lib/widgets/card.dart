import 'package:flutter/material.dart';
import 'package:rock_scissor_paper/constants/colors.dart';

class Card extends StatelessWidget {
  final double height;
  final double width;
  final String? player1;
  final String? player2;

  Card({required this.height, required this.width, this.player1, this.player2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          colors: <Color>[GRADIENT_COLOR_START, GRADINET_COLOR_END],
          stops: <double>[0.0, 1.0],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text:
              TextSpan(text: player1, style: TextStyle(fontSize: 24), children: [
            TextSpan(
              text: "  vs ",
              style: TextStyle(fontSize: 18),
            ),
            TextSpan(
              text: player2,
              style: TextStyle(fontSize: 24),
            ),
          ]),
        ),
      ),
    );
  }
}

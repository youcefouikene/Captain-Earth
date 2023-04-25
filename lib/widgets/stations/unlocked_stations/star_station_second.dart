import 'package:flutter/material.dart';
import './unlock_station_2.dart';
import '../../shapes/colored_star.dart';


class ObtainedStarsForStation extends StatelessWidget {
  double width;

  ObtainedStarsForStation({required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(width, (width*0.9545454545454546).toDouble()),
          painter: UnlockedSecondStation(nbrStarsObtained: 0),
        ),
      ],
    );
  }
}
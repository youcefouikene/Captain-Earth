import 'package:flutter/material.dart';
import 'score_bar.dart';
import 'station_bar.dart';
import 'rectangle_button.dart';
import 'etoiles.dart';
import 'icon_button.dart';

class WinningBox extends StatelessWidget {
  final String station;
  final double pourcentage1;
  final double pourcentage2;
  final double pourcentageFont;
  final double pourcentageRaduis;
  final int stars;
  final int score;

  const WinningBox(
      {
        super.key,
        required this.pourcentage1,
        required this.pourcentage2,
        required this.pourcentageFont,
        required this.pourcentageRaduis,
        required this.score,
        required this.stars,
        required this.station,
      });

  CustomPainter choix() {
    if (stars == 0) {
      return RPSCustomPainter1();
    } else if (stars == 1) {
      return RPSCustomPainter2();
    } else if (stars == 2) {
      return RPSCustomPainter3();
    } else {
      return RPSCustomPainter4();
    }
  }
  String choixText() {
    if (stars == 0) {
      return 'Echec !';
    } else if (stars == 1) {
      return 'Bravo !';
    } else if (stars == 2) {
      return 'Bravo !';
    } else {
      return 'Excellent !';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * pourcentage1,
          height: MediaQuery.of(context).size.height * pourcentage2,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * pourcentageRaduis),
            border: Border.all(
              color: const Color(0xff135617),
              width: 3,
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              choixText(),
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * pourcentageFont,
                fontFamily: 'Atma',
                fontWeight: FontWeight.bold,
                color: const Color(0xff135617),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * (28 / 360),
                  bottom: MediaQuery.of(context).size.height * (16 / 360)),
              child: ScoreBar(
                  pourcentage1: (50 / 800),
                  pourcentage2: (41 / 360),
                  pourcentage3: (183 / 800),
                  pourcentage4: (41 / 360),
                  pourcentage5: (8 / 800),
                  pourcentageleaf: 0,
                  pourcentageFont: (20 / 800),
                  score: score,
                  pourcentageRaduis: (14 / 800)),
            ),
            StationBar(
                leaf: 'assets/images/leaf.png',
                pourcentage1: (50 / 800),
                pourcentage2: (41 / 360),
                pourcentage3: (183 / 800),
                pourcentage4: (41 / 360),
                pourcentage5: (8 / 800),
                pourcentageleaf: 0,
                pourcentageFont: (20 / 800),
                station: station,
                pourcentageRaduis: (14 / 800)),
          ]),
        ),
        Positioned(
          top: -MediaQuery.of(context).size.height * (50 / 360),
          child: CustomPaint(
            size: Size(
                (MediaQuery.of(context).size.width * (218 / 800)),
                (MediaQuery.of(context).size.height * (89.72 / 360))
                    .toDouble()),
            painter: choix(),
          ),
        ),
        Positioned(
          bottom: -MediaQuery.of(context).size.height * (20 / 360),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Iconbutton(
                  icon: const Icon(Icons.refresh),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * (25 / 800)),
              RectangleButton(
                  text: 'Suivant',
                  pourcentage1: (130 / 800),
                  pourcentage2: (39 / 360),
                  pourcentage3: 0,
                  pourcentageFont: (24 / 800),
                  pourcentageRaduis: (10 / 800))
            ],
          ),
        ),
      ],
    );
  }
}
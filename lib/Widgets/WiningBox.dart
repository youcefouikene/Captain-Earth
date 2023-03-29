import 'package:flutter/material.dart';
import 'package:projet_2cp/Widgets/ScoreBAR.dart';
import 'StationBar.dart';
import 'quizOption.dart';
import 'RectangleButton.dart';
import 'Etoiles.dart';
import 'Iconbutton.dart';

class WiningBox extends StatelessWidget {
  final String station;
  final double pourcentage1;
  final double pourcentage2;
  final double pourcentageFont;
  final double pourcentageRaduis;
  final int Stars;
  final int Score;

  WiningBox(
      {required this.pourcentage1,
      required this.pourcentage2,
      required this.pourcentageFont,
      required this.pourcentageRaduis,
      required this.Score,
      required this.Stars,
      required this.station,
      });

 CustomPainter choix() {
    if (Stars == 0) {
      return RPSCustomPainter1();
    } else if (Stars == 1) {
      return RPSCustomPainter2();
    } else if (Stars == 2) {
      return RPSCustomPainter3();
    } else {
      return RPSCustomPainter4();
    }
}
  String choixText() {
    if (Stars == 0) {
      return 'Echec !';
    } else if (Stars == 1) {
      return 'Bravo !';
    } else if (Stars == 2) {
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
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * pourcentageRaduis),
            border: Border.all(
              color: Color(0xff135617),
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
                color: Color(0xff135617),
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
                  score: Score,
                  pourcentageRaduis: (14 / 800)),
            ),
            StationBar(
                leaf: 'assets/leaf.png',
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
                  icon: Icon(Icons.refresh),
                  pourcentage: (43 / 800),
                  pourcentageMargin: 0),
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

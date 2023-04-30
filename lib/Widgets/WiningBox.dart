import 'package:flutter/material.dart';
import '../Widgets/ScoreBAR.dart';
import 'StationBar.dart';
import 'quizOption.dart';
import 'RectangleButton.dart';
import 'Etoiles1.dart';
import 'Iconbutton.dart';

class WiningBox extends StatelessWidget {
  final String station;
  final int Stars;
  final int Score;
  String refreshPath;

  WiningBox({
    required this.Score,
    required this.Stars,
    required this.station,
    required this.refreshPath,
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
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * (286 / 800),
            height: MediaQuery.of(context).size.height * (247 / 360),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * (43 / 800)),
              border: Border.all(
                color: Color(0xff135617),
                width: 3,
              ),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                choixText(),
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * (33 / 800),
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
                Container(
                    child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      //margin: EdgeInsets.only(bottom: 12.0),
                      width: MediaQuery.of(context).size.width * (43 / 800),
                      height: MediaQuery.of(context).size.width * (43 / 800),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFE84560),
                        border: Border.all(
                          color: Color(0xff752683),
                          width: 2,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, refreshPath);
                      },
                      icon: Icon(Icons.refresh),
                      iconSize: MediaQuery.of(context).size.width * 0.03,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                )),
                SizedBox(width: MediaQuery.of(context).size.width * (25 / 800)),
                Container(
                  width: MediaQuery.of(context).size.width * (130 / 800),
                  height: MediaQuery.of(context).size.height * (39 / 360),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * (10 / 800)),
                    border: Border.all(
                      color: Color(0xff7B2B85),
                      width: 3,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffE84560),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * (10 / 800) - 3),
                        //side: BorderSide(color: Color(0xff7B2B85)),
                      ),
                    ),
                    child: Text(
                      'Suivant',
                      style: TextStyle(
                        fontFamily: 'Atma',
                        fontSize:
                            MediaQuery.of(context).size.width * (20 / 800),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

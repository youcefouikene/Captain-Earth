import 'package:flutter/material.dart';
import 'package:projet_2cp/Widgets/RectangleButton.dart';

import '../../Screens/EndGamePage.dart';

class AnimalSauve extends StatelessWidget {
  Function() next;
  String animal;
  int score;
  int _width = 200;
  AnimalSauve({required this.animal, required this.next, required this.score});
  int Score() {
    if (score > 18) {
      score = 18;
    }
    return ((18 - score) * 2);
  }

  int Stars(int scoreDuJeu) {
    if (scoreDuJeu <= 3) {
      return 3;
    } else if (scoreDuJeu > 3 && scoreDuJeu <= 6) {
      return 2;
    } else if (scoreDuJeu > 6 && scoreDuJeu <= 12) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (animal.compareTo('assets/images/afrique/elephant.png') == 0) {
      _width = 245;
    } else {
      _width = 200;
    }
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/afrique/Background_Africa_1.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * (630 / 800),
              height: MediaQuery.of(context).size.height * (305 / 360),
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * (79 / 800)),
                border: Border.all(
                  color: Color(0xff135617),
                  width: 3,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //SizedBox(width: MediaQuery.of(context).size.width * (66/800),),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * (15 / 360),
                      ),
                      Text(
                        'Merci !',
                        style: TextStyle(
                          fontFamily: 'Atma',
                          fontWeight: FontWeight.w700,
                          fontSize:
                              MediaQuery.of(context).size.width * (48 / 800),
                          color: Color(0xff135617),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * (340 / 800),
                        child: Text(
                          'tu m\'as sauvé des mauvais chasseurs , maintenant je peux vivre libre dans la nature',
                          style: TextStyle(
                            fontFamily: 'Atma',
                            fontWeight: FontWeight.w500,
                            fontSize:
                                MediaQuery.of(context).size.width * (27 / 800),
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * (23 / 360),
                      ),
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
                            if (animal.compareTo(
                                    'assets/images/afrique/lion.png') ==
                                0) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EndGamePage(
                                      background:
                                          'assets/images/afrique/Background_Africa_1.png',
                                      score: Score(),
                                      stars: Stars(score - 6),
                                      station: 'Station 03',
                                      refreshPath: '/AfriqueMiniJeu',
                                    ),
                                  ));
                            } else {
                              next();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffE84560),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width *
                                          (10 / 800) -
                                      3),
                              //side: BorderSide(color: Color(0xff7B2B85)),
                            ),
                          ),
                          child: Text(
                            'Suivant',
                            style: TextStyle(
                              fontFamily: 'Atma',
                              fontSize: MediaQuery.of(context).size.width *
                                  (24 / 800),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Image.asset(animal),
                  Container(
                    width: MediaQuery.of(context).size.width * (_width / 800),
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: Image.asset(
                        animal,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

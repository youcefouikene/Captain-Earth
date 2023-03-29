import 'package:flutter/material.dart';
import 'RectangleButton.dart';

class WelcomeTextBox extends StatelessWidget {
  final String text;
  final String description;
  final double pourcentage1;
  final double pourcentage2;
  final double pourcentage3;
  /*final double pourcentage4;
  final double pourcentage5;
  final double pourcentage6;*/
  final double pourcentageFont;
  final String textButton;

  WelcomeTextBox(
      {required this.text,
      required this.description,
      required this.pourcentage1,
      required this.pourcentage2,
      required this.pourcentage3,
      /*required this.pourcentage4,
      required this.pourcentage5,
      required this.pourcentage6,*/
      required this.pourcentageFont,
      required this.textButton
      });

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * pourcentage3),
            width: MediaQuery.of(context).size.width * pourcentage1,
            height: MediaQuery.of(context).size.height * pourcentage2,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * (97 / 800)),
              border: Border.all(
                color: Color(0xff135617),
                width: 3,
              ),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.height*(22/360)),  
                  //margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*(22/360)),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontFamily: 'Atma',
                          fontSize:
                              MediaQuery.of(context).size.width * pourcentageFont,
                          color: Color(0xff134E49),
                        ),
                      ),
                    ),
                

                  Padding(
                    padding:  EdgeInsets.only(right:MediaQuery.of(context).size.width*(36/800),left: MediaQuery.of(context).size.width*(36/800)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Atma',
                          fontSize:
                              MediaQuery.of(context).size.width * pourcentageFont,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
              ],
            )),
          ),
          Positioned(
            bottom: -MediaQuery.of(context).size.height * (20/360),
            child: RectangleButton(
                text: textButton,
                pourcentage1: (130/800),
                pourcentage2: (39 / 360),
                pourcentage3: 0,
                pourcentageFont: (24 / 800),
                pourcentageRaduis: (10 / 800)),
          ),
        ]);
  }
}

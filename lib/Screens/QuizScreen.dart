import 'package:flutter/material.dart';
import '../Widgets/QuestionBox.dart';
import '../Widgets/PointBar.dart';
import '../Widgets/quizOption.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Widgets/Iconbutton.dart';
import 'dart:ui' as ui;


class QuizScreen extends StatelessWidget {
  late int score;
  final String question;
  final List<String> options;
  final  String background;


  QuizScreen({required this.score,required this.question,required this.options,required this.background,});
  
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(background),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height*0.08333333,
              left: MediaQuery.of(context).size.width*0.0336,
              child: Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Iconbutton(icon: Icon(Icons.music_note),pourcentage:(39/800) ,pourcentageMargin: (12/360),pourcentageIcon: 0.03),
                Iconbutton(icon: Icon(Icons.clear),pourcentage: (39/800), pourcentageMargin: (12/360),pourcentageIcon: 0.03),
              ]),
            ),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PointBar(score: this.score),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        QuestionBox(
                            text: question,
                            pourcentage1: 0.26625,
                            pourcentage2: 0.591666,
                            pourcentage3: 0.10125),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              quizOption(
                                  text:
                                      options[0],
                                  pourcentage1: 0.395,
                                  pourcentage2: 0.111111,
                                  pourcentage3: 0.04722,
                                  pourcentageFont: 0.02,
                                  pourcentageRaduis: 0.01875,
                                  TextFont: 'Atma',
                                  TextColor: Colors.black,
                                ),
                              quizOption(
                                  text:
                                      options[1],
                                  pourcentage1: 0.395,
                                  pourcentage2: 0.111111,
                                  pourcentage3: 0.0472,
                                  pourcentageFont: 0.02,
                                  pourcentageRaduis: 0.01875,
                                  TextFont: 'Atma',
                                  TextColor:Colors.black,
                                ),
                              quizOption(
                                  text:
                                      options[2],
                                  pourcentage1: 0.395,
                                  pourcentage2: 0.111111,
                                  pourcentage3: 0.0472,
                                  pourcentageFont: 0.02,
                                  pourcentageRaduis: 0.01875,
                                  TextFont: 'Atma',
                                  TextColor:Colors.black,
                                ),
                              quizOption(
                                  text:
                                      options[3],
                                  pourcentage1: 0.395,
                                  pourcentage2: 0.111111,
                                  pourcentage3: 0,
                                  pourcentageFont: 0.02,
                                  pourcentageRaduis: 0.01875,
                                  TextFont: 'Atma',
                                  TextColor:Colors.black,
                                ),
                            ]
                            ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
    
    );
  }
}

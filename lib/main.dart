import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_2cp/Widgets/ScoreBAR.dart';
import 'package:projet_2cp/Widgets/WiningBox.dart';
import 'Widgets/StationBar.dart';
import 'Screens/welcomeStationPage.dart';
import 'Widgets/ChooseBoxgame.dart';
import 'Screens/Quiz_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Widgets/WelcomeTextBox.dart';
import 'dart:ui' as ui;
import 'Screens/EndGamePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key})
  List<String> options = [
    'Walid',
    'La surchasse',
    'Destrucrion de leur habitat naturel ',
    'Le braconnage'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
          
          

            //Center(child: ChooseBoxgame(text: 'Quiz', pourcentage1: (241/800), pourcentage2: (161/360), pourcentage3: 0, pourcentageFont: (52/800), pourcentageRaduis: (40/800), TextFont: 'Atma', TextColor: Color(0xff135617), Stars: 3))

            EndGamePage(
                background: 'assets/images/Background_SouthAmerica_1.png',
                stars: 0,
                score: 1222,
                station: 'Station01',
              ),

        /*WelcomePage(
            background: 'assets/Background_SouthAmerica_1',
            avatar: 'assets/captain_earth_1.png',
            text: 'Bienvenue en Amérique du sud',
            description:
                ' Ici la moitié de la surface du continent est boisée !\n Avez-vous une idée de ce que sera notre mission ? ',
            pourcentage1: (477 / 800),
            pourcentage2: (298 / 360),
            pourcentage3: 0,
            pourcentageAvatar: (176 / 800),
            pourcentageFont: (28 / 800),
            textButton: 'Suivant'),*/

        /*QuizScreen(score: 1112, question: 'Quelles sont les raisons d’extinction des animaux ?', options: options, background: 'assets/images/Ocean.png')*/
    ),
    );
  }
}

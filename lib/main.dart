import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Screens/AcquisitionPage.dart';
import '../Screens/Classement.dart';
import '../Screens/DefiPage.dart';
import '../Screens/Defis/DefiClean/ScereenClean.dart';
import '../Screens/Defis/DefieProtectionEscargot/ScreenShoe.dart';
import '../Screens/MiniJeux/AmeriqueNordMiniJeu/dataAmerique.dart';
import '../Screens/MiniJeux/AsieMiniJeu/data.dart';
import '../Screens/MiniJeux/AsieMiniJeu/flipcardgame1.dart';
import '../Widgets/Afrique/AnimalSauve.dart';
import '../Screens/ChooseGamePage.dart';
import '../Screens/MiniJeux/OceanieMiniJeu.dart';
import '../Widgets/Iconbutton.dart';
import '../Widgets/ScoreBAR.dart';
import '../Widgets/WiningBox.dart';
import '../try.dart';
import 'Screens/Defis/DefiArrosageScreen/screenArrosage.dart';
import 'Screens/Defis/DefiVelo/ScreenVelo.dart';
import 'Screens/Defis/defiEau/screenEau.dart';
import 'Screens/Defis/defiEnergie/screenSwitch.dart';
import 'Screens/MiniJeux/AmeriqueNordMiniJeu/flipcardgame2.dart';
import 'Screens/Profil/AjouterProfilPage.dart';
import 'Screens/Profil/ChoisirProfilPage.dart';
import 'Screens/Profil/ChoseAvatar.dart';
import 'Screens/Profil/Profil.dart';
import 'Screens/WelcomePage.dart';
import 'Screens/help.dart';
import 'Screens/helpPageEu.dart';
import 'Screens/quiz/quiz.dart';
import 'Widgets/StationBar.dart';
import 'Screens/WelcomeStationPage.dart';
import 'Widgets/ChooseBoxgame2.dart';
import 'Screens/QuizScreen.dart';
import 'Widgets/WelcomeTextBox.dart';
import 'dart:ui' as ui;
import 'Screens/EndGamePage.dart';
import 'Widgets/Afrique/AfriqueSquareAnimal.dart';
import 'Widgets/Afrique/AfriqueAnimalOption.dart';
import 'Widgets/Afrique/ListeAfrica.dart';
import 'Screens/MiniJeux/AfriqueMiniJeu.dart';
import 'Screens/MiniJeux/throw_garbage.dart';
import 'Screens/MiniJeux/AmeriqueDuSudMiniJeu.dart';
import 'Widgets/Oceanie/Timer.dart';

//----------------------

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // body: BigQuiz(
        //   continentNumber: 1,
        // ),
        body: WelcomePage1(),
      ),
      routes: <String, WidgetBuilder>{
        '/WelcomeStation': (BuildContext context) => WelcomePage(),
        '/AfriqueMiniJeu': (BuildContext context) => AfriqueMiniJeu(),
        '/OceanieMiniJeu': (BuildContext context) => Oceanie_miniJeu(),
        '/AmeriqueSudMiniJeu': (BuildContext context) => Samerique_miniJeu(),
        '/EuropeMiniJeu': (BuildContext context) => ThrowGarbage(),
        '/AmeriqueNordMiniJeu': (BuildContext context) =>
            FlipCardGane(Level.Medium),
        '/AsieMiniJeu': (BuildContext context) => FlipCardGane1(Level1.Medium),
        '/QuizOceanie': (BuildContext context) => BigQuiz(continentNumber: 0),
        '/QuizAmeriqueNord': (BuildContext context) =>
            BigQuiz(continentNumber: 4),
        '/QuizAfrique': (BuildContext context) => BigQuiz(continentNumber: 2),
        '/QuizAsie': (BuildContext context) => BigQuiz(continentNumber: 1),
        '/QuizEurope': (BuildContext context) => BigQuiz(continentNumber: 3),
        '/QuizAmeriqueSud': (BuildContext context) =>
            BigQuiz(continentNumber: 5),
      },
    );
  }
}

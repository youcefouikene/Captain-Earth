import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:projet2cp/Screens/Classement.dart';
import 'package:projet2cp/Screens/YesGagnant.dart';
import 'Screens/EuropeInteractiveGame.dart';
import 'package:projet2cp/Screens/ChoisirProfil.dart';
import 'package:projet2cp/Screens/Profil.dart';
import 'package:projet2cp/Screens/WelcomePage.dart';
import 'Screens/Quiz_screen.dart';
import 'Screens/ChooseGamePage.dart';
import 'Screens/Map.dart';
import 'Screens/AcquisitionPage.dart';
import 'Screens/Defi.dart';
import 'Screens/SupprimerCompte.dart';
import 'Screens/JouerTrophetPage.dart';
import 'Screens/Station6/JouerMiniJeu6.dart';
import 'dart:ui' as ui;


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key})
  List<String> options =['Walid','La surchasse','Destrucrion de leur habitat naturel ','Le braconnage'];
  
  @override
  Widget build(BuildContext context) {
     String africa="assets/imagesSVG/AfricaBG.png";
    String ociania="assets/imagesSVG/ocianiaBackGround.png";
    String usa= "assets/imagesSVG/USABackGround.png";
    String southAmerica=" assets/imagesSVG/SouthAmericaBG.png";
    String asia="assets/imagesSVG/AsiaBG.png";
    
    return MaterialApp(
       home: Scaffold(
        body:JouerMiniJeu6(),
        //ChoisirProfil(const []),

       /* Profil(  
          username: "Mellissa",
          pathPhoto: "assets/images/avatar/AvatarStart.png",
          score: 152,
        ),*/
        //YesGagnant(),
        //Classement(),
        //Jouer(),
       // SupprimerCompte(),
        //Defi(),
        //AcquisitionPage(ptOcianie: 25, ptAsie: 12, ptAfrique:10, ptEurope:5, ptAmeriqueNord: 3, ptAmeriqueSud: 0,)
        // WelcomePage(), //ok
       // ChooseGamePage(pathBackGround:"assets/images/AfricaBG.png",EtoilesJeu:2,EtoilesQuiz:1 ), ok
     
      ),
    );
  }
}

/*
là ou il y a le boutton close normalement on irra à loading page puis quitter IMPORTANT 
*/ 
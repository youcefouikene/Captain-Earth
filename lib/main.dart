import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet2cp/Screens/ChoisirProfil.dart';
import 'package:projet2cp/Screens/Profil.dart';
import 'package:projet2cp/Screens/WelcomePage.dart';
import 'Screens/Quiz_screen.dart';
import 'Screens/ChooseGamePage.dart';
import 'Screens/Map.dart';
import 'Screens/Profil.dart';
import 'Screens/ChoisirProfil.dart';

//import 'package:flutter_svg/flutter_svg.dart';
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
        body:ChoisirProfil(),
        //Profil(),
        //ChooseGamePage(pathBackGround:"assets/images/AfricaBG.png",EtoilesJeu:2,EtoilesQuiz:1 ),
       //WelcomePage(),
        // Center(child: QuizScreen(score: 1112, question: 'Quelles sont les raisons d’extinction des animaux ?', options: options, background: 'assets/images/Ocean.png')),
      ),
    );
  }
}

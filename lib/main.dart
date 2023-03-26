import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Widgets/ChooseBoxgame.dart';
import 'Screens/Quiz_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

    return MaterialApp(

      home: Scaffold(
        body: Center(child: QuizScreen(score: 1112, question: 'Quelles sont les raisons d’extinction des animaux ?', options: options, background: 'assets/images/Ocean.png')),
      ),
    );
  }
}

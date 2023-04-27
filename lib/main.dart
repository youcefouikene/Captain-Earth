import 'package:captain_earth_app/games/games.dart';
import 'package:captain_earth_app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:firebase_core/firebase_core.dart';

import './backend/progress_controllers.dart';

import './backend/online_progress/firebase_options.dart';

late List<ChildProgress> children = [];
late bool isConnected;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  // ignore: deprecated_member_use
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  

  runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CaptainEarth(),
    ),
  );
}


class CaptainEarth extends StatefulWidget {

  const CaptainEarth({Key? key}) : super(key: key);

  @override
  State<CaptainEarth> createState() => _CaptainEarthState();
}

List<Question> qqsBank = [];

class _CaptainEarthState extends State<CaptainEarth> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return const BigQuiz(continentNumber: 0);
  }
}
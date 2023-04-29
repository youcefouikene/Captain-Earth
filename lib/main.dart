import 'package:captain_earth_app/games/games.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './signup/sign_up_2.dart';


import './backend/progress_controllers.dart';


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
    return SignUp2(screenWidth: screenWidth, screenHeight: screenHeight,);
  }
}
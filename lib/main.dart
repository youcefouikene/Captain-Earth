import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:firebase_core/firebase_core.dart';

import './backend/progress_controllers.dart';
import './backend/synchronization.dart';
import './backend/local_progress/local_progress.dart';
import './backend/online_progress/firebase_backend.dart';
import './backend/online_progress/firebase_options.dart';

import './signup/choose_profile.dart';
import './signup/signup.dart';

import './settings.dart';
import './constants.dart';

late List<ChildProgress> children = [];
late bool isConnected;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  // ignore: deprecated_member_use
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);

  isConnected = await InternetConnectionChecker().hasConnection;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  kUser = await prefs.getString('kUser') ?? 'guest';
  kLang = await prefs.getString('kLang') ?? 'fr';
  kLogin = await prefs.getBool('kLogin') ?? false;
  kSound = await prefs.getBool('kSound') ?? true;
  kLocalDate = await prefs.getString('kLocalDate') ?? '';


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  //! Online vs Local
  // ignore: unused_local_variable
  Future<List<ChildProgress>> online;
  Future<List<ChildProgress>> local;

  if (kLogin) {
    //! Modification
    if (isConnected) {
      /*
      // online = LocalProgress.getChildren(kUser);
      //! Get only children
      Future<List<ChildProgress>> c = OnlineProgress.getChildren(kUser);
      children = await c;
      //! if length != 0
      if (children.length != 0) {
        Future<String> d = OnlineProgress.getParentOnlineDate(kUser);
        kOnlineDate = await d;
        if (kOnlineDate.compareTo(kLocalDate) == 1) {
          //! Get All Children
          Future<List<ChildProgress>> ch = getFireBase(kUser);
          children = await ch;
          for (ChildProgress childProgress in children) {
            LocalProgress.addChild(kUser, childProgress);
          }
        } else if (kOnlineDate.compareTo(kLocalDate) == -1) {
          //! Get All Children
          Future<List<ChildProgress>> ch = getSQFLite(kUser);
          children = await ch;
          for (ChildProgress childProgress in children) {
            OnlineProgress.updateChild(childProgress);
          }
        } else {
          Future<List<ChildProgress>> ch = getSQFLite(kUser);
          children = await ch;
        }
        String date = DateTime.now().toString();
        prefs.setString('kLocalDate', date);
        OnlineProgress.updateParent(kUser, date);
        */
    } else {
      local = getSQFLite(kUser);
      children = await local;
    }
  }

  // Running the application
  //! if Local.date > Online.date
  //! Write Local to Online
  //! children = Local

  //? Else Online.date > Local.date
  //? Write Online to Local
  //? children = Online

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

class _CaptainEarthState extends State<CaptainEarth> {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return !kLogin ? SignUp() : ChooseProfile();
  }
}


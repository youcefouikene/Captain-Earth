// ignore_for_file: unused_local_variable, import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './create_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../backend/progress_controllers.dart';
import '../backend/synchronization.dart';
// import '../categories/themes_screen.dart';
import '../constants.dart';
import '../data/initializedThemes.dart';
import '../backend/local_progress/local_progress.dart';
import '../main.dart';
import '../backend/online_progress/firebase_backend.dart';
import '../progress/progress.dart';
import '../settings.dart';
import '../signup/choose_profile.dart';
import '../widgets.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Kcaffold(
      bottomLeft: false,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.all(screenHeight * .1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenHeight * .45,
                width: screenHeight * .45,
                // color: Colors.teal,
                child: SvgPicture.asset(
                  'assets/images/apple/${AppleStatus.hero}.svg',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: double.infinity, height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200.0,
                    child: Column(
                      children: [
                        Container(
                          width: 200.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF666666),
                                  offset: Offset(2, 2),
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                              color: white,
                              borderRadius: BorderRadius.circular(25.0)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(25.0),
                            onTap: () async {
                              if (isConnected) {
                                UserCredential? usr =
                                    await OnlineProgress.signInWithGooglee();
                                User user = FirebaseAuth.instance.currentUser!;
                                //! kOnline Date
                                kUser = user.email!
                                    .substring(0, user.email!.indexOf('@'));
                                Future<List<String>> p =
                                    OnlineProgress.getParentsNames();
                                List<String> parents = await p;
                                if (!parents.contains(kUser)) {
                                  OnlineProgress.createParent(kUser);
                                }
                                kLogin = true;
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString('kUser', kUser);
                                prefs.setBool('kLogin', true);
                                //! Get only children
                                Future<List<ChildProgress>> c =
                                    OnlineProgress.getChildren(kUser);
                                children = await c;
                                //! if length != 0
                                if (children.length != 0) {
                                  Future<String> d =
                                      OnlineProgress.getParentOnlineDate(kUser);
                                  kOnlineDate = await d;
                                  if (kOnlineDate.compareTo(kLocalDate) == 1) {
                                    //! Get All Children
                                    Future<List<ChildProgress>> ch =
                                        getFireBase(kUser);
                                    children = await ch;
                                    for (ChildProgress childProgress
                                        in children) {
                                      LocalProgress.addChild(
                                          kUser, childProgress);
                                    }
                                  } else if (kOnlineDate
                                          .compareTo(kLocalDate) ==
                                      -1) {
                                    //! Get All Children
                                    Future<List<ChildProgress>> ch =
                                        getSQFLite(kUser);
                                    children = await ch;
                                    for (ChildProgress childProgress
                                        in children) {
                                      OnlineProgress.updateChild(childProgress);
                                    }
                                  }
                                  String date = DateTime.now().toString();
                                  prefs.setString('kLocalDate', date);
                                  OnlineProgress.updateParent(kUser, date);
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChooseProfile()));
                              }
                            },
                            child: Center(
                              child: Text(
                                kLang == 'en' ? 'Sign up' : "S'inscrire",
                                style: TextStyle(
                                  color: themeClr,
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: double.infinity, height: 10.0),
                        Text(kLang == 'en' ? 'For parents' : 'Pour les parents',
                            style: TextStyle(color: white, fontSize: 15.0)),
                      ],
                    ),
                  ),
                  SizedBox(width: 50),
                  Container(
                    width: 200.0,
                    child: Column(
                      children: [
                        Container(
                          width: 200.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF666666),
                                  offset: Offset(2, 2),
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                              color: white,
                              borderRadius: BorderRadius.circular(25.0)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(25.0),
                            onTap: () async {
                              WidgetsFlutterBinding.ensureInitialized();
                              age = 7;
                              kUser = 'guest';
                              Future<List<ChildProgress>> g =
                                  getSQFLite('guest');
                              List<ChildProgress> gst = await g;
                              if (gst.length == 0) {
                                childProgress = ChildProgress(
                                  childName: 'guest',
                                  password: 'guest',
                                  parent: 'guest',
                                  age: 7,
                                  avatar: -1,
                                  trophie: 0,
                                  stars: 0,
                                  badge: 0,
                                  theme: 0,
                                  game: 2,
                                  themes: initThemesProgress,
                                );
                                LocalProgress.addChild(kUser, childProgress);
                              } else {
                                childProgress = gst[0];
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ThemesScreen()));
                            },
                            child: Center(
                              child: Text(
                                kLang == 'en' ? 'Play' : 'Jouer',
                                style: TextStyle(
                                  color: themeClr,
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: double.infinity, height: 10.0),
                        Text(
                          kLang == 'en' ? 'As a guest' : "En tant qu'invité",
                          style: TextStyle(color: white, fontSize: 15.0),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pommy/categories/themes_screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pommy/backend/progress_controllers.dart';
import 'package:pommy/categories/modes_screen.dart';
import 'package:pommy/constants.dart';
import 'package:pommy/main.dart';
import 'package:pommy/backend/online_progress/firebase_backend.dart';
import 'package:pommy/progress/progress.dart';
import 'package:pommy/settings.dart';
import 'package:pommy/signup/create_profile.dart';
import 'package:pommy/widgets.dart';

class ChooseProfile extends StatefulWidget {
  const ChooseProfile({Key? key}) : super(key: key);

  @override
  State<ChooseProfile> createState() => _ChooseProfileState();
}

class _ChooseProfileState extends State<ChooseProfile> {
  void loadChildren() async {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Kcaffold(
      topLeft: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: CircleButton(
          icon: 'goto',
          toDo: () async {
            OnlineProgress.signOutWithGooglee();
            kLogin = false;
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool('kLogin', false);
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // if none profile is created it shows Add profile
              Text(
                children.length > 0
                    ? kLang == 'en'
                        ? 'Choose a profile'
                        : 'Choisir un profil'
                    : kLang == 'en'
                        ? 'Create a profile'
                        : 'Créer un profil',
                style: TextStyle(
                  fontSize: 35,
                  color: themeClr,
                ),
              ),
              SizedBox(height: 30.0),
              // SizedBox(height: screenHeight * .15),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ...List.generate(
                    children.length,
                    (index) => ProfileDoor(
                      childProgres: children[index],
                    ),
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          //! Add a new child
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChildNameScreen()));
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            boxShadow: bxShd6,
                            border: Border.all(
                              width: 4.0,
                              color: white,
                            ),
                            shape: BoxShape.circle,
                            color: themeClr,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 35,
                                color: white,
                              ),
                              Text(
                                kLang == 'en' ? 'Add' : 'Ajouter',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Add',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.transparent, // Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDoor extends StatelessWidget {
  final ChildProgress childProgres;
  ProfileDoor({required this.childProgres});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        age = this.childProgres.age;
        childProgress = this.childProgres;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    childProgres.age >= 6 ? ModesScreen() : ThemesScreen()));
      },
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              boxShadow: bxShd6,
              border: Border.all(
                width: 4.0,
                color: themeClr,
              ),
              shape: BoxShape.circle,
              color: avatrBg(childProgres.avatar),
            ),
            child: SvgPicture.asset(
              'assets/icons/avatars/${childProgres.avatar}.svg',
              fit: BoxFit.contain,
            ),
          ),
          Text(
            childProgres.childName,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

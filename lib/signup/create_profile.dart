import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pommy/backend/progress_controllers.dart';
import 'package:pommy/data/initializedThemes.dart';
import 'package:pommy/backend/local_progress/local_progress.dart';
import 'package:pommy/main.dart';
import 'package:pommy/backend/online_progress/firebase_backend.dart';
import 'package:pommy/settings.dart';
import 'package:pommy/signup/choose_profile.dart';
import 'package:pommy/widgets.dart';
import 'package:pommy/constants.dart';
import 'package:pommy/signup/consts.dart';
import 'package:pommy/widgets/custom_page_route.dart';

String childName = '';
int age = -1, selectedAvatar = -1;

class ChildNameScreen extends StatefulWidget {
  const ChildNameScreen({Key? key}) : super(key: key);

  @override
  _ChildNameScreenState createState() => _ChildNameScreenState();
}

class _ChildNameScreenState extends State<ChildNameScreen> {
  bool focus = false;
  @override
  Widget build(BuildContext context) {
    return Kcaffold(
      topLeft: NavButton(
        toDo: () {
          Navigator.pop(context);
        },
      ),
      topCenter: Steps(step: 0),
      topRight: NavButton(
        label: kLang == 'en' ? 'Next' : 'Suivant',
        toDo: () {
          bool isExist = false;
          int i = 0;
          while (!isExist && i < children.length) {
            isExist =
                children[i].childName.toString().compareTo(childName) == 0;
            i++;
          }
          if (childName != '' && !isExist) {
            Navigator.push(context, CustomPageRoute(child: AgeAvatarScreen()));
          }
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          !focus
              ? Text(
                  kLang == 'en'
                      ? "What's your child's name?"
                      : "Quel est le nom de votre enfant?",
                  style: TextStyle(
                    color: themeClr,
                    fontSize: 30.0,
                  ),
                )
              : SizedBox(),
          SizedBox(height: onHeight(40, 10), width: double.infinity),
          Container(
            width: 400.0,
            height: 80.0,
            child: TextField(
              cursorColor: themeClr,
              onTap: () {
                setState(() {
                  focus = true;
                });
              },
              onChanged: (value) {
                childName = value;
              },
              onSubmitted: (value) {
                setState(() {
                  focus = false;
                });
              },
              autofocus: focus,
              textCapitalization: TextCapitalization.words,
              style: TextStyle(
                color: themeClr,
                fontSize: 17.0,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: kLang == 'en'
                      ? "Enter your child's name"
                      : "Entrez le nom de votre enfant"),
            ),
          ),
        ],
      ),
    );
  }
}

class AgeAvatarScreen extends StatefulWidget {
  const AgeAvatarScreen({Key? key}) : super(key: key);

  @override
  State<AgeAvatarScreen> createState() => _AgeAvatarScreenState();
}

class _AgeAvatarScreenState extends State<AgeAvatarScreen> {
  @override
  Widget build(BuildContext context) {
    return Kcaffold(
      topLeft: NavButton(
        toDo: () {
          Navigator.pop(context);
        },
      ),
      topCenter: Steps(step: 1),
      topRight: NavButton(
        label: kLang == 'en' ? 'Next' : 'Suivant',
        toDo: () async {
          late ChildProgress newChildProgress;
          if (age != -1 && selectedAvatar != -1) {
            setState(() {
              newChildProgress = ChildProgress(
                childName: childName,
                password: 'password',
                parent: kUser,
                age: age,
                avatar: selectedAvatar,
                trophie: 0,
                stars: 0,
                badge: 0,
                theme: 0,
                game: 1,
                themes: initThemesProgress,
              );
            });
            LocalProgress.addChild(kUser, newChildProgress);
            if (isConnected) {
              await OnlineProgress.createChild(kUser, newChildProgress);
            }
            // newChildProgress.themes = [];
            children.add(newChildProgress);
            Navigator.push(context, CustomPageRoute(child: ChooseProfile()));
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              kLang == 'en'
                  ? "What is ${childName.substring(0, childName.length > 20 ? 20 : childName.length)}'s age?"
                  : "Quel est l'âge de ${childName.substring(0, childName.length > 20 ? 20 : childName.length)}?",
              style: TextStyle(
                color: themeClr,
                fontSize: 28.0,
              ),
            ),
            // Ages
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                (index) => Container(
                  height: 50.0,
                  width: 50.0,
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: age == index + 3 ? themeClr : white,
                      border: Border.all(
                        width: age == index + 3 ? 3.0 : 0.0,
                        color: white,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          age = index + 3;
                        });
                      },
                      child: Center(
                        child: Text(
                          (index + 3).toString() + (index + 3 == 8 ? '+' : ''),
                          style: TextStyle(
                            color: age == index + 3 ? white : themeClr,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: age == index + 3 ? themeClr : white,
                    border: Border.all(
                      width: age == index + 3 ? 1.0 : 4.0,
                      color: themeClr,
                    ),
                    boxShadow: bxShdA,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              kLang == 'en' ? 'Select an avatar' : 'Séléctionnez un avatar',
              style: TextStyle(
                color: themeClr,
                fontSize: 28.0,
              ),
            ),
            SizedBox(
              height: 15.0,
            ), // Avatars
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    avatar(0),
                    avatar(1),
                    avatar(2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    avatar(3),
                    avatar(4),
                    avatar(5),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget avatar(int avatar) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 6, vertical: avatar == selectedAvatar ? 1 : 3),
      decoration: BoxDecoration(
          border: Border.all(
            width: avatar == selectedAvatar ? 4.0 : 2.0,
            color: avatar == selectedAvatar ? themeClr : Colors.black,
          ),
          boxShadow: bxShd6,
          shape: BoxShape.circle),
      child: CircleAvatar(
        radius: screenHeight * .08,
        backgroundColor: avatrBg(avatar),
        child: InkWell(
          onTap: () {
            setState(() {
              selectedAvatar = avatar;
            });
          },
          child: SvgPicture.asset(
            'assets/icons/avatars/${avatar}.svg',
          ),
        ),
      ),
    );
  }
}

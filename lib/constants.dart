// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import './settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './backend/progress_controllers.dart';
import './data/initializedThemes.dart';
import './backend/local_progress/local_progress.dart';
import './backend/online_progress/firebase_backend.dart';
import './main.dart';
import './progress/progress.dart';

AudioCache player = AudioCache();

late Color themeClr;
Color greyClr = const Color(0xFF9E9E9E),
    lightgrey = Color(0XFF8D8D8C),
    green = Color(0XFF65BD35),
    white = Colors.white;

String backGround = 'nutri';

late double screenWidth, screenHeight;
int totalStarsNumber = (7 + 6 + 5 + 6) * 3;

double onWidth(double big, double small) => screenWidth > 600 ? big : small;
double onHeight(double big, double small) => screenHeight > 300 ? big : small;

List<BoxShadow> bxShdA = [
  BoxShadow(
    color: Color(0xFFAAAAAA),
    offset: Offset(2, 2),
    blurRadius: 2.0,
    spreadRadius: 2.0,
  ),
];

List<BoxShadow> bxShd6 = [
  BoxShadow(
    color: Color(0xFF666666),
    offset: Offset(2, 2),
    blurRadius: 2.0,
    spreadRadius: 0.0,
  ),
];

enum AppleStates {
  normal,
  triste,
  indice,
  showIndice,
}

class AppleStatus {
  static String normal = 'normal',
      right = 'right',
      wrong = 'shoked',
      hero = 'hero',
      runner = 'runner',
      indicator = 'indicator';
}

int max(int x, int y) => x > y ? x : y;

void dataUpdator(BuildContext context, ThemeProgress themeProgress,
    GameProgress gameProgress, int stars) async {
  if (stars > gameProgress.stars) {
    //! Changes
    //? If Last Game in the Theme
    if (childProgress.game ==
        initThemesProgress[childProgress.theme].games.length - 1) {
      childProgress.game = 0;
      if (childProgress.themes[childProgress.theme].themeName ==
          gameProgress.theme &&
          childProgress.theme < 5) {
        childProgress.theme++;
        childProgress.trophie++;
      }
      //! Build The Trophie Screen
    } else if (childProgress.game == gameProgress.gameIndex) {
      childProgress.game++;
    }
    childProgress.stars = childProgress.stars - gameProgress.stars + stars;
    childProgress.badge = childProgress.stars ~/ (totalStarsNumber / 5);
    themeProgress.stars = themeProgress.stars - gameProgress.stars + stars;
    gameProgress.stars = stars;

    //! Updates

    String date = DateTime.now().toString();
    LocalProgress.updateChild(childProgress);
    LocalProgress.updateTheme(themeProgress);
    LocalProgress.updateGame(gameProgress);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('kLocalDate', date);

    if (isConnected && kUser != 'guest') {
      OnlineProgress.updateGame(gameProgress);
      OnlineProgress.updateTheme(themeProgress);
      OnlineProgress.updateChild(childProgress);
      OnlineProgress.updateParent(childProgress.parent, date);
    }
  }
}

Color avatrBg(int avatar) {
  switch (avatar) {
    case 0:
      return Colors.white;
    case 1:
      return Color(0xFFFFDE21);
    case 2:
      return Color(0xFF11FF50);
    case 3:
      return Color(0xFFFF9900);
    case 4:
      return Color(0xFF3246FF);
    case 5:
      return Color(0xFF1AE8FF);
  }
  return white;
}

void playQqs(sound) {
  if (kSound) {
    /*
    player.play(
      'sounds/questions/${sound}.mp3',
      mode: PlayerMode.LOW_LATENCY,
    );
     */
  }
}

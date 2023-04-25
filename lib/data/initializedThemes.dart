import '../backend/progress_controllers.dart';
import '../settings.dart';
import '../signup/create_profile.dart';

List<ThemeProgress> initThemesProgress = [
  ThemeProgress(
    themeName: 'Oceania',
    parent: kUser,
    child: childName,
    stars: 0,
    themeIndex: 0,
    games: [
      GameProgress(
        gameName: 'Quiz',
        gameIndex: 0,
        stars: 0,
        parent: kUser,
        child: childName,
        theme: 'Oceania',
      ),
      GameProgress(
        gameName: 'Mini jeu',
        gameIndex: 1,
        stars: 0,
        parent: kUser,
        child: childName,
        theme: 'Oceania',
      ),
    ],
  ),
  //              *** END Of The First Continent ***
  ThemeProgress(
    themeName: 'Asia',
    parent: kUser,
    child: childName,
    themeIndex: 1,
    stars: 0,
    games: [
      GameProgress(
        gameName: 'Quiz',
        gameIndex: 0,
        stars: 0,
        parent: kUser,
        child: childName,
        theme: 'Asia',
      ),
      GameProgress(
        gameName: 'Mini jeu',
        gameIndex: 1,
        stars: 0,
        parent: kUser,
        child: childName,
        theme: 'Asia',
      ),
    ],
  ),
  //              *** END Of The Second Continent ***
  ThemeProgress(
    themeName: 'Africa',
    parent: kUser,
    child: childName,
    themeIndex: 2,
    stars: 0,
    games: [
      GameProgress(
        gameName: 'Quiz',
        gameIndex: 0,
        stars: 0,
        parent: kUser,
        child: childName,
        theme: 'Africa',
      ),
      GameProgress(
        gameName: 'Mini jeu',
        gameIndex: 1,
        stars: 0,
        parent: kUser,
        child: childName,
        theme: 'Africa',
      ),
    ],
  ),
  //              *** END Of The Third Continent ***
  ThemeProgress(
    themeName: 'Europe',
    parent: kUser,
    child: childName,
    themeIndex: 3,
    stars: 0,
    games: [
      GameProgress(
        gameName: 'Quiz',
        gameIndex: 0,
        stars: 0,
        parent: kUser,
        child: childName,
        theme: 'Europe',
      ),
      GameProgress(
        gameName: 'Mini jeu',
        gameIndex: 1,
        stars: 0,
        parent: kUser,
        child: childName,
        theme: 'Europe',
      ),
    ],
  ),
  //              *** END Of The Forth Continent ***
  ThemeProgress(
    themeName: 'North America',
    parent: kUser,
    child: childName,
    themeIndex: 4,
    stars: 0,
    games: [
      GameProgress(
        gameName: 'Quiz',
        gameIndex: 0,
        stars: 0,
        parent: kUser,
        child: childName,
        theme: 'North America',
      ),
      GameProgress(
        gameName: 'Mini jeu',
        gameIndex: 1,
        stars: 0,
        parent: kUser,
        child: childName,
        theme: 'North America',
      ),
    ],
  ),
  //              *** END Of The Fifth Continent ***
  ThemeProgress(
    themeName: 'South America',
    parent: kUser,
    child: childName,
    themeIndex: 5,
    stars: 0,
    games: [
      GameProgress(
        gameName: 'Quiz',
        gameIndex: 0,
        stars: 0,
        parent: kUser,
        child: childName,
        theme: 'South America',
      ),
      GameProgress(
        gameName: 'Mini jeu',
        gameIndex: 1,
        stars: 0,
        parent: kUser,
        child: childName,
        theme: 'South America',
      ),
    ],
  ),
];

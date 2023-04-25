class ChildProgress {
  String childName, password, parent;
  int age, avatar, trophie, badge, stars, theme, game;
  List<ThemeProgress> themes;
  ChildProgress({
    required this.childName,
    required this.password,
    required this.parent,
    required this.age,
    required this.avatar,
    required this.trophie,
    required this.stars,
    required this.badge,
    required this.theme,
    required this.game,
    required this.themes,
  });
}

class ThemeProgress {
  String themeName;
  String parent, child;
  int themeIndex, stars;
  List<GameProgress> games;
  ThemeProgress({
    required this.themeName,
    required this.parent,
    required this.child,
    required this.themeIndex,
    required this.stars,
    required this.games,
  });
}

class GameProgress {
  String gameName;
  String parent, child, theme;
  int gameIndex, stars;
  GameProgress({
    required this.gameName,
    required this.parent,
    required this.child,
    required this.theme,
    required this.gameIndex,
    required this.stars,
  });
}


late ChildProgress globalChildProgress;
late ThemeProgress globalThemeProgress;
late GameProgress globalGameProgress;

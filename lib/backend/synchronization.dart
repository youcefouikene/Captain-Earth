import './local_progress/local_progress.dart';
import './online_progress/firebase_backend.dart';
import './progress_controllers.dart';

late List<ChildProgress> onlineChildren;
late List<ThemeProgress> onlineThemes;
late List<GameProgress> onlineGames;

Future<List<ChildProgress>> getFireBase(String parent) async {
  Future<List<ChildProgress>> c = OnlineProgress.getChildren(parent);
  onlineChildren = await c;
  for (ChildProgress childProgress in onlineChildren) {
    Future<List<ThemeProgress>> t =
        OnlineProgress.getThemes(parent, childProgress.childName);
    onlineThemes = await t;
    for (ThemeProgress themeProgress in onlineThemes) {
      Future<List<GameProgress>> g = OnlineProgress.getGames(parent, childProgress.childName, themeProgress.themeName);
      onlineGames = await g;
      themeProgress.games = onlineGames;
    }
    childProgress.themes = onlineThemes;
  }
  return onlineChildren;
}

late List<ChildProgress> localChildren;
late List<ThemeProgress> localThemes;
late List<GameProgress> localGames;

Future<List<ChildProgress>> getSQFLite(String parent) async {
  Future<List<ChildProgress>> c = LocalProgress.getChildren(parent);
  localChildren = await c;
  for (ChildProgress childProgress in localChildren) {
    Future<List<ThemeProgress>> t =
        LocalProgress.getThemes(parent, childProgress.childName);
    localThemes = await t;
    for (ThemeProgress themeProgress in localThemes) {
      Future<List<GameProgress>> g = LocalProgress.getGames(
          parent, childProgress.childName, themeProgress.themeName);
      localGames = await g;
      themeProgress.games = localGames;
    }
    childProgress.themes = localThemes;
  }
  return localChildren;
}

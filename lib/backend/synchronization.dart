import './local_progress/local_progress.dart';
import './progress_controllers.dart';


late UserProgress localUser;
late List<StationProgress> localStations;
late List<GameProgress> localGames;

Future<UserProgress> getSQFLite(String playerName) async {
  Future<UserProgress> c = LocalProgress.getUser(playerName);
  localUser = await c;
  Future<List<StationProgress>> t = LocalProgress.getStations(localUser.playerName);
  localStations = await t;
  localUser.stations = localStations;
  localUser.sortStations();

  for (int currentStation= 0; currentStation < localStations.length; currentStation++) {
    Future<List<GameProgress>> g = LocalProgress.getGames(playerName, currentStation);
    localGames = await g;
    localStations[currentStation].games = localGames;
    localStations[currentStation].sortGames();
  }
  return localUser;
}

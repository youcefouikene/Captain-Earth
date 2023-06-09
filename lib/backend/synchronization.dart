import 'package:projet_2cp/progress/progress.dart';

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


void reInitilseSQFLite(String playerName) async{
  UserProgress localUserInisializer = new UserProgress(playerName: "guest", email: "guest", avatar: 0, trophy: 0, stars: 0, leaves: 0, currentStation: 0, stations: []);

  StationProgress localOceanieStationInitializer = new StationProgress(stationName: "Oceanie", playerName: "guest", stationIndex: 0, stars: 0, leaves: 0, games: []);
  StationProgress localAsieStationInitializer = new StationProgress(stationName: "Asie", playerName: "guest", stationIndex: 1, stars: 0, leaves: 0, games: []);
  StationProgress localAfriqueStationInitializer = new StationProgress(stationName: "Afrique", playerName: "guest", stationIndex: 2, stars: 0, leaves: 0, games: []);
  StationProgress localEuropeStationInitializer = new StationProgress(stationName: "Europe", playerName: "guest", stationIndex: 3, stars: 0, leaves: 0, games: []);
  StationProgress localAmeriqueNordStationInitializer = new StationProgress(stationName: "Amerique nord", playerName: "guest", stationIndex: 4, stars: 0, leaves: 0, games: []);
  StationProgress localAmeriqueSudStationInitializer = new StationProgress(stationName: "Amerique sud", playerName: "guest", stationIndex: 5, stars: 0, leaves: 0, games: []);

  GameProgress localQuizOceanie = new GameProgress(playerName: "guest", gameName: "Quiz", station: 0, gameIndex: 0, stars: 0, leaves: 0);
  GameProgress localMiniJeuOceanie = new GameProgress(playerName: "guest", gameName: "Mini jeu", station: 0, gameIndex: 1, stars: 0, leaves: 0);

  GameProgress localQuizAsie = new GameProgress(playerName: "guest", gameName: "Quiz", station: 1, gameIndex: 0, stars: 0, leaves: 0);
  GameProgress localMiniJeuAsie= new GameProgress(playerName: "guest", gameName: "Mini jeu", station: 1, gameIndex: 1, stars: 0, leaves: 0);

  GameProgress localQuizAfrique = new GameProgress(playerName: "guest", gameName: "Quiz", station: 2, gameIndex: 0, stars: 0, leaves: 0);
  GameProgress localMiniJeuAfrique= new GameProgress(playerName: "guest", gameName: "Mini jeu", station: 2, gameIndex: 1, stars: 0, leaves: 0);

  GameProgress localQuizEurope = new GameProgress(playerName: "guest", gameName: "Quiz", station: 3, gameIndex: 0, stars: 0, leaves: 0);
  GameProgress localMiniJeuEurope = new GameProgress(playerName: "guest", gameName: "Mini jeu", station: 3, gameIndex: 1, stars: 0, leaves: 0);

  GameProgress localQuizAmeriqueNord = new GameProgress(playerName: "guest", gameName: "Quiz", station: 4, gameIndex: 0, stars: 0, leaves: 0);
  GameProgress localMiniJeuAmeriqueNord= new GameProgress(playerName: "guest", gameName: "Mini jeu", station: 4, gameIndex: 1, stars: 0, leaves: 0);

  GameProgress localQuizAmeriqueSud = new GameProgress(playerName: "guest", gameName: "Quiz", station: 5, gameIndex: 0, stars: 0, leaves: 0);
  GameProgress localMiniJeuAmeriqueSud= new GameProgress(playerName: "guest", gameName: "Mini jeu", station: 5, gameIndex: 1, stars: 0, leaves: 0);

  // Re-initialize the user progress 
  LocalProgress.updateUser(localUserInisializer);

  // Re-intilize the stations progress
  LocalProgress.updateCurrentStation(localOceanieStationInitializer);
  LocalProgress.updateCurrentStation(localAsieStationInitializer);
  LocalProgress.updateCurrentStation(localAfriqueStationInitializer);
  LocalProgress.updateCurrentStation(localEuropeStationInitializer);
  LocalProgress.updateCurrentStation(localAmeriqueNordStationInitializer);
  LocalProgress.updateCurrentStation(localAmeriqueSudStationInitializer);

  // Re-intilize the games progress
  LocalProgress.updateCurrentGame(localQuizOceanie);
  LocalProgress.updateCurrentGame(localMiniJeuOceanie);
  LocalProgress.updateCurrentGame(localQuizAsie);
  LocalProgress.updateCurrentGame(localMiniJeuAsie);
  LocalProgress.updateCurrentGame(localQuizAfrique);
  LocalProgress.updateCurrentGame(localMiniJeuAfrique);
  LocalProgress.updateCurrentGame(localQuizEurope);
  LocalProgress.updateCurrentGame(localMiniJeuEurope);
  LocalProgress.updateCurrentGame(localQuizAmeriqueNord);
  LocalProgress.updateCurrentGame(localMiniJeuAmeriqueNord);
  LocalProgress.updateCurrentGame(localQuizAmeriqueSud);
  LocalProgress.updateCurrentGame(localMiniJeuAmeriqueSud);
}

void changeAvatar(String playerName, int avatarNumber) async{
  LocalProgress.updateAvatar(playerName, avatarNumber);
}

void changeName(String playerName, String email){
  LocalProgress.updateName(playerName,email);
}
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/initializedThemes.dart';
import 'package:projet_2cp/backend/progress_controllers.dart';

class LocalProgress {
  static late Database _progress;
  static late List<StationProgress> stations = initStationsProgress;
  static late List<GameProgress> games = [];

  //! **********/
  //!
  //! GETTER ***/
  //!        ***/
  //! **********/

  static Future<Database> getProgress() async {
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, "progress.db");
    var exist = await databaseExists(dbPath);
    if (!exist) {
      ByteData data = await rootBundle.load("assets/data/progress.db");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes);
    }
    return await openDatabase(dbPath);
  }

  static Future<UserProgress> getUser(String playerName) async {
    _progress = await getProgress();
    List<Map<String, dynamic>> user = await _progress
        .rawQuery("SELECT * FROM Users WHERE playerName='$playerName'");
    if (user.isEmpty && playerName == 'guest') {
      return UserProgress(
        playerName: 'guest',
        email: 'guest',
        avatar: 0,
        trophy: 0,
        stars: 0,
        leaves: 0,
        currentStation: 0,
        stations: initStationsProgress,
      );
    } else {
      return UserProgress(
        playerName: user[0]['playerName'],
        email: user[0]['email'],
        avatar: user[0]['avatar'],
        trophy: user[0]['trophy'],
        stars: user[0]['stars'],
        leaves: user[0]['leaves'],
        currentStation: user[0]['currentStation'],
        stations: [],
      );
    }
  }

  static Future<List<StationProgress>> getStations(String playerName) async {
    _progress = await getProgress();
    List<Map<String, dynamic>> stations = await _progress
        .rawQuery("SELECT * FROM stations WHERE playerName='$playerName'");
    return List.generate(stations.length, (index) {
      return StationProgress(
        stationName: stations[index]['stationName'],
        playerName: stations[index]['playerName'],
        stationIndex: stations[index]['stationIndex'],
        stars: stations[index]['stars'],
        leaves: stations[index]['leaves'],
        games: [],
      );
    });
  }

  static Future<List<GameProgress>> getGames(
      String playerName, int stationIndex) async {
    _progress = await getProgress();
    List<Map<String, dynamic>> games = await _progress.rawQuery(
        "SELECT * FROM games WHERE stationIndex='$stationIndex' AND playerName='$playerName'");
    return List.generate(games.length, (index) {
      return GameProgress(
        gameName: games[index]['gameName'],
        playerName: games[index]['playerName'],
        station: games[index]['stationIndex'],
        gameIndex: games[index]['gameIndex'],
        stars: games[index]['stars'],
        leaves: games[index]['leaves'],
      );
    });
  }

  //? ********/*
  //?        */*
  //? ADDERS */*
  //?        */*
  //?        */*

  static void addUser(UserProgress userProgress) async {
    _progress = await getProgress();
    _progress.insert(
      'Users',
      {
        'playerName': userProgress.playerName,
        'email': userProgress.email,
        'avatar': userProgress.avatar,
        'stars': userProgress.stars,
        'leaves': userProgress.leaves,
        'currentStation': userProgress.currentStation,
        'trophy': userProgress.trophy,
      },
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
    int i = 0;
    int j = 0;
    while (i < initStationsProgress.length) {
      StationProgress station = userProgress.stations[i];
      _progress.insert('stations', {
        'stationName': station.stationName,
        'playerName': userProgress.playerName,
        'leaves': station.leaves,
        'stars': station.stars,
        'stationIndex': station.stationIndex,
      });
      j = 0;
      while (j < station.games.length) {
        GameProgress game = userProgress.stations[i].games[j];
        _progress.insert('games', {
          'gameName': game.gameName,
          'stationIndex': station.stationIndex,
          'playerName': userProgress.playerName,
          'gameIndex': game.gameIndex,
          'stars': game.stars,
          'leaves': game.leaves,
        });
        j++;
      }
      i++;
    }
  }

  //*        */*
  //*        */*
  //*        */*
  //*        */*
  //* UPDATE */*

  static void updateUser(UserProgress userProgress) async {
    _progress = await getProgress();
    _progress.execute(
        "UPDATE Users SET avatar = '${userProgress.avatar}', trophy = '${userProgress.trophy}', leaves = '${userProgress.leaves}', stars = '${userProgress.stars}', currentStation = '${userProgress.currentStation}' WHERE playerName = '${userProgress.playerName}'");
  }

  static void updateCurrentStation(StationProgress stationProgress) async {
    _progress = await getProgress();
    _progress.execute(
        "UPDATE stations SET stars = '${stationProgress.stars}', leaves = '${stationProgress.leaves}' WHERE playerName = '${stationProgress.playerName}' AND stationIndex = '${stationProgress.stationIndex}'");
  }

  static void updateCurrentGame(GameProgress gameProgress) async {
    _progress = await getProgress();
    _progress.execute(
        "UPDATE games SET stars = '${gameProgress.stars}', leaves = '${gameProgress.leaves}' WHERE playerName = '${gameProgress.playerName}' AND stationIndex = '${gameProgress.station}' AND gameIndex = '${gameProgress.gameIndex}'");
  }
}

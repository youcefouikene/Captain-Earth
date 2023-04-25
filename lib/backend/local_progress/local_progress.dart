import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import '../progress_controllers.dart';
import '../../data/initializedThemes.dart';
import 'package:sqflite/sqflite.dart';

class LocalProgress {
  static late Database _progress;
  static late List<ThemeProgress> themes = initThemesProgress;
  static late List<GameProgress> games = [];

  //! **********/
  //!
  //! GETTER ***/
  //!
  //! **********/

  static Future<Database> getProgress() async {
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, "progress.db");
    var exist = await databaseExists(dbPath);
    if (!exist) {
      ByteData data = await rootBundle.load("assets/data/progress.db");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes);
    }
    return await openDatabase(dbPath);
  }

  static Future<List<ChildProgress>> getChildren(String parent) async {
    _progress = await getProgress();
    List<Map<String, dynamic>> children =
        await _progress //.rawQuery('SELECT * FROM children');
            .rawQuery('SELECT * FROM children WHERE parent="$parent"');
    return List.generate(children.length, (index) {
      return ChildProgress(
        childName: children[index]['child'],
        password: children[index]['password'],
        parent: children[index]['parent'],
        age: children[index]['age'],
        avatar: children[index]['avatar'],
        trophie: children[index]['trophie'],
        badge: children[index]['badge'],
        stars: children[index]['stars'],
        theme: children[index]['theme'],
        game: children[index]['game'],
        themes: [],
      );
    });
  }

  static Future<List<ThemeProgress>> getThemes(String parent, String childName) async {
    _progress = await getProgress();
    List<Map<String, dynamic>> themes = await _progress.rawQuery(
        "SELECT * FROM themes WHERE parent='$parent' AND child='$childName'");
    return List.generate(themes.length, (index) {
      return ThemeProgress(
        themeName: themes[index]['theme'],
        parent: themes[index]['parent'],
        child: themes[index]['child'],
        themeIndex: themes[index]['themeIndex'],
        stars: themes[index]['stars'],
        games: [],
      );
    });
  }

  static Future<List<GameProgress>> getGames(String parent, String childName, String themeName) async {
    _progress = await getProgress();
    List<Map<String, dynamic>> games = await _progress.rawQuery(
        'SELECT * FROM games WHERE parent="$parent" AND child="$childName" AND theme="$themeName"');
    return List.generate(games.length, (index) {
      return GameProgress(
        gameName: games[index]['game'],
        parent: games[index]['parent'],
        child: games[index]['child'],
        theme: games[index]['theme'],
        gameIndex: games[index]['gameIndex'],
        stars: games[index]['stars'],
      );
    });
  }

  //? ********/*
  //?        */*
  //? ADDERS */*
  //?        */*
  //?        */*

  static void addChild(String parent, ChildProgress childProgress) async {
    _progress = await getProgress();
    _progress.insert(
      'children',
      {
        'child': childProgress.childName,
        'password': childProgress.password,
        'parent': childProgress.parent,
        'age': childProgress.age,
        'avatar': childProgress.avatar,
        'trophie': childProgress.trophie,
        'badge': childProgress.badge,
        'stars': childProgress.stars,
        'theme': childProgress.theme,
        'game': childProgress.game,
      },
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
    int i = 0;
    int j = 0;
    while (i < initThemesProgress.length) {
      ThemeProgress theme = childProgress.themes[i];
      _progress.insert('themes', {
        'theme': theme.themeName,
        'child': childProgress.childName,
        'parent': parent,
        'stars': theme.stars,
        'themeIndex': theme.themeIndex,
      });
      j = 0;
      while (j < theme.games.length) {
        GameProgress game = childProgress.themes[i].games[j];
        _progress.insert('games', {
          'game': game.gameName,
          'theme': theme.themeName,
          'child': childProgress.childName,
          'parent': parent,
          'stars': game.stars,
          'gameIndex': game.gameIndex,
        });
        j++;
      }
      i++;
    }
  }

  //*        */*
  //*        */*
  //* UPDATE */*
  //*        */*
  //*        */*

  static void updateChild(ChildProgress childProgress) async {
    _progress = await getProgress();
    _progress.execute(
        'UPDATE children SET password = "${childProgress.password}", age = "${childProgress.age}", avatar = "${childProgress.avatar}", trophie = "${childProgress.trophie}", badge = "${childProgress.badge}", stars = "${childProgress.stars}", theme = "${childProgress.theme}", game = "${childProgress.game}" WHERE parent = "${childProgress.parent}" AND child = "${childProgress.childName}"');
  }

  static void updateTheme(ThemeProgress themeProgress) async {
    _progress = await getProgress();
    _progress.execute(
        'UPDATE themes SET stars = "${themeProgress.stars}" WHERE parent = "${themeProgress.parent}" AND child = "${themeProgress.child}" AND theme = "${themeProgress.themeName}"');
  }

  static void updateGame(GameProgress gameProgress) async {
    _progress = await getProgress();
    _progress.execute(
        'UPDATE games SET stars = "${gameProgress.stars}" WHERE parent = "${gameProgress.parent}" AND child = "${gameProgress.child}" AND theme = "${gameProgress.theme}" AND game = "${gameProgress.gameName}"');
  }
}

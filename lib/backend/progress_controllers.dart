import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'database.dart';

class GameProgress{
  String gameName;
  String playerName;
  int station, gameIndex, stars, leaves;

  GameProgress({
    required this.playerName,
    required this.gameName,
    required this.station,
    required this.gameIndex,
    required this.stars,
    required this.leaves,
  });
}


class StationProgress {
  String stationName;
  String playerName;
  int stationIndex;
  int stars;
  int leaves;
  List<GameProgress> games;

  StationProgress({
    required this.stationName,
    required this.playerName,
    required this.stationIndex,
    required this.stars,
    required this.leaves,
    required this.games,
  });

  void sortGames() {
    games.sort((a, b) => a.gameIndex.compareTo(b.gameIndex));
  }

}



class UserProgress {
  String? uid;
  String playerName, email;
  int avatar, stars, leaves, currentStation, trophy;
  List<StationProgress> stations;
  DatabaseReference? _id;


  UserProgress({
    required this.playerName,
    required this.email,
    required this.avatar,
    required this.trophy,
    required this.stars,
    required this.leaves,
    required this.currentStation,
    required this.stations,
  });

  void sortStations() {
    stations.sort((a, b) => a.stationIndex.compareTo(b.stationIndex));
  }

  void setId(DatabaseReference id) {
    _id = id;
  }

  void setUId(String id) {
    uid = id;
  }

  String getEmail(){
    return email;
  }


  Map<String, dynamic> toJson(){
    return{
      'uid': uid,
      'playerName': playerName,
      'email': email,
      'currentStation': currentStation,
      'avatar': avatar,
      'stars': stars,
      'leaves': leaves,
      'trophy': trophy,
    };
  }

}


UserProgress createUser(record) {
  Map<String, dynamic> attributes = {
    'uid': '',
    'playerName': '',
    'email': '',
    'currentStation': 0,
    'avatar': 0,
    'stars': 0,
    'leaves': 0,
    'trophy': 0,
    'stations':[],
  };

  Map<String, dynamic>.from(record as dynamic).forEach((key, value) {attributes[key] = value;});
  UserProgress cUser = UserProgress(
      playerName: attributes['playerName'],
      email: attributes['email'],
      avatar: attributes['avatar'],
      trophy: attributes['trophy'],
      stars: attributes['stars'],
      leaves: attributes['leaves'],
      currentStation: attributes['currentStation'],
      stations: attributes['currentStation'],
  );
  return cUser;
}




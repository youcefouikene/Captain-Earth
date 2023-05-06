import 'package:flutter/widgets.dart';
import 'package:projet_2cp/backend/progress_controllers.dart';

class StationCard {
  StationProgress stationProgress;
  List<GameCard> games;
  StationCard({
    required this.stationProgress,
    required this.games,
  });
}

class GameCard {
  GameProgress gameProgress;
  Widget game;
  GameCard({
    required this.gameProgress,
    required this.game,
  });
}

List<StationCard> gameData = [];

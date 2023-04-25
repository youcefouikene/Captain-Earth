import 'package:flutter/widgets.dart';
import '../backend/progress_controllers.dart';

class ThemeCard {
  ThemeProgress themeProgress;
  String image;
  Color color;
  List<GameCard> games;
  ThemeCard({
    required this.themeProgress,
    required this.image,
    required this.color,
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

List<ThemeCard> gameData = [];

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

enum Level1 { Hard, Medium, Easy }

List<String> fillSourceArray() {
  return [
    'assets/images/asie/arbreFeu.png',
    'assets/images/asie/arbreFeu.png',
    'assets/images/asie/nuclaire.png',
    'assets/images/asie/nuclaire.png',
    'assets/images/asie/personne.png',
    'assets/images/asie/personne.png',
    'assets/images/asie/terrePolluee.png',
    'assets/images/asie/terrePolluee.png',
    'assets/images/asie/terrePolluee2.png',
    'assets/images/asie/terrePolluee2.png',
    'assets/images/asie/usine.png',
    'assets/images/asie/usine.png',
    'assets/images/asie/usine2.png',
    'assets/images/asie/usine2.png',
    'assets/images/asie/voitureFumee.png',
    'assets/images/asie/voitureFumee.png',
    'assets/images/asie/volcan.png',
    'assets/images/asie/volcan.png',
  ];
}

List getSourceArray(
  Level1 level,
) {
  List<String> levelAndKindList = [];
  List sourceArray = fillSourceArray();
  if (level == Level1.Hard) {
    sourceArray.forEach((element) {
      levelAndKindList.add(element);
    });
  } else if (level == Level1.Medium) {
    for (int i = 0; i < 12; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  } else if (level == Level1.Easy) {
    for (int i = 0; i < 6; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  }

  levelAndKindList.shuffle();
  return levelAndKindList;
}

List<bool> getInitialItemState(Level1 level) {
  List<bool> initialItemState = [];
  if (level == Level1.Hard) {
    for (int i = 0; i < 18; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level1.Medium) {
    for (int i = 0; i < 12; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level1.Easy) {
    for (int i = 0; i < 6; i++) {
      initialItemState.add(true);
    }
  }
  return initialItemState;
}

List<GlobalKey<FlipCardState>> getCardStateKeys(Level1 level) {
  List<GlobalKey<FlipCardState>> cardStateKeys = [];
  if (level == Level1.Hard) {
    for (int i = 0; i < 18; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level1.Medium) {
    for (int i = 0; i < 12; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level1.Easy) {
    for (int i = 0; i < 6; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  }
  return cardStateKeys;
}

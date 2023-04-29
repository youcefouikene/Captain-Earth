import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
enum Level { Hard, Medium, Easy }

List<String> fillSourceArray() {
  return [
    'assets/images/ameriqueNord/logo.png',
    'assets/images/ameriqueNord/logo.png',
    'assets/images/ameriqueNord/logo2.png',
    'assets/images/ameriqueNord/logo2.png',
    'assets/images/ameriqueNord/energieThermique.jpg',
    'assets/images/ameriqueNord/energieThermique.jpg',
    'assets/images/ameriqueNord/heollinne2.jpg',
    'assets/images/ameriqueNord/heollinne2.jpg',
    'assets/images/ameriqueNord/paneauxSolaires.jpg',
    'assets/images/ameriqueNord/paneauxSolaires.jpg',
    'assets/images/ameriqueNord/marine.jpg',
    'assets/images/ameriqueNord/marine.jpg',
    'assets/images/ameriqueNord/heolinne.jpg.png',
    'assets/images/ameriqueNord/heolinne.jpg.png',
    'assets/images/ameriqueNord/Esolaire.jpg',
    'assets/images/ameriqueNord/Esolaire.jpg',
    'assets/images/ameriqueNord/barage.jpg',
    'assets/images/ameriqueNord/barage.jpg',
    
    
    ];
}

List getSourceArray(
  Level level,
) {
  List<String> levelAndKindList = [];
  List sourceArray = fillSourceArray();
  if (level == Level.Hard) {
    sourceArray.forEach((element) {
      levelAndKindList.add(element);
    });
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 6; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  }

  levelAndKindList.shuffle();
  return levelAndKindList;
}

List<bool> getInitialItemState(Level level) {
  List<bool> initialItemState = [];
  if (level == Level.Hard) {
    for (int i = 0; i < 18; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 6; i++) {
      initialItemState.add(true);
    }
  }
  return initialItemState;
}

List<GlobalKey<FlipCardState>> getCardStateKeys(Level level) {
  List<GlobalKey<FlipCardState>> cardStateKeys =[];
  if (level == Level.Hard) {
    for (int i = 0; i < 18; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 6; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  }
  return cardStateKeys;
}

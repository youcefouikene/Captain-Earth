import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:projet_2cp/Screens/EndGamePage.dart';
import '../../Screens/helpPageEu.dart';
import '../../Widgets/Europe/dechetModel.dart';
import '../../Widgets/PointBar.dart';
import '../../Widgets/WiningBox.dart';
import '../indication_throw_garbage.dart';
import 'package:projet_2cp/constants.dart';
import 'package:projet_2cp/settings.dart';
import 'package:projet_2cp/backend/progress_controllers.dart';
import 'package:projet_2cp/progress/progress.dart';

class ThrowGarbage extends StatefulWidget {
  const ThrowGarbage({super.key});

  @override
  State<ThrowGarbage> createState() => _ThrowGarbageState();
}

class _ThrowGarbageState extends State<ThrowGarbage> {
  final StationProgress stationProgress = userProgress.stations[3];
  final GameProgress gameProgress = userProgress.stations[3].games[1];

  late List<DechetModel> listDechets;
  late List<DechetModel> listPoubelles;

  late int echec;
  late bool gameOver;
  int score = 0;

  int choix = -1;
  String s = '';

  String choixBonus = "";
  String plusOrMinus = "";

  late int currentIndex;

  IconData iconeTypeFunction() {
    return (kSound) ? Icons.music_note : Icons.music_off;
  }

  Color col = const Color.fromRGBO(232, 69, 96, 1);

  void handleAccept() {
    setState(() {
      currentIndex++;
    });
  }

  initGame() {
    gameOver = false;
    echec = 0;
    score = 0;
    currentIndex = 0;
    listDechets = myDechetList;
    listPoubelles = myPoubelleList;
    listDechets.shuffle();
  }

  @override
  void initState() {
    super.initState();
    initGame();
    backgroundPlayerEurope.playMusic();
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex == (myDechetList.length)) {
      gameOver = true;
      int stars;
      (echec <= 3)
          ? stars = 3
          : (echec <= 6)
              ? stars = 2
              : (echec <= 12)
                  ? stars = 1
                  : stars = 0;
      dataUpdator(context, stationProgress, gameProgress, score, stars);
    }
    AudioPlayer player = AudioPlayer();
    AudioPlayer player1 = AudioPlayer();

    void initState() {
      // TODO: implement initState
      super.initState();
      player1.play(
        AssetSource('assets/sounds/stations/map.mp3'),
      );
      player1.setReleaseMode(ReleaseMode.loop);
    }

    @override
    void dispose() {
      player.stop();
      super.dispose();
    }

    Future<void> playAudio() async {
      await player.play(AssetSource('sound.mp3'));
    }

    if (true) {
      backgroundPlayerMap.playMusic();
    }
    if (gameOver)
      playSoundEncouragement((echec <= 3)
          ? s = '3'
          : (echec <= 6)
              ? s = '2'
              : (echec <= 12)
                  ? s = '2'
                  : s = '1');

    return (gameOver)
        ? EndGamePage(
            score: (echec > 30) ? 0 : 30 - echec,
            stars: (echec <= 3)
                ? 3
                : (echec <= 6)
                    ? 2
                    : (echec <= 12)
                        ? 1
                        : 0,
            background: 'assets/images/europeBackground.png',
            station: 'station 04',
            stationIndex: 3,
            refreshPath: '/EuropeMiniJeu')
        : Scaffold(
            body: Container(
              height: double.infinity,
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.width * (16 / 800),
              ),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/europeBackground.png'),
                fit: BoxFit.cover,
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height *
                                (18 / 360)),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      (40 / 800),
                                  height: MediaQuery.of(context).size.width *
                                      (40 / 800),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xFFE84560),
                                    border: Border.all(
                                      color: const Color(0xff752683),
                                      width: 2,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (kSound) {
                                      setState(() {
                                        kSound = false;
                                        backgroundPlayerEurope.stopMusic();
                                      });
                                    } else {
                                      setState(() {
                                        kSound = true;
                                        backgroundPlayerEurope.playMusic();
                                      });
                                    }
                                  },
                                  icon: Icon(iconeTypeFunction()),
                                  iconSize: MediaQuery.of(context).size.width *
                                      (25 / 800),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  (5 / 360),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      (40 / 800),
                                  height: MediaQuery.of(context).size.width *
                                      (40 / 800),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xFFE84560),
                                    border: Border.all(
                                      color: const Color(0xff752683),
                                      width: 2,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    backgroundPlayerEurope.stopMusic();
                                    backgroundPlayerMap.playMusic();
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.close_rounded),
                                  iconSize: MediaQuery.of(context).size.width *
                                      (30 / 800),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: (42 / 800) * MediaQuery.of(context).size.width,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              PointBar(score: (echec > 30) ? 0 : 30 - echec),
                              Container(
                                margin: const EdgeInsets.all(6),
                                child: Draggable<DechetModel>(
                                  data: listDechets[currentIndex],
                                  childWhenDragging: Container(),
                                  feedback: Image.asset(
                                    listDechets[currentIndex].img,
                                    fit: BoxFit.cover,
                                  ),
                                  child: Image.asset(
                                    listDechets[currentIndex].img,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: listPoubelles.reversed.map((item) {
                              return DragTarget<DechetModel>(
                                  onAccept: (receivedItem) {
                                    if (item.value == receivedItem.value) {
                                      setState(() {
                                        handleAccept();
                                        score++;
                                        choixBonus = item.value;
                                        plusOrMinus = "plus";
                                      });
                                      item.accepting = false;
                                      //await audioPlayer.play(correctSoundId);
                                    } else {
                                      setState(() {
                                        echec++;
                                        item.accepting = false;
                                        choixBonus = item.value;
                                        plusOrMinus = "minus";
                                      });
                                    }
                                  },
                                  onWillAccept: (receivedItem) {
                                    setState(() {
                                      item.accepting = true;
                                    });
                                    return true;
                                  },
                                  onLeave: (receivedItem) {
                                    setState(() {
                                      item.accepting = false;
                                    });
                                  },
                                  builder: (context, acceptedItems,
                                          rejectedItems) =>
                                      Container(
                                        width: (135 / 800) *
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.only(
                                            left: (42 / 800) *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width),
                                        child: Image.asset(
                                          item.img,
                                          fit: BoxFit.cover,
                                        ),
                                      ));
                            }).toList(),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: (42 / 800) * MediaQuery.of(context).size.width,
                      ),
                      SizedBox(
                        width: (60 / 800) * MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      (16 / 360)),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    //margin: EdgeInsets.only(bottom: 12.0),
                                    width: MediaQuery.of(context).size.width *
                                        (40 / 800),
                                    height: MediaQuery.of(context).size.width *
                                        (40 / 800),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xFFE84560),
                                      border: Border.all(
                                        color: const Color(0xff752683),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  helpPageEu()));
                                    },
                                    icon: const Icon(Icons.question_mark),
                                    iconSize:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            IndicationThrowGarbage(
                              choix: choixBonus,
                              plusOrMinus: plusOrMinus,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}

import 'package:flutter/material.dart';
import '../../Screens/EndGamePage.dart';
import '../../Screens/helpPageEu.dart';
import '../../Widgets/CustomContainer.dart';
import '../../Widgets/Europe/dechetModel.dart';
// import '../../widgets.dart';
import '../../Widgets/PointBar.dart';
import '../../Widgets/WiningBox.dart';
import '../indication_throw_garbage.dart';

class ThrowGarbage extends StatefulWidget {
  const ThrowGarbage({Key? key}) : super(key: key);

  @override
  State<ThrowGarbage> createState() => _ThrowGarbageState();
}

class _ThrowGarbageState extends State<ThrowGarbage> {
  late List<DechetModel> listDechets;
  late List<DechetModel> listPoubelles;
  //var player = AudioCache();

  late int echec;
  late bool gameOver;

  int choix = -1;

  String choixBonus = "";
  String plusOrMinus = "";

  late int currentIndex;
  int totalScore = 509;

  IconData _icone = Icons.music_note;
  Color col = const Color.fromRGBO(232, 69, 96, 1);

  // AudioPlayer audioPlayer = AudioPlayer();
  //int correctSoundId;
  //int wrongSoundId;

  // Future<void> loadAudioFiles() async {
  //   String correctSound = "path/to/correct_sound.mp3";
  //   String wrongSound = "path/to/wrong_sound.mp3";
  //   correctSoundId = await audioPlayer?.setUrl(correctSound);
  //   wrongSoundId = await audioPlayer?.setUrl(wrongSound);
  // }

  void handleAccept() {
    setState(() {
      currentIndex++;
    });
  }

  initGame() {
    totalScore = 509;
    gameOver = false;
    echec = 0;
    currentIndex = 0;

    listDechets = myDechetList;
    listPoubelles = myPoubelleList;

    listDechets.shuffle();
  }

  @override
  void initState() {
    super.initState();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex == (myDechetList.length)) {
      gameOver = true;
    }

    return Scaffold(
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
            if (gameOver)
              Padding(
                padding: const EdgeInsets.only(
                  top: (86 / 360) * 100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // EndGamePage(background: 'assets/images/europeBackground.png', stars: stars, score: score, station: station, refreshPath: refreshPath)
                    WiningBox(
                      Score: totalScore,
                      Stars: (echec <= 3)
                          ? 3
                          : (echec <= 6)
                              ? 2
                              : (echec <= 12)
                                  ? 1
                                  : 0,
                      station: 'station 04',
                      refreshPath: '/EuropeMiniJeu',
                    ),
                    const SizedBox(
                      width: 28,
                    ),
                    (echec <= 3)
                        ? const Image(
                            image: AssetImage(
                                'assets/images/avatar/Captain_jumping.png'))
                        : (echec <= 12)
                            ? const Image(
                                image: AssetImage(
                                    'assets/images/avatar/Captain_good.png'))
                            : const Image(
                                image: AssetImage(
                                    'assets/images/avatar/Captain_craying.png'))
                  ],
                ),
              ),
            if (!gameOver)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * (18 / 360)),
                    child: Column(
                      children: [
                        Container(
                            child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width *
                                  (40 / 800),
                              height: MediaQuery.of(context).size.width *
                                  (40 / 800),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFE84560),
                                border: Border.all(
                                  color: Color(0xff752683),
                                  width: 2,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (_icone == Icons.music_note) {
                                    _icone = Icons.music_off;
                                  } else {
                                    _icone = Icons.music_note;
                                  }
                                });
                              },
                              icon: Icon(_icone),
                              iconSize: MediaQuery.of(context).size.width *
                                  (25 / 800),
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ],
                        )),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height * (5 / 360),
                        ),
                        Container(
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
                                color: Color(0xFFE84560),
                                border: Border.all(
                                  color: Color(0xff752683),
                                  width: 2,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.close_rounded),
                              iconSize: MediaQuery.of(context).size.width *
                                  (30 / 800),
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ],
                        )),
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
                          PointBar(score: totalScore),
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
                                    totalScore++;
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
                                    //await audioPlayer.play(wrongSoundId);
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
                                            MediaQuery.of(context).size.width),
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
                        Positioned(
                          right: MediaQuery.of(context).size.width * (32 / 800),
                          top: MediaQuery.of(context).size.height * (30 / 360),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height *
                                    (16 / 360)),
                            child: Container(
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
                                    color: Color(0xFFE84560),
                                    border: Border.all(
                                      color: Color(0xff752683),
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
                                  icon: Icon(Icons.question_mark),
                                  iconSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ],
                            )),
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

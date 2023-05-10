import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:projet_2cp/Screens/MiniJeux/AsieMiniJeu/timerAsie.dart';
import 'package:projet_2cp/constants.dart';
import '../../help.dart';
import 'data.dart';
import 'dart:async';
import '../../../Widgets/PointBarTime.dart';
import 'package:projet_2cp/backend/progress_controllers.dart';
import 'package:projet_2cp/progress/progress.dart';
import 'package:projet_2cp/settings.dart';

class FlipCardGame1 extends StatefulWidget {
  final Level1 _level;
  const FlipCardGame1(this._level, {super.key});
  @override
  _FlipCardGame1State createState() => _FlipCardGame1State(_level);
}

class _FlipCardGame1State extends State<FlipCardGame1> {
  _FlipCardGame1State(this._level);
  final StationProgress stationProgress = userProgress.stations[1];
  final GameProgress gameProgress = userProgress.stations[1].games[1];

  int _previousIndex = -1;
  bool _flip = false;
  bool _start = false;
  bool _wait = false;
  Level1? _level;
  Timer? _timer;
  int _time = 5;
  int? _left;
  int _score = 0;
  bool? _isFinished;
  List<dynamic>? _data;
  List<bool>? _cardFlips;
  List<GlobalKey<FlipCardState>>? _cardStateKeys;
  IconData icone = Icons.music_note; //attribut de la classe
  Widget getItem(int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 3,
              spreadRadius: 0.8,
              offset: Offset(2.0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.all(4.0),
      child: Image.asset(_data![index]),
    );
  }

  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        _time = _time - 1;
      });
    });
  }

  void restart() {
    startTimer();
    _data = getSourceArray(
      _level!,
    );
    _cardFlips = getInitialItemState(_level!);
    _cardStateKeys = getCardStateKeys(_level!);
    _time = 5;
    _left = (_data!.length ~/ 2);
    int _score = 0;
    _isFinished = false;
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        _start = true;
        _timer!.cancel();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    restart();
    backgroundPlayerAsie.playMusic();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int Stars() {
    if (_score <= 5) {
      return 0;
    } else if (_score > 5 && _score <= 15) {
      return 1;
    } else {
      return 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final wid = size.width;
    final het = size.height;
    final PaddingWidth = size.width;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/asie/Background_Asia.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Positioned(
                      child: Padding(
                          padding: EdgeInsets.only(
                            bottom: wid * (10 / 800),
                            top: het * 0.06,
                          ),
                          child: _time > 0
                              ? PointBarTime(score: _time)
                              : TimeFlipAsie(
                            'Station 02',
                            'assets/images/asie/Background_Asia.png',
                            _isFinished!,
                            '/AsieMiniJeu',
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(
                            left: PaddingWidth * 0.15,
                            right: PaddingWidth * 0.15),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: size.height * 0.22,
                        ),
                        itemBuilder: (context, index) => _start
                            ? FlipCard(
                            key: _cardStateKeys![index],
                            onFlip: () {
                              if (!_flip) {
                                _flip = true;
                                _previousIndex = index;
                              } else {
                                _flip = false;
                                if (_previousIndex != index) {
                                  if (_data![_previousIndex] !=
                                      _data![index]) {
                                    _wait = true;
                                    Future.delayed(
                                        const Duration(milliseconds: 1500),
                                            () {
                                          _cardStateKeys![_previousIndex]
                                              .currentState!
                                              .toggleCard();
                                          _previousIndex = index;
                                          _cardStateKeys![_previousIndex]
                                              .currentState!
                                              .toggleCard();

                                          Future.delayed(
                                              const Duration(milliseconds: 160),
                                                  () {
                                                setState(() {
                                                  _wait = false;
                                                  _score -= 2;
                                                });
                                              });
                                        });
                                  } else {
                                    _cardFlips![_previousIndex] = false;
                                    _cardFlips![index] = false;
                                    print(_cardFlips);

                                    setState(() {
                                      _left = _left! - 1;
                                      _score += 5;
                                    });
                                    if (_cardFlips!
                                        .every((t) => t == false)) {
                                      print("Won");
                                      Future.delayed(
                                          const Duration(milliseconds: 160),
                                              () {
                                            setState(() {
                                              _isFinished = true;
                                              _start = false;
                                            });
                                          });
                                    }
                                  }
                                }
                              }
                              setState(() {});
                            },
                            flipOnTouch: _wait ? false : _cardFlips![index],
                            direction: FlipDirection.HORIZONTAL,
                            front: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 3,
                                      spreadRadius: 0.8,
                                      offset: Offset(2.0, 1),
                                    )
                                  ]),
                              margin: const EdgeInsets.all(4.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/images/ameriqueNord/quest.png",
                                ),
                              ),
                            ),
                            back: getItem(index))
                            : getItem(index),
                        itemCount: _data!.length,
                      ),
                    ),
                  ],
                ),
              ),
              //NOUVEAU MODEL
              //----------------------------------------------
              Positioned(
                top: MediaQuery.of(context).size.height * (30 / 360),
                left: MediaQuery.of(context).size.width * (29 / 800),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * (39 / 800),
                          height:
                          MediaQuery.of(context).size.width * (39 / 800),
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
                            if(kSound){
                              setState(() {
                                kSound = false;
                                backgroundPlayerAsie.stopMusic();
                              });
                            }else{
                              setState(() {
                                kSound = true;
                                backgroundPlayerAsie.playMusic();
                              });
                            }
                          },
                          icon: Icon(icone),
                          iconSize:
                          MediaQuery.of(context).size.width * (25 / 800),
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * (5 / 360),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * (40 / 800),
                          height:
                          MediaQuery.of(context).size.width * (40 / 800),
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
                            backgroundPlayerAsie.stopMusic();
                            backgroundPlayerMap.playMusic();
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close_rounded),
                          iconSize:
                          MediaQuery.of(context).size.width * (30 / 800),
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: MediaQuery.of(context).size.width * (32 / 800),
                top: MediaQuery.of(context).size.height * (30 / 360),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * (40 / 800),
                      height: MediaQuery.of(context).size.width * (40 / 800),
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
                                builder: (context) => helpPage(
                                  numStation: 1,
                                  background:
                                  'assets/images/asie/Background_Asia.png',
                                )));
                      },
                      icon: const Icon(Icons.question_mark),
                      iconSize: MediaQuery.of(context).size.width * 0.035,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
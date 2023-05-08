import 'package:flutter/material.dart';
import 'package:projet_2cp/progress/progress.dart';
import '../../Screens/help.dart';
import '../../Widgets/Oceanie/Timer.dart';
import '../../Widgets/AmeriqueSud/fire.dart';
import 'package:projet_2cp/backend/progress_controllers.dart';

class Samerique_miniJeu extends StatefulWidget {
  const Samerique_miniJeu({super.key});

  @override
  State<Samerique_miniJeu> createState() => _Samerique_miniJeuState();
}

class _Samerique_miniJeuState extends State<Samerique_miniJeu> {
  final StationProgress stationProgress = userProgress.stations[5];
  final GameProgress gameProgress = userProgress.stations[5].games[1];

  IconData _icone = Icons.music_note;
  final List<bool> _ignore = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<String> feu = [
    'assets/images/ameriqueSud/fire1.png',
    'assets/images/ameriqueSud/fire2.png',
    'assets/images/ameriqueSud/fire3.png',
    'assets/images/ameriqueSud/fire4.png',
    'assets/images/ameriqueSud/fire5.png',
    'assets/images/ameriqueSud/fire6.png',
    'assets/images/ameriqueSud/fire7.png',
    'assets/images/ameriqueSud/fire8.png',
    'assets/images/ameriqueSud/fire9.png',
  ];
  int score = 0;

  void mettreAJourEtat0() {
    setState(() {
      _ignore[0] = true;
    });
  }

  void mettreAJourEtat1() {
    setState(() {
      _ignore[1] = true;
    });
  }

  void mettreAJourEtat2() {
    setState(() {
      _ignore[2] = true;
    });
  }

  void mettreAJourEtat3() {
    setState(() {
      _ignore[3] = true;
    });
  }

  void mettreAJourEtat4() {
    setState(() {
      _ignore[4] = true;
    });
  }

  void mettreAJourEtat5() {
    setState(() {
      _ignore[5] = true;
    });
  }

  void mettreAJourEtat6() {
    setState(() {
      _ignore[6] = true;
    });
  }

  void mettreAJourEtat7() {
    setState(() {
      _ignore[7] = true;
    });
  }

  void mettreAJourEtat8() {
    setState(() {
      _ignore[8] = true;
    });
  }

  void getScore(int S) {
    score = S;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              //color: Colors.blue,
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/ameriqueSud/backgroundsouthamericaminijeu.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * (30 / 360),
            left: MediaQuery.of(context).size.width * (0 / 800),
            child: fire(fireImage: feu[0], callback: mettreAJourEtat0),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * (60.37 / 360),
            left: MediaQuery.of(context).size.width * (105 / 800),
            child: fire(fireImage: feu[1], callback: mettreAJourEtat1),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * (0 / 360),
            left: MediaQuery.of(context).size.width * (57.84 / 800),
            child: fire(fireImage: feu[2], callback: mettreAJourEtat2),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * (37.62 / 360),
            left: MediaQuery.of(context).size.width * (257.6 / 800),
            child: fire(fireImage: feu[3], callback: mettreAJourEtat3),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * (61.16 / 360),
            left: MediaQuery.of(context).size.width * (393.79 / 800),
            child: fire(fireImage: feu[4], callback: mettreAJourEtat4),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * (0 / 360),
            left: MediaQuery.of(context).size.width * (363.05 / 800),
            child: fire(fireImage: feu[5], callback: mettreAJourEtat5),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * (25.42 / 360),
            right: MediaQuery.of(context).size.width * (114 / 800),
            child: fire(fireImage: feu[6], callback: mettreAJourEtat6),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * (56.54 / 360),
            right: MediaQuery.of(context).size.width * (0 / 800),
            child: fire(fireImage: feu[7], callback: mettreAJourEtat7),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * (0 / 360),
            right: MediaQuery.of(context).size.width * (0 / 800),
            child: fire(fireImage: feu[8], callback: mettreAJourEtat8),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * (30 / 360),
            left: MediaQuery.of(context).size.width * (29 / 800),
            child: Column(
              children: [
                Stack(
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
                        setState(() {
                          if (_icone == Icons.music_note) {
                            _icone = Icons.music_off;
                          } else {
                            _icone = Icons.music_note;
                          }
                        });
                      },
                      icon: Icon(_icone),
                      iconSize: MediaQuery.of(context).size.width * (25 / 800),
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
                      //margin: EdgeInsets.only(bottom: 12.0),
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
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_rounded),
                      iconSize: MediaQuery.of(context).size.width * (30 / 800),
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
                  //margin: EdgeInsets.only(bottom: 12.0),
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
                                  numStation: 5,
                                  background:
                                      'assets/images/ameriqueSud/Background_SouthAmerica_1.png',
                                )));
                  },
                  icon: const Icon(Icons.question_mark),
                  iconSize: MediaQuery.of(context).size.width * 0.035,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ],
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * (340 / 800),
            top: MediaQuery.of(context).size.height * (20 / 360),
            child: Time(
              stationIndex: 5,
              ignore: _ignore[0] &&
                  _ignore[1] &&
                  _ignore[2] &&
                  _ignore[3] &&
                  _ignore[4] &&
                  _ignore[5] &&
                  _ignore[6] &&
                  _ignore[7] &&
                  _ignore[8],
              callback: getScore,
              background:
                  'assets/images/ameriqueSud/Background_SouthAmerica_1.png',
              station: 'Station 06',
              refreshPath: '/AmeriqueSudMiniJeu',
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../Screens/help.dart';
import '../../Widgets/Iconbutton.dart';
import '../../Widgets/Oceanie/Timer.dart';
import '../../Widgets/Oceanie/GarbagItem.dart';

class Oceanie_miniJeu extends StatefulWidget {
  @override
  State<Oceanie_miniJeu> createState() => _Oceanie_miniJeuState();
}

class _Oceanie_miniJeuState extends State<Oceanie_miniJeu> {
  IconData _icone = Icons.music_note;
  List<bool> _ignore = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<String> listeGarbages = [
    'assets/images/oceanie/boutle.png',
    'assets/images/oceanie/materialTrash1.png',
    'assets/images/oceanie/materialTrash2.png',
    'assets/images/oceanie/banana.png',
    'assets/images/oceanie/plasticSac.png',
    'assets/images/oceanie/sacPoubelle.png',
  ];
  List<String> animal = [
    'assets/images/oceanie/cancer.png',
    'assets/images/oceanie/poisson_violet.png',
    'assets/images/oceanie/hippocamps.png',
    'assets/images/oceanie/poisson_jaune.png',
    'assets/images/oceanie/poisson_rose.png',
    'assets/images/oceanie/tortue.png',
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

  void getScore(int S) {
    score = S;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            //height: MediaQuery.of(context).size.height,
            //width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              //color: Colors.blue,
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/oceanie/background_oceania_minijeu.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: MediaQuery.of(context).size.width * (95.98 / 800),
            child: Garbage(
                garbageImage: listeGarbages[0],
                animalImage: animal[0],
                callback: mettreAJourEtat0),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * (135 / 360),
            right: MediaQuery.of(context).size.width * (327 / 800),
            child: Garbage(
                garbageImage: listeGarbages[1],
                animalImage: animal[1],
                callback: mettreAJourEtat1),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * (53 / 360),
            left: MediaQuery.of(context).size.width * (263 / 800),
            child: Garbage(
                garbageImage: listeGarbages[2],
                animalImage: animal[2],
                callback: mettreAJourEtat2),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * (109 / 360),
            left: MediaQuery.of(context).size.width * (65 / 800),
            child: Garbage(
                garbageImage: listeGarbages[3],
                animalImage: animal[3],
                callback: mettreAJourEtat3),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * (43 / 360),
            right: MediaQuery.of(context).size.width * (139 / 800),
            child: Garbage(
                garbageImage: listeGarbages[4],
                animalImage: animal[4],
                callback: mettreAJourEtat4),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * (20.24 / 360),
            left: MediaQuery.of(context).size.width * (113 / 800),
            child: Garbage(
                garbageImage: listeGarbages[5],
                animalImage: animal[5],
                callback: mettreAJourEtat5),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * (30 / 360),
            left: MediaQuery.of(context).size.width * (29 / 800),
            child: Column(
              children: [
                Container(
                    child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * (39 / 800),
                      height: MediaQuery.of(context).size.width * (39 / 800),
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
                      iconSize: MediaQuery.of(context).size.width * (25 / 800),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * (5 / 360),
                ),
                Container(
                    child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      //margin: EdgeInsets.only(bottom: 12.0),
                      width: MediaQuery.of(context).size.width * (40 / 800),
                      height: MediaQuery.of(context).size.width * (40 / 800),
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
                      iconSize: MediaQuery.of(context).size.width * (30 / 800),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                )),
              ],
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * (32 / 800),
            top: MediaQuery.of(context).size.height * (30 / 360),
            child: Container(
                child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  //margin: EdgeInsets.only(bottom: 12.0),
                  width: MediaQuery.of(context).size.width * (40 / 800),
                  height: MediaQuery.of(context).size.width * (40 / 800),
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
                            builder: (context) => helpPage(
                                  numStation: 0,
                                  background:
                                      'assets/images/oceanie/Background_Ocean_1.png',
                                )));
                  },
                  icon: Icon(Icons.question_mark),
                  iconSize: MediaQuery.of(context).size.width * 0.035,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ],
            )),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * (340 / 800),
            top: MediaQuery.of(context).size.height * (20 / 360),
            child: Time(
              ignore: _ignore[0] &&
                  _ignore[1] &&
                  _ignore[2] &&
                  _ignore[3] &&
                  _ignore[4] &&
                  _ignore[5],
              callback: getScore,
              background: 'assets/images/oceanie/Background_Ocean_1.png',
              station: 'Station 01',
              refreshPath: '/OceanieMiniJeu',
            ),
          ),
        ],
      ),
    );
  }
}

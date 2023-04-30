import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_2cp/Screens/MiniJeux/OceanieMiniJeu.dart';
import '../Widgets/CustomContainer.dart';
import '../Widgets/PointBar.dart';
import '../Widgets/ChooseBoxgame2.dart';

class ChooseGamePage extends StatefulWidget {
  final String pathBackGround;
  int EtoilesQuiz = 0;
  int EtoilesJeu = 2;
  String pathQuiz;
  String pathJeu;

  @override
  State<ChooseGamePage> createState() => _ChooseGamePageState();

  ChooseGamePage({
    required this.pathBackGround,
    // required this.EtoilesJeu,
    // required this.EtoilesQuiz,
    required this.pathJeu,
    required this.pathQuiz,
    Key? key,
  }) : super(key: key);

  String getPathBackGround() {
    return this.pathBackGround;
  }

  int getEtoilesQuiz() {
    return this.EtoilesQuiz;
  }

  int getEtoilesjeu() {
    return this.EtoilesJeu;
  }

  void setEtoilesQuiz(int score) {
    this.EtoilesQuiz = score;
  }

  void setEtoilesJeu(int score) {
    this.EtoilesJeu = score;
  }
}

class _ChooseGamePageState extends State<ChooseGamePage> {
  IconData _icone = Icons.music_note; //attribut de la classe

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.getPathBackGround()),
            fit: BoxFit.cover,
          ),
        ),
        width: screenWidth,
        height: screenHeight,
        child: Center(
          child: Stack(
            children: [
              Positioned(
                left: screenWidth * 0.418,
                top: screenHeight * 0.06,
                child: PointBar(score: 252), //exmple of score
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.033,
                top: MediaQuery.of(context).size.height * 0.08,
                child: Column(
                  children: [
                    Container(
                        child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * (39 / 800),
                          height:
                              MediaQuery.of(context).size.width * (39 / 800),
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
                          iconSize:
                              MediaQuery.of(context).size.width * (20 / 800),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ],
                    )),
                    SizedBox(
                      height: screenHeight * (12 / 360),
                    ),
                    Container(
                        child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          //margin: EdgeInsets.only(bottom: 12.0),
                          width: MediaQuery.of(context).size.width * (39 / 800),
                          height:
                              MediaQuery.of(context).size.width * (39 / 800),
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
                          icon: Icon(Icons.map_outlined),
                          iconSize:
                              MediaQuery.of(context).size.width * (20 / 800),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
              Positioned(
                left: screenWidth * (91.95 / 800),
                top: screenHeight * (137.43 / 360),
                child: Row(
                  children: [
                    ChooseBoxgame(
                      text: "Quiz",
                      pourcentage1: (241 / 800),
                      pourcentage2: (161 / 360),
                      pourcentage3: 0,
                      pourcentageFont: (49 / 800),
                      pourcentageRaduis: (40 / 800),
                      TextFont: 'Atma',
                      TextColor: Colors.black,
                      Stars: widget.EtoilesQuiz,
                      path: widget.pathQuiz,
                    ),
                    SizedBox(
                      width: screenWidth * (119 / 800),
                    ),
                    ChooseBoxgame(
                      text: "Mini Jeu",
                      pourcentage1: (241 / 800),
                      pourcentage2: (161 / 360),
                      pourcentage3: 0,
                      pourcentageFont: (45 / 800),
                      pourcentageRaduis: (40 / 800),
                      TextFont: 'Atma',
                      TextColor: Colors.black,
                      Stars: widget.EtoilesJeu,
                      path: widget.pathJeu,
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

import 'package:flutter/material.dart';
import 'package:projet_2cp/backend/progress_controllers.dart';
import 'package:projet_2cp/progress/progress.dart';
import '../Screens/MiniJeux/OceanieMiniJeu.dart';
import '../Widgets/CustomContainer.dart';
import '../Widgets/PointBar.dart';
import '../Widgets/ChooseBoxgame2.dart';
import 'package:projet_2cp/try.dart';

class ChooseGamePage extends StatefulWidget {
  final String pathBackGround;
  final int stationIndex;
  int EtoilesQuiz = 0;
  int EtoilesJeu = 0;
  String pathQuiz;
  String pathJeu;

  @override
  State<ChooseGamePage> createState() => _ChooseGamePageState();

  ChooseGamePage({
    required this.pathBackGround,
    required this.stationIndex,
    required this.pathJeu,
    required this.pathQuiz,
    Key? key,
  }) : super(key: key);

  String getPathBackGround() {
    return pathBackGround;
  }

  int getEtoilesQuiz() {
    return EtoilesQuiz;
  }

  int getEtoilesjeu() {
    return EtoilesJeu;
  }

  void setEtoilesQuiz(int score) {
    EtoilesQuiz = score;
  }

  void setEtoilesJeu(int score) {
    EtoilesJeu = score;
  }
}

class _ChooseGamePageState extends State<ChooseGamePage> {
  IconData _icone = Icons.music_note;

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
                child: PointBar(score: userProgress.leaves),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.033,
                top: MediaQuery.of(context).size.height * 0.08,
                child: Column(
                  children: [
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
                              MediaQuery.of(context).size.width * (25 / 800),
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * (5 / 360),
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
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => tryi(),
                                ));
                          },
                          icon: const Icon(Icons.map_outlined),
                          iconSize:
                              MediaQuery.of(context).size.width * (24 / 800),
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ],
                    ),
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
                      textFont: 'Atma',
                      TextColor: Colors.black,
                      Stars: userProgress
                          .stations[widget.stationIndex].games[0].stars,
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
                      textFont: 'Atma',
                      TextColor: Colors.black,
                      Stars: userProgress
                          .stations[widget.stationIndex].games[1].stars,
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

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:projet_2cp/Screens/quiz/quiz_db.dart';

import '../../Widgets/Iconbutton.dart';
import '../../Widgets/PointBar.dart';
import '../EndGamePage.dart';
// import '../../widgets.dart';
// import '../games.dart';

late bool clickRight;
List<int> choices = [0, 1, 2, 3];
List<Question> qqsBank = [];
final player = AudioPlayer();
bool didAnswer = false;
//                       *****************
// ***************         THE QUIZ GAME        ******************
//                       *****************

class BigQuiz extends StatefulWidget {
  final int continentNumber;

  const BigQuiz({
    super.key,
    required this.continentNumber,
  });

  @override
  State<BigQuiz> createState() => _BigQuizState();
}

class _BigQuizState extends State<BigQuiz> {
  void loadQuestions() async {
    qqsBank = [];
    Future<List<Question>> q = QuizData.getQuestions(widget.continentNumber);
    List<Question> questions = await q;
    setState(() {
      for (int i = 0; i < questions.length; i++) {
        qqsBank.add(questions[i]);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadQuestions();
    setState(() {
      clickRight = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Quiz(
      continentNumber: widget.continentNumber,
    );
  }
}

//                       *****************
// ***************         THE QUIZ GAME        ******************
//                       *****************

class Quiz extends StatefulWidget {
  final int continentNumber;

  const Quiz({
    super.key,
    required this.continentNumber,
  });

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int score = 0;
  int currentQqs = 0;

  answerQqs() {
    setState(() {
      didAnswer = true;
    });
  }

  int findRightAnswer() {
    bool find = false;
    int i = 0;
    while (!find) {
      if (qqsBank[currentQqs].choices[choices[i]] ==
          qqsBank[currentQqs].rightAnswer) {
        find = true;
        return choices[i];
      }
      i++;
    }
    return -1;
  }

  void incrementScore() {
    clickRight = false;
    setState(() {
      score++;
    });
  }

  void changeQuestion() {
    setState(() {
      if (currentQqs < qqsBank.length - 1) {
        currentQqs++;
        clickRight = true;
        choices.shuffle();

        // Fixing the positioning of the answers TOUTES LES REPONSES ET AUCUNE REPONSE with putting them as the last QuizOption
        if (qqsBank[currentQqs].choices.contains("Toutes les réponses")) {
          int indexOfConvert = choices[3];
          if (qqsBank[currentQqs].choices.elementAt(choices[0]) ==
              "Toutes les réponses") {
            choices[3] = choices[0];
            choices[0] = indexOfConvert;
          } else if (qqsBank[currentQqs].choices.elementAt(choices[1]) ==
              "Toutes les réponses") {
            choices[3] = choices[1];
            choices[1] = indexOfConvert;
          } else if (qqsBank[currentQqs].choices.elementAt(choices[2]) ==
              "Toutes les réponses") {
            choices[3] = choices[2];
            choices[2] = indexOfConvert;
          } else if (qqsBank[currentQqs].choices.elementAt(choices[3]) ==
              "Toutes les réponses") {
            choices[3] = choices[3];
            choices[3] = indexOfConvert;
          }
        } else if (qqsBank[currentQqs].choices.contains("Aucune réponse")) {
          int indexOfConvert = choices[3];
          if (qqsBank[currentQqs].choices.elementAt(choices[0]) ==
              "Aucune réponse") {
            choices[3] = choices[0];
            choices[0] = indexOfConvert;
          } else if (qqsBank[currentQqs].choices.elementAt(choices[1]) ==
              "Aucune réponse") {
            choices[3] = choices[1];
            choices[1] = indexOfConvert;
          } else if (qqsBank[currentQqs].choices.elementAt(choices[2]) ==
              "Aucune réponse") {
            choices[3] = choices[2];
            choices[2] = indexOfConvert;
          } else if (qqsBank[currentQqs].choices.elementAt(choices[3]) ==
              "Aucune réponse") {
            choices[3] = choices[3];
            choices[3] = indexOfConvert;
          }
        }
      } else {
        clickRight = false;
        endGame();
      }
    });
  }

  void endGame() {
    int stars;
    int stage = qqsBank.length ~/ 3;
    String refreshPath;
    String background;
    (score >= qqsBank.length - 1)
        ? stars = 3
        : (score >= qqsBank.length - stage)
            ? stars = 2
            : (score >= qqsBank.length - stage * 2)
                ? stars = 1
                : stars = 0;
    // push to the endGameWidget
    if (widget.continentNumber == 0) {
      refreshPath = '/QuizOceanie';
    } else if (widget.continentNumber == 1) {
      refreshPath = '/QuizAsie';
    } else if (widget.continentNumber == 2) {
      refreshPath = '/QuizAfrique';
    } else if (widget.continentNumber == 3) {
      refreshPath = '/QuizEurope';
    } else if (widget.continentNumber == 4) {
      refreshPath = '/QuizAmeriqueNord';
    } else {
      refreshPath = '/QuizAmeriqueSud';
    }
    if (widget.continentNumber == 0) {
      background = 'assets/images/oceanie/Background_Ocean_1.png';
    } else if (widget.continentNumber == 1) {
      background = 'assets/images/asie/Background_Asia.png';
    } else if (widget.continentNumber == 2) {
      background = 'assets/images/afrique/Background_Africa_1.png';
    } else if (widget.continentNumber == 3) {
      background = 'assets/images/europeBackground.png';
    } else if (widget.continentNumber == 4) {
      background = 'assets/images/ameriqueNord/Background_NorthAmerica.png';
    } else {
      background = 'assets/images/ameriqueSud/Background_SouthAmerica_1.png';
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => EndGamePage(
                background: background,
                stars: stars,
                score: score,
                station: 'Station 0${widget.continentNumber + 1}',
                refreshPath: refreshPath,
              )),
    );
  }

  @override
  void initState() {
    super.initState();
    clickRight = true;
    choices.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    IconData _icone = Icons.music_note;
    String background;
    if (clickRight) {
      playQqs(
          'quiz/question${widget.continentNumber + 1}_${qqsBank[currentQqs].number + 1}');
    }
    if (widget.continentNumber == 0) {
      background = 'assets/images/oceanie/Background_Ocean_1.png';
    } else if (widget.continentNumber == 1) {
      background = 'assets/images/asie/Background_Asia.png';
    } else if (widget.continentNumber == 2) {
      background = 'assets/images/afrique/Background_Africa_1.png';
    } else if (widget.continentNumber == 3) {
      background = 'assets/images/europeBackground.png';
    } else if (widget.continentNumber == 4) {
      background = 'assets/images/ameriqueNord/Background_NorthAmerica.png';
    } else {
      background = 'assets/images/ameriqueSud/Background_SouthAmerica_1.png';
    }
    print(qqsBank.length);
    print(currentQqs);
    return Scaffold(
      body: SafeArea(
        child: Container(
          // width: double.infinity,
          // height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(background),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.08333333,
                left: MediaQuery.of(context).size.width * 0.0336,
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
                      height: MediaQuery.of(context).size.height * (12 / 360),
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
                          icon: Icon(Icons.close_rounded),
                          iconSize:
                              MediaQuery.of(context).size.width * (25 / 800),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PointBar(score: score),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          QuestionBox(
                            question: currentQqs,
                            continentNumber: widget.continentNumber,
                            pourcentage1: 0.26625,
                            pourcentage2: 0.591666,
                            pourcentage3: 0.10125,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                QuizOption(
                                  answerQqs: answerQqs,
                                  findRightAnswer: findRightAnswer,
                                  question: currentQqs,
                                  choice: choices[0],
                                  changeScore: incrementScore,
                                  changeQuestion: changeQuestion,
                                  endGame: endGame,
                                  pourcentage1: 0.395,
                                  pourcentage2: 0.111111,
                                  pourcentage3: 0.04722,
                                  pourcentageFont: 0.02,
                                  pourcentageRaduis: 0.01875,
                                ),
                                QuizOption(
                                  answerQqs: answerQqs,
                                  findRightAnswer: findRightAnswer,
                                  question: currentQqs,
                                  choice: choices[1],
                                  changeScore: incrementScore,
                                  changeQuestion: changeQuestion,
                                  endGame: endGame,
                                  pourcentage1: 0.395,
                                  pourcentage2: 0.111111,
                                  pourcentage3: 0.04722,
                                  pourcentageFont: 0.02,
                                  pourcentageRaduis: 0.01875,
                                ),
                                QuizOption(
                                  answerQqs: answerQqs,
                                  findRightAnswer: findRightAnswer,
                                  question: currentQqs,
                                  choice: choices[2],
                                  changeScore: incrementScore,
                                  changeQuestion: changeQuestion,
                                  endGame: endGame,
                                  pourcentage1: 0.395,
                                  pourcentage2: 0.111111,
                                  pourcentage3: 0.04722,
                                  pourcentageFont: 0.02,
                                  pourcentageRaduis: 0.01875,
                                ),
                                QuizOption(
                                  answerQqs: answerQqs,
                                  findRightAnswer: findRightAnswer,
                                  question: currentQqs,
                                  choice: choices[3],
                                  changeScore: incrementScore,
                                  changeQuestion: changeQuestion,
                                  endGame: endGame,
                                  pourcentage1: 0.395,
                                  pourcentage2: 0.111111,
                                  pourcentage3: 0.04722,
                                  pourcentageFont: 0.02,
                                  pourcentageRaduis: 0.01875,
                                ),
                              ]),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ************** Question Box Widget *****************

class QuestionBox extends StatelessWidget {
  final int question;
  final continentNumber;
  final double pourcentage1;
  final double pourcentage2;
  final double pourcentage3;

  const QuestionBox({
    super.key,
    required this.question,
    required this.continentNumber,
    required this.pourcentage1,
    required this.pourcentage2,
    required this.pourcentage3,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        playQqs(
            'quiz/question${continentNumber + 1}_${qqsBank[question].number + 1}');
      },
      child: Container(
        margin: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * pourcentage3),
        width: MediaQuery.of(context).size.width * pourcentage1,
        height: MediaQuery.of(context).size.height * pourcentage2,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: const Color(0xff135617),
            width: 3,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            qqsBank[question].question,
            style: TextStyle(
              fontFamily: 'Atma',
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.02375,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

// ************** Quiz Option Widget *****************

class QuizOption extends StatefulWidget {
  final int question, choice;
  final Function changeScore,
      changeQuestion,
      endGame,
      findRightAnswer,
      answerQqs;
  final double pourcentage1;
  final double pourcentage2;
  final double pourcentage3;
  final double pourcentageFont;
  final double pourcentageRaduis;

  const QuizOption({
    super.key,
    required this.question,
    required this.choice,
    required this.changeScore,
    required this.changeQuestion,
    required this.endGame,
    required this.answerQqs,
    required this.findRightAnswer,
    required this.pourcentage1,
    required this.pourcentage2,
    required this.pourcentage3,
    required this.pourcentageFont,
    required this.pourcentageRaduis,
  });

  @override
  State<QuizOption> createState() => _QuizOptionState();
}

class _QuizOptionState extends State<QuizOption> {
  Color clr = Colors.white, borderClr = const Color.fromRGBO(19, 86, 23, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * widget.pourcentage3),
      width: MediaQuery.of(context).size.width * widget.pourcentage1,
      height: MediaQuery.of(context).size.height * widget.pourcentage2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * widget.pourcentageRaduis),
        border: Border.all(
          color: borderClr,
          width: 3,
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          if (clickRight) {
            setState(() {
              clickRight = false;
              if (qqsBank[widget.question].choices[widget.choice] ==
                  qqsBank[widget.question].rightAnswer) {
                setState(() {
                  Future.delayed(const Duration(milliseconds: 200))
                      .then((value) {
                    setState(() {
                      clr = const Color.fromRGBO(127, 232, 79, 1);
                    });
                  });
                });
                widget.changeScore();
              } else {
                Future.delayed(const Duration(milliseconds: 200)).then((_) {
                  setState(() {
                    clr = const Color.fromRGBO(232, 69, 96, 1);
                    borderClr = const Color.fromRGBO(117, 38, 131, 1);
                  });
                }).then((_) {
                  Future.delayed(const Duration(milliseconds: 200)).then((_) {
                    widget.answerQqs();
                  });
                });
              }
              Future.delayed(const Duration(milliseconds: 2000)).then((value) {
                setState(() {
                  clickRight = true;
                  clr = Colors.white;
                  borderClr = borderClr = const Color.fromRGBO(19, 86, 23, 1);
                });
                if (widget.question < qqsBank.length) {
                  widget.changeQuestion();
                } else {
                  widget.endGame();
                }
              });
            });
          }
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor:
              !clickRight && widget.findRightAnswer() == widget.choice
                  ? const Color.fromRGBO(127, 232, 79, 1)
                  : clr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * widget.pourcentageRaduis -
                    3),
          ),
        ),
        child: Center(
          child: Text(
            qqsBank[widget.question].choices[widget.choice],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Atma',
              fontWeight: FontWeight.w500,
              fontSize:
                  MediaQuery.of(context).size.width * widget.pourcentageFont,
            ),
          ),
        ),
      ),
    );
  }
}

void playQqs(sound) {
  player.play(
    AssetSource(
      'sounds/questions/$sound.mp3',
    ),
  );
}

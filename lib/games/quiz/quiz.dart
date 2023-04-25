import 'package:flutter/material.dart';
import '../../backend/progress_controllers.dart';
import '../../constants.dart';
import '../../widgets.dart';
import '../games.dart';
// import '../../data/data.dart'; I want to use for the reason of ThemeCard so I will be able to transfer the background Image and more information here


late bool clickRight;
List<int> choices = [0, 1, 2, 3];
List<Question> qqsBank = [];

class BigQuiz extends StatefulWidget {
  final ChildProgress childProgress;
  final ThemeProgress themeProgress;
  final GameProgress gameProgress;

  const BigQuiz({
    super.key,
    required this.childProgress,
    required this.themeProgress,
    required this.gameProgress
  });

  @override
  State<BigQuiz> createState() => _BigQuizState();
}

class _BigQuizState extends State<BigQuiz> {
  void loadQuestions() async {
    qqsBank = [];
    Future<List<Question>> q = QuizData.getQuestions(widget.themeProgress.themeIndex);
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
        childProgress: widget.childProgress,
        themeProgress: widget.themeProgress,
        gameProgress: widget.gameProgress
    );
  }
}

class Quiz extends StatefulWidget {
  final ChildProgress childProgress;
  final ThemeProgress themeProgress;
  final GameProgress gameProgress;

  const Quiz({
    super.key,
    required this.childProgress,
    required this.themeProgress,
    required this.gameProgress
  });

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int score = 0;
  int currentQqs = 0;

  void incrementScore() {
    clickRight = false;
    setState(() {
      score++;
    });
  }

  void changeQuestion() {
    setState(() {
      if (currentQqs < qqsBank.length) {
        currentQqs++;
        clickRight = true;
        choices.shuffle();
      } else {
        clickRight = false;
        endGame();
      }
    });
  }

  void endGame() {
    int stars = 0;
    int stage = qqsBank.length ~/ 3;
    (score >= qqsBank.length - 1) ? stars = 3: ( score >= qqsBank.length - stage) ? stars = 2 : ( score >= qqsBank.length - stage*2) ? stars = 1 : stars = 0;

    dataUpdator(context, widget.themeProgress, widget.gameProgress, stars);
    EndGamePage(
      stars: stars,
      background: 'assets/images/europe background.png', // Needs to be changed to background which is a String entered to the BigQuiz widget that represents a path
      score: 105, // Needs to be changed to totalScore which is an integer entered to the BigQuiz widget
      station: 'station 01', // Needs to be changed to a String entered to the BigQuiz widget to determine the name of the station
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
    if (clickRight) {
      playQqs('quiz/question1_${qqsBank[currentQqs].number + 1}');
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/europe background.png'), // Path to the background I need to change it later
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height*0.08333333,
                left: MediaQuery.of(context).size.width*0.0336,
                child: Column( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Iconbutton(icon: const Icon(Icons.music_note)),
                      Iconbutton(icon: const Icon(Icons.clear)),
                    ]),
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
                            pourcentage1: 0.26625,
                            pourcentage2: 0.591666,
                            pourcentage3: 0.10125,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              QuizOption(
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
                            ]
                          ),
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
  final double pourcentage1;
  final double pourcentage2;
  final double pourcentage3;

  const QuestionBox({
    super.key,
    required this.question,
    required this.pourcentage1,
    required this.pourcentage2,
    required this.pourcentage3,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        playQqs('quiz/question1_${qqsBank[question].number + 1}');
      },
      child: Container(
        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * pourcentage3),
        width: MediaQuery.of(context).size.width * pourcentage1,
        height: MediaQuery.of(context).size.height* pourcentage2,
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
              fontSize: MediaQuery.of(context).size.width*0.02375,
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
  final Function changeScore, changeQuestion, endGame;
  final double pourcentage1;
  final double pourcentage2;
  final double pourcentage3;
  final double pourcentageFont;
  final  double  pourcentageRaduis;

  const QuizOption({
    super.key,
    required this.question,
    required this.choice,
    required this.changeScore,
    required this.changeQuestion,
    required this.endGame,
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
  Color clr = white, borderClr = const Color.fromRGBO(19, 86, 23, 1);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if (clickRight) {
          setState(() {
            clickRight = false;
            if (qqsBank[widget.question].choices[widget.choice] == qqsBank[widget.question].rightAnswer) {
              setState(() {
                Future.delayed(const Duration(milliseconds: 500)).then((value) {
                  setState(() {
                    clr = const Color.fromRGBO(127, 232, 79, 1);
                  });
                });
              });
              widget.changeScore();
            } else {
              Future.delayed(const Duration(milliseconds: 500)).then((value) {
                setState(() {
                  clr = const Color.fromRGBO(232, 69, 96, 1);
                  borderClr = const Color.fromRGBO(117, 38, 131, 1);
                });
              });
            }
            Future.delayed(const Duration(seconds: 2)).then((value) {
              setState(() {
                clickRight = true;
                clr = white;
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
      child: Container(
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * widget.pourcentage3),
        width: MediaQuery.of(context).size.width * widget.pourcentage1,
        height: MediaQuery.of(context).size.height* widget.pourcentage2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*widget.pourcentageRaduis),
          border: Border.all(
            color:  borderClr,
            width: 3,
          ),
        ),
        child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: clr,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*widget.pourcentageRaduis),
            ),
          ),
          child: Center(
            child: Text(
              qqsBank[widget.question].choices[widget.choice],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Atma',
                fontSize: MediaQuery.of(context).size.width*widget.pourcentageFont,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

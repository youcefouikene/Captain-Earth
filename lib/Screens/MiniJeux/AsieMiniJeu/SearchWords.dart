import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:pommy/backend/progress_controllers.dart';
// import 'package:pommy/data/data.dart';
// import 'package:pommy/widgets.dart';
// import 'package:pommy/constants.dart';
import 'package:projet_2cp/Screens/EndGamePage.dart';
import 'TimerAsie.dart';
import 'package:projet_2cp/Widgets/PointBar.dart';
import '../../../constants.dart';
import '../../help.dart';
import 'constdata.dart';

Offset start = Offset(0, 0);
Offset oldend = Offset(0, 0);
Offset fakend = Offset(0, 0);
Offset end = Offset(0, 0);

List<List<Offset>> points = [];

class SearchWords extends StatefulWidget {
  // final ChildProgress childProgress;
  // final ThemeProgress themeProgress;
  // final GameProgress gameProgress;
  // SearchWords(
  //     {required this.childProgress,
  //     required this.themeProgress,
  //     required this.gameProgress});

  @override
  State<SearchWords> createState() => _SearchWordsState();
}

class _SearchWordsState extends State<SearchWords> {
  String word = '';
  void generateWord(int x1, int y1, int x2, int y2) {
    setState(() {
      word = '';
      int i, j;
      if (x1 == x2 && y1 == y2) {
        word += game[y1][x1];
      } else {
        if (x1 == x2) {
          j = y1;
          while (j < y2) {
            word += game[j][x2];
            j++;
          }
          while (j > y2) {
            word += game[j][x2];
            j--;
          }
        } else if (y1 == y2) {
          i = x1;
          while (i < x2) {
            word += game[y2][i];
            i++;
          }
          while (i > x2) {
            word += game[y2][i];
            i--;
          }
        } else if (cos(x1 - x2) == cos(y1 - y2)) {
          i = x1;
          j = y1;
          while (i < x2 && j < y2) {
            word += game[j++][i++];
          }
          while (i < x2 && j > y2) {
            word += game[j--][i++];
          }
          while (i > x2 && j < y2) {
            word += game[j++][i--];
          }
          while (i > x2 && j > y2) {
            word += game[j--][i--];
          }
        }
        word += game[y2][x2];
      }
    });
  }

  TextButton sizeBtn(int siz) {
    return TextButton(
        onPressed: () {
          setState(() {
            size = siz;
            boardDim = size * dim;
            found = [];
            points = [];
          });
        },
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Container(
          height: 48.0,
          width: 48.0,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 4.0, color: const Color(0xff408E40)),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              siz.toString(),
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff408E40),
              ),
            ),
          ),
        ));
  }

  Widget letterSquare(String letter) {
    return Container(
      width: dim,
      height: dim,
      child: Center(
        child: Text(
          letter,
          style: const TextStyle(
            fontFamily: 'Atma',
            fontSize: 30.0,
            color: Color(0xff408E40),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  late List<String> game;
  late List<String> words;
  late List<String> found = [];

  int x = 0, y = 0, a = 0, b = 0;

  int score = 0;
  // int time = 120;
  String apple = 'assets/images/avatar/captain_earth_hi.png';
  late double angle;
  List<double> angles = [0, pi / 2, pi, 3 * pi / 2];

  void generateGame() {
    setState(() {
      Random rnd = Random();
      angle = angles[rnd.nextInt(angles.length)];
      int x = Random().nextInt(3);
      String alphabets = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      game = [];
      for (int i = 0; i < size; i++) {
        game.add('');
        for (int j = 0; j < size; j++) {
          game[i] += (boards[x]['game']![i][j]);
        }
      }
      // game = boards[x]['game']!;
      words = boards[x]['words']!;
      int i = 0, j = 0;
      while (i < size) {
        while (j < size) {
          if (game[i][j] == '*') {
            game[i] = game[i].substring(0, j) +
                alphabets[rnd.nextInt(alphabets.length)] +
                game[i].substring(j + 1, size);
          }
          j++;
        }
        j = 0;
        i++;
      }
      points = [];
    });
  }

  // void endGame() {
  //   int stars = 0;
  //   if (time > 60)
  //     stars = 3;
  //   else if (time > 30)
  //     stars = 2;
  //   else if (time > 0) {
  //     stars = 1;
  //   } else {
  //     stars = 0;
  //   }
  //   //dataUpdator(context, widget.themeProgress, widget.gameProgress, stars);
  //   showDialog(
  //     context: context,
  //     builder: (context) => EndGamePage(
  //         score: score,
  //         stars: stars,
  //         background: 'assets/images/ameriqueNord/Background_NorthAmerica.png',
  //         station: 'station 05',
  //         stationIndex: 4,
  //         refreshPath: 'rien'),
  //   );
  // }

  @override
  void initState() {
    super.initState();
    generateGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //topLeft: Closer(),
        // topRight: Row(
        //   children: [
        //     // Timer(
        //     //   time: time,
        //     //   gameTimer: () {
        //     //     setState(() {
        //     //       time--;
        //     //     });
        //     //     if (time == 0) {
        //     //       endGame();
        //     //     }
        //     //   },
        //     // ),
        //     SizedBox(width: 10.0),
        //     PointBar(score: score)
        //   ],
        // ),
        //apple: apple,
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/asie/Background_Asia.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TimeAsie(
                stationIndex: 1,
                ignore: (score == words.length),
                background: 'assets/images/asie/Background_Asia.png',
                station: 'station 02',
                refreshPath: '/AsieMiniJeu'),
            Container(
              height: MediaQuery.of(context).size.height * .7,
              width: MediaQuery.of(context).size.width * .65,
              decoration: BoxDecoration(
                color: Color(0xffE84560),
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(width: 2.0, color: Color(0xffE84560)),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 30,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Words :',
                            style: TextStyle(
                              fontFamily: 'Atma',
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          ...List.generate(
                            words.length,
                            (index) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20.0,
                                    width: 20.0,
                                    child: Center(
                                      child: Container(
                                        // margin: EdgeInsets.only(left: 8),
                                        height: found.contains(words[index])
                                            ? 20.0
                                            : 5.0,
                                        width: found.contains(words[index])
                                            ? 20.0
                                            : 5.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        child: found.contains(words[index])
                                            ? Icon(
                                                Icons.check,
                                                color: Color(0xff408E40),
                                                size: 21,
                                              )
                                            : null,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 40.0, width: 10.0),
                                  Text(
                                    words[index],
                                    style: TextStyle(
                                      fontFamily: 'Atma',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ), /* +
                              [
                                if (word != '')
                                  Text(
                                    String.fromCharCode(9679) + word,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: white,
                                    ),
                                  )
                              ],*/
                          ),
                        ]),
                  ),
                  Expanded(
                    flex: 70,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(30.0)),
                      ),
                      child: ClipRRect(
                        child: FittedBox(
                          child: Transform.rotate(
                            angle: angle,
                            child: Container(
                              width: boardDim,
                              height: boardDim,
                              child: Stack(
                                children: [
                                  Container(
                                    height: boardDim,
                                    width: boardDim,
                                    /* child: GridView.count(
                                              crossAxisCount: size,
                                              children: List.generate(
                                                  size * size,
                                                  (index) => letterSquare(
                                                      game[index ~/ size][index % size])),
                                            ),*/
                                    child: Column(
                                      children: List.generate(
                                          size,
                                          (i) => Row(
                                                children: List.generate(
                                                    size,
                                                    (j) => Transform.rotate(
                                                        angle: -1 * angle,
                                                        child: letterSquare(
                                                            game[i][j]))),
                                              )),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    onPanStart: (details) {
                                      setState(() {
                                        a = details.localPosition.dx ~/ 60;
                                        b = details.localPosition.dy ~/ 60;
                                        start = Offset(
                                            a * 60 + 30.0, b * 60 + 30.0);
                                        oldend = Offset(
                                            a * 60 + 30.0, b * 60 + 30.0);
                                        end = Offset(
                                            a * 60 + 30.0, b * 60 + 30.0);
                                        points.add([start]);
                                        points[points.length - 1].add(start);
                                        generateWord(a, b, a, b);
                                      });
                                    },
                                    onPanUpdate: (DragUpdateDetails details) {
                                      setState(() {
                                        x = details.localPosition.dx ~/ 60;
                                        y = details.localPosition.dy ~/ 60;
                                        fakend = Offset(
                                            x * 60 + 30.0, y * 60 + 30.0);
                                        if (x >= 0 &&
                                            x < size &&
                                            y >= 0 &&
                                            y < size) {
                                          if (cos(start.dx - fakend.dx) ==
                                                  cos(start.dy - fakend.dy) ||
                                              start.dx == fakend.dx ||
                                              start.dy == fakend.dy) {
                                            end = Offset(fakend.dx, fakend.dy);
                                            points[points.length - 1][1] = end;
                                            generateWord(a, b, x, y);
                                          }
                                        }
                                      });
                                    },
                                    onPanEnd: (details) {
                                      setState(() {
                                        points[points.length - 1][1] = end;
                                        if (a == x && b == y) {
                                          setState(() {
                                            word = '';
                                            points.removeLast();
                                            // apple = AppleStatus.wrong;
                                          });
                                        } else if (words.contains(word)) {
                                          if (!found.contains(word)) {
                                            found.add(word);
                                            score++;
                                            //apple = AppleStatus.right;
                                            // if (score == words.length) {
                                            //   endGame();
                                            // }
                                          } else {
                                            // apple = AppleStatus.right;
                                            points.removeLast();
                                          }
                                        } else {
                                          points.removeLast();
                                          // apple = AppleStatus.wrong;
                                        }
                                      });
                                      word = '';
                                    },
                                    child: Container(
                                      width: boardDim,
                                      height: boardDim,
                                      color: Colors.transparent,
                                      child: Board(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
                    width: MediaQuery.of(context).size.width * (39 / 800),
                    height: MediaQuery.of(context).size.width * (39 / 800),
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
                      // if (kSound) {
                      //   setState(() {
                      //     kSound = false;
                      //     backgroundPlayerOceanie.stopMusic();
                      //   });
                      // } else {
                      //   setState(() {
                      //     kSound = true;
                      //     backgroundPlayerOceanie.playMusic();
                      //   });
                      // }
                    },
                    icon: Icon(iconeTypeFunction()),
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
                      // backgroundPlayerOceanie.stopMusic();
                      // backgroundPlayerMap.playMusic();
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
    ));
  }
}

class FaceCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 32.0
      ..color = colors[0].withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    int i = 0;
    while (i < points.length) {
      canvas.drawLine(points[i][0], points[i][1], paint);
      i++;
      paint = Paint()
        ..strokeWidth = 32.0
        ..color = colors[i % colors.length].withOpacity(0.5)
        ..style = PaintingStyle.fill
        ..strokeCap = StrokeCap.round;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Board extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      isComplex: true,
      foregroundPainter: FaceCanvas(),
    );
  }
}

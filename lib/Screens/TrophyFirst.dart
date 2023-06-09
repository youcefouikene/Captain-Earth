import 'package:flutter/material.dart';

import '../constants.dart';
import '../settings.dart';
import '../try.dart';

class TrophyFirst extends StatefulWidget {
  const TrophyFirst({super.key});

  @override
  State<TrophyFirst> createState() => _TrophyFirstState();
}

class _TrophyFirstState extends State<TrophyFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff9EE7FB),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * (35 / 800)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width:
                                MediaQuery.of(context).size.width * (395 / 800),
                            height: MediaQuery.of(context).size.height *
                                (223.58 / 360),
                            decoration: BoxDecoration(
                              color: Color(0xffD9D9D9),
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width *
                                      (44 / 800)),
                              border: Border.all(
                                color: Color(0xff134E49),
                                width: 3,
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/images/trophy/trophy_0.png',
                            width:
                                MediaQuery.of(context).size.width * (129 / 800),
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * (19 / 360),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * (134 / 800),
                        height: MediaQuery.of(context).size.height * (39 / 360),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * (10 / 800)),
                          border: Border.all(
                            color: const Color(0xff7B2B85),
                            width: 3,
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            // backgroundPlayerMap.stopMusic();
                            // player1.stop();
                            // WidgetsFlutterBinding.ensureInitialized();
                            // kUser = 'guest';
                            // Future<UserProgress> g = getSQFLite('guest');
                            // userProgress = await g;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => tryi(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffE84560),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width *
                                          (10 / 800) -
                                      3),
                            ),
                          ),
                          child: Text(
                            'JOUER',
                            style: TextStyle(
                              fontFamily: 'Atma',
                              fontSize: MediaQuery.of(context).size.width *
                                  (24 / 800),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * (17 / 800),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * (25 / 360),
                    ),
                    child: Image.asset(
                      'assets/images/avatar/captain_earth_standing.png',
                      width: MediaQuery.of(context).size.width * (130 / 800),
                      fit: BoxFit.fitWidth,
                    ),
                  )
                ],
              ),
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
                          if (kSound) {
                            setState(() {
                              kSound = false;
                              backgroundPlayerMap.stopMusic();
                            });
                          } else {
                            setState(() {
                              kSound = true;
                              backgroundPlayerMap.playMusic();
                            });
                          }
                        },
                        icon: Icon(iconeTypeFunction()),
                        iconSize:
                            MediaQuery.of(context).size.width * (25 / 800),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ],
                  )),
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
          ],
        ));
  }
}

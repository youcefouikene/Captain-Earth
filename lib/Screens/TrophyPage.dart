import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projet_2cp/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:projet_2cp/constants.dart';
import 'package:projet_2cp/progress/progress.dart';
import 'package:projet_2cp/settings.dart';

class TrophyPage extends StatefulWidget {
  final int choixTrophe;
  TrophyPage(this.choixTrophe, {super.key});

  @override
  State<TrophyPage> createState() => _TrophyPageState();
}

class _TrophyPageState extends State<TrophyPage> {
  IconData _icone = Icons.music_note;

  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    backgroundPlayerMap.playMusic();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  Future<void> playAudio() async {
    await player.play(AssetSource('sound.mp3'));
  }

  List<String> trophes = [
    'assets/images/trophy/trophy_0.png',
    'assets/images/trophy/trophy_1.png',
    'assets/images/trophy/trophy_2.png',
    'assets/images/trophy/trophy_3.png'
  ];
  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double het = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(158, 231, 251, 1),
      body: Stack(
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Félicitations",
                      style: TextStyle(
                        color: const Color(0xff135617),
                        fontFamily: "Atma",
                        fontSize: wid * 46 / 800,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Image.asset(
                      trophes[widget.choixTrophe],
                      width: wid * 172 / 800,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
                SizedBox(
                  width: wid * 0 / 800,
                ),
                Image.asset(
                  'assets/images/avatar/Captain_jumping.png',
                  width: wid * 240 / 800,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  width: wid * 34 / 800,
                )
              ],
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
                      backgroundPlayerMap.stopMusic();
                      backgroundPlayerMap.playMusic();
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
            if(userProgress.leaves != 0) const WinningAnimation(),
      ]),
    );
  }
}

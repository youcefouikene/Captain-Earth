import 'package:flutter/material.dart';
import './Box4.dart';
import 'package:projet_2cp/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:projet_2cp/constants.dart';
import 'package:projet_2cp/settings.dart';
class screenVelo extends StatefulWidget {
  @override
  State<screenVelo> createState() => _screenVeloState();
}

class _screenVeloState extends State<screenVelo> {
  @override
  Widget build(BuildContext context) {
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
  playDefi("DefiVelo");
    return Scaffold(
      body: Container(
        color: Color(0xff9EE7FB),
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Box4(
                      pourcentage1: (499 / 800),
                      pourcentage2: (312 / 360),
                      text:
                          "Je me déplace à pied ou à vélo pour les petits trajets",
                      title: "Ayez le bon réflexe"),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * (23 / 360),
                      right: MediaQuery.of(context).size.width * (35 / 800),
                      left: MediaQuery.of(context).size.width * (29 / 800),
                    ),
                    child: Image.asset(
                      "assets/images/avatar/captain_earth_hi.png",
                      width: MediaQuery.of(context).size.width * (136 / 800),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
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
                        if(kSound){
                          setState(() {
                            kSound = false;
                            backgroundPlayerMap.stopMusic();
                          });
                        }else{
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
          ],
        ),
      ),
    );
  }
}

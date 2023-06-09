import 'package:flutter/material.dart';
import '../Widgets/StartBox.dart';
import '../try.dart';
import 'Profil/AjouterProfilPage.dart';
import 'Profil/ChoisirProfilPage.dart';
import '../settings.dart';
import '../progress/progress.dart';
import '../backend/local_progress/local_progress.dart';
import '../backend/progress_controllers.dart';
import '../backend/synchronization.dart';
import 'package:projet_2cp/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:projet_2cp/constants.dart';
import 'package:projet_2cp/settings.dart';

class PoursuivrePage extends StatefulWidget {
  @override
  State<PoursuivrePage> createState() => _PoursuivrePageState();
}

class _PoursuivrePageState extends State<PoursuivrePage> {
  Color? col = const Color.fromRGBO(232, 69, 96, 1);

  @override
  Widget build(BuildContext context) {
    AudioPlayer player = AudioPlayer();
    AudioPlayer player1 = AudioPlayer();
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      player1.play(
        AssetSource('assets/sounds/stations/map.mp3'),
      );
      player1.setReleaseMode(ReleaseMode.loop);
    }

    @override
    void dispose() {
      player.stop();
      super.dispose();
    }

    Future<void> playAudio() async {
      await player.play(AssetSource('sound.mp3'));
    }

    if (true) {
      backgroundPlayerMap.playMusic();
    }
    playSoundIndication("poursuivre");
    double? wid = (MediaQuery.of(context).size.width);
    double? hei = (MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(158, 231, 251, 1),
      body: Stack(children: [
        Positioned(
          left: wid * (93 / 800),
          top: hei * (40 / 360),
          child: Column(
            children: [
              Start(
                width: (407 / 800) * wid,
                height: (210 / 360) * hei,
                borderColor: const Color.fromRGBO(64, 142, 64, 1),
                contextColor: const Color(0xffffffff),
                text:
                    "Souhaitez-vous reprendre là \noù vous vous êtes arrêté dans\n                    le jeu ?",
                textColor: Colors.black,
              ),
              SizedBox(
                height: hei * (28 / 360),
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * (98 / 800),
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
                        WidgetsFlutterBinding.ensureInitialized();
                        kUser = 'guest';
                        Future<UserProgress> g = getSQFLite('guest');
                        userProgress = await g;
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
                              MediaQuery.of(context).size.width * (10 / 800) -
                                  3),
                        ),
                      ),
                      child: Text(
                        'OUI',
                        style: TextStyle(
                          fontFamily: 'Atma',
                          fontSize:
                              MediaQuery.of(context).size.width * (24 / 800),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: (120 / 800) * wid),
                  Container(
                    width: MediaQuery.of(context).size.width * (98 / 800),
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
                        WidgetsFlutterBinding.ensureInitialized();

                        reInitilseSQFLite("guest");

                        kUser = 'guest';
                        Future<UserProgress> g = getSQFLite('guest');
                        userProgress = await g;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AjouterProfil(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffE84560),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * (10 / 800) -
                                  3),
                        ),
                      ),
                      child: Text(
                        'NON',
                        style: TextStyle(
                          fontFamily: 'Atma',
                          fontSize:
                              MediaQuery.of(context).size.width * (24 / 800),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: hei * (80 / 360),
          right: wid * (78 / 800),
          child: Image.asset(
            "assets/images/avatar/captain_earth_question.png",
            height: (236 / 360) * hei,
            fit: BoxFit.fitWidth,
          ),
        ),
      ]),
    );
  }
}

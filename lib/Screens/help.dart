import 'package:flutter/material.dart';
import 'package:projet_2cp/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:projet_2cp/constants.dart';
import 'package:projet_2cp/settings.dart';

class helpPage extends StatefulWidget {
  int numStation = 0;
  String background;
  helpPage({required this.numStation, required this.background});

  @override
  State<helpPage> createState() => _helpPageState();
}

class _helpPageState extends State<helpPage> {
  List<String> listeIndication = [
    'Appuyez sur les dechets pour\nnettoyer l\'ocean et sauver\nles poissons',
    'Trouvez le mots ',
    'Parmi les trois animaux selectionner celui qui est en voie de disparition afin de sauver le pauvre animal',
    'rien',
    'Pour chaque carte, sélectionnez celle\nqui lui ressemble',
    'Éteignez le feu en\nappuyant dessus pour sauver\nla forêt.',
  ];
  List<String> listeIndicationSound = [
    'Station1',
    'Station2',
    'Station3',
    'Station4',
    'Station5',
    'Station6',
  ];
  @override
  Widget build(BuildContext context) {
    /*AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    player.stop();
    super.dispose();
  }
  Future<void> playAudio() async {
    await player.play(AssetSource('sound.mp3'));
  }
   playSoundHelp(listeIndicationSound[widget.numStation]);*/

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
    playSoundHelp(listeIndicationSound[widget.numStation]);

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.background),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
            Container(
              width: MediaQuery.of(context).size.width * (468 / 800),
              height: MediaQuery.of(context).size.height * (285 / 360),
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * (79 / 800)),
                border: Border.all(
                  color: Color(0xff135617),
                  width: 3,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * (15 / 360),
                  // ),
                  Text(
                    'Aide',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Atma',
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width * (32 / 800),
                      color: Color(0xff134E49),
                    ),
                  ),
                  Text(
                    listeIndication[widget.numStation],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Atma',
                      fontSize: MediaQuery.of(context).size.width * (27 / 800),
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * (15 / 360),
                  // ),
                  // bottom: MediaQuery.of(context).size.height * (18 / 360),
                  Container(
                    width: MediaQuery.of(context).size.width * (82 / 800),
                    height: MediaQuery.of(context).size.height * (49 / 360),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * (10 / 800)),
                      border: Border.all(
                        color: Color(0xff7B2B85),
                        width: 3,
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        backgroundPlayerMap.stopMusic();
                        player1.stop();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffE84560),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * (10 / 800) -
                                  3),
                          //side: BorderSide(color: Color(0xff7B2B85)),
                        ),
                      ),
                      child: Text(
                        'OK',
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
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * (180 / 800),
              child: FractionallySizedBox(
                widthFactor: 1,
                child: Image.asset(
                  'assets/images/avatar/captain_earth_question.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ])),
    );
  }
}

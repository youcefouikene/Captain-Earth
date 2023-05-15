import 'package:flutter/material.dart';
import 'package:projet_2cp/constants.dart';
import 'package:projet_2cp/backend/progress_controllers.dart';
import '../../Screens/EndGamePage.dart';
import 'package:projet_2cp/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:projet_2cp/constants.dart';
import 'package:projet_2cp/settings.dart';

class AnimalSauve extends StatefulWidget {
  Function() next;
  String animal;
  int score;
  GameProgress gameProgress;
  StationProgress stationProgress;
  AnimalSauve(this.stationProgress, this.gameProgress,
      {super.key, required this.animal, required this.next, required this.score});

  @override
  State<AnimalSauve> createState() => _AnimalSauveState();
}

class _AnimalSauveState extends State<AnimalSauve> {
  int _width = 200;

  int Score() {
    if (widget.score > 18) {
      widget.score = 18;
    }
    return ((18 - widget.score) * 2);
  }

  int Stars(int scoreDuJeu) {
    if (scoreDuJeu <= 3) {
      return 3;
    } else if (scoreDuJeu > 3 && scoreDuJeu <= 6) {
      return 2;
    } else if (scoreDuJeu > 6 && scoreDuJeu <= 12) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    
    if (widget.animal.compareTo('assets/images/afrique/elephant.png') == 0) {
      _width = 210;
    } else {
      _width = 190;
    }
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
    playSoundHelp("savingAnimalAudio");

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/afrique/Background_Africa_1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * (630 / 800),
            height: MediaQuery.of(context).size.height * (305 / 360),
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * (79 / 800)),
              border: Border.all(
                color: const Color(0xff135617),
                width: 3,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * (15 / 360),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Merci !',
                        style: TextStyle(
                          fontFamily: 'Atma',
                          height: 1,
                          fontWeight: FontWeight.w700,
                          fontSize:
                              MediaQuery.of(context).size.width * (48 / 800),
                          color: const Color(0xff135617),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (350 / 800),
                      height: MediaQuery.of(context).size.height * (129 / 360),
                      child: Text(
                        'tu m\'as sauvé des mauvais chasseurs , maintenant je peux vivre libre dans la nature',
                        style: TextStyle(
                          fontFamily: 'Atma',
                          height: 43 / 27,
                          fontWeight: FontWeight.w500,
                          fontSize:
                              MediaQuery.of(context).size.width * (27 / 800),
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * (23 / 360),
                    // ),
                    Container(
                      width: MediaQuery.of(context).size.width * (130 / 800),
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
                        onPressed: () {
                           backgroundPlayerMap.stopMusic();
                           player1.stop();
                          if (widget.animal.compareTo(
                                  'assets/images/afrique/lion.png') ==
                              0) {
                            backgroundPlayerAfrique.stopMusic();
                            backgroundPlayerMap.playMusic();
                            dataUpdator(context, widget.stationProgress, widget.gameProgress,
                                Score(), Stars(widget.score - 6));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EndGamePage(
                                    stars: Stars(widget.score - 6),
                                    score: Score(),
                                    background:
                                        'assets/images/afrique/Background_Africa_1.png',
                                    station: 'Station 03',
                                    refreshPath: '/AfriqueMiniJeu',
                                    stationIndex: 2,
                                  ),
                                ));
                          } else {
                            widget.next();
                          }
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
                          'Suivant',
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
                // Image.asset(animal),
                Container(
                  width: MediaQuery.of(context).size.width * (_width / 800),
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: Image.asset(
                      widget.animal,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      //   body: Stack(
      //     children: [
      //       Image.asset(
      //         'assets/images/afrique/Background_Africa_1.png',
      //         width: double.infinity,
      //         height: double.infinity,
      //         fit: BoxFit.cover,
      //       ),
      //       Center(
      //         child: Container(
      //           width: MediaQuery.of(context).size.width * (630 / 800),
      //           height: MediaQuery.of(context).size.height * (305 / 360),
      //           decoration: BoxDecoration(
      //             color: const Color(0xffffffff),
      //             borderRadius: BorderRadius.circular(
      //                 MediaQuery.of(context).size.width * (79 / 800)),
      //             border: Border.all(
      //               color: const Color(0xff135617),
      //               width: 3,
      //             ),
      //           ),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               //SizedBox(width: MediaQuery.of(context).size.width * (66/800),),
      //               Column(
      //                 // mainAxisAlignment: MainAxisAlignment,
      //                 children: [
      //                   // SizedBox(
      //                   //   height: MediaQuery.of(context).size.height * (15 / 360),
      //                   // ),
      //                   Text(
      //                     'Merci !',
      //                     style: TextStyle(
      //                       fontFamily: 'Atma',
      //                       height: 30 / 48,
      //                       fontWeight: FontWeight.w700,
      //                       fontSize:
      //                           MediaQuery.of(context).size.width * (48 / 800),
      //                       color: const Color(0xff135617),
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     width: MediaQuery.of(context).size.width * (341 / 800),
      //                     child: Text(
      //                       'tu m\'as sauvé des mauvais chasseurs , maintenant je peux vivre libre dans la nature',
      //                       style: TextStyle(
      //                         fontFamily: 'Atma',
      //                         height: 43 / 27,
      //                         fontWeight: FontWeight.w500,
      //                         fontSize:
      //                             MediaQuery.of(context).size.width * (27 / 800),
      //                         color: const Color(0xff000000),
      //                       ),
      //                     ),
      //                   ),
      //                   // SizedBox(
      //                   //   height: MediaQuery.of(context).size.height * (23 / 360),
      //                   // ),
      //                   Container(
      //                     width: MediaQuery.of(context).size.width * (130 / 800),
      //                     height: MediaQuery.of(context).size.height * (39 / 360),
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(
      //                           MediaQuery.of(context).size.width * (10 / 800)),
      //                       border: Border.all(
      //                         color: const Color(0xff7B2B85),
      //                         width: 3,
      //                       ),
      //                     ),
      //                     child: ElevatedButton(
      //                       onPressed: () {
      //                         if (animal.compareTo(
      //                                 'assets/images/afrique/lion.png') ==
      //                             0) {
      //                           dataUpdator(context, stationProgress, gameProgress, Score(), Stars(score - 6));
      //                           Navigator.pushReplacement(
      //                               context,
      //                               MaterialPageRoute(
      //                                 builder: (context) => EndGamePage(
      //                                   stars: Stars(score - 6),
      //                                   score: userProgress.leaves,
      //                                   background:
      //                                       'assets/images/afrique/Background_Africa_1.png',
      //                                   station: 'Station 03',
      //                                   refreshPath: '/AfriqueMiniJeu',
      //                                   stationIndex: 2,
      //                                 ),
      //                               ));
      //                         } else {
      //                           next();
      //                         }
      //                       },
      //                       style: ElevatedButton.styleFrom(
      //                         backgroundColor: const Color(0xffE84560),
      //                         shape: RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.circular(
      //                               MediaQuery.of(context).size.width *
      //                                       (10 / 800) -
      //                                   3),
      //                           //side: BorderSide(color: Color(0xff7B2B85)),
      //                         ),
      //                       ),
      //                       child: Text(
      //                         'Suivant',
      //                         style: TextStyle(
      //                           fontFamily: 'Atma',
      //                           fontSize: MediaQuery.of(context).size.width *
      //                               (24 / 800),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               // Image.asset(animal),
      //               Container(
      //                 width: MediaQuery.of(context).size.width * (_width / 800),
      //                 child: FractionallySizedBox(
      //                   widthFactor: 1,
      //                   child: Image.asset(
      //                     animal,
      //                     fit: BoxFit.fitWidth,
      //                   ),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
    );
  }
}

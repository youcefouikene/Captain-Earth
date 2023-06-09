import 'package:flutter/material.dart';
import '../Screens/ChooseGamePage.dart';
import 'package:projet_2cp/constants.dart';
import 'package:audioplayers/audioplayers.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    Map routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String Station = routeArgs['numStation'];
    int numStation = int.parse(Station);
    String pathJeu = routeArgs['pathJeu'];
    String pathQuiz = routeArgs['pathQuiz'];

    List<String> listeIndicationBienVenues = [
      'bienvenue-station-1',
      'bienvenue-station-2',
      'bienvenue-station-3',
      'bienvenue-station-4',
      'bienvenue-station-5',
      'bienvenue-station-6',
    ];

    List<String> listeIndicationAllonsY = [
      'allons-y-station-1',
      'allons-y-station-2',
      'allons-y-station-3',
      'allons-y-station-4',
      'allons-y-station-5',
      'allons-y-station-6',
    ];
    int cpt = 0;

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
      player2.stop();
      super.dispose();
    }

    Future<void> playAudio() async {
      await player2.play(AssetSource('sound.mp3'));
    }

    if (true) {
      backgroundPlayerMap.playMusic();
    }
    if (listeGlobale[numStation][index] != 'Allons-y !') {
      playSoundIndication(listeIndicationBienVenues[numStation]);
    }

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(listeGlobale[numStation][4]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 2 / 3,
                child: Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * (477 / 800),
                        height:
                            MediaQuery.of(context).size.height * (298 / 360),
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * (97 / 800)),
                          border: Border.all(
                            color: const Color(0xff135617),
                            width: 3,
                          ),
                        ),
                        child: Center(
                            child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  (33 / 360),
                            ),
                            if (listeGlobale[numStation][index] == 'Allons-y !')
                              Text(
                                'Allons-y !',
                                style: TextStyle(
                                  height: 30 / 32,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Atma',
                                  fontSize: MediaQuery.of(context).size.width *
                                      (28 / 800),
                                  color: const Color(0xff134E49),
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            else
                              Text(
                                listeGlobale[numStation][index],
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Atma',
                                  height: 30 / 26,
                                  fontSize: MediaQuery.of(context).size.width *
                                      (26 / 800),
                                  color: const Color(0xff134E49),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  (int.parse(
                                          listeGlobale[numStation][index + 2]) /
                                      360),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  (int.parse(
                                          listeGlobale[numStation][index + 3]) /
                                      800),
                              child: Text(
                                listeGlobale[numStation][index + 1],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  height: 38 / 26,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Atma',
                                  fontSize: MediaQuery.of(context).size.width *
                                      (26 / 800),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                      Positioned(
                        bottom:
                            -MediaQuery.of(context).size.height * (16 / 360),
                        child: Container(
                          width:
                              MediaQuery.of(context).size.width * (130 / 800),
                          height:
                              MediaQuery.of(context).size.height * (39 / 360),
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
                              cpt++;
                              backgroundPlayerMap.stopMusic();
                              player1.stop();
                              if (numStation % 2 != 0) {
                                player2.dispose();
                              }
                              if (cpt == 1)
                                playSoundIndication(
                                    listeIndicationAllonsY[numStation]);
                              setState(() {
                                if (index == 0) {
                                  index = index + 5;
                                } else {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChooseGamePage(
                                              pathBackGround:
                                                  listeGlobale[numStation][4],
                                              stationIndex: numStation,
                                              pathJeu: pathJeu,
                                              pathQuiz: pathQuiz)));
                                }
                              });
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
                              'Suivant',
                              style: TextStyle(
                                fontFamily: 'Atma',
                                fontSize: MediaQuery.of(context).size.width *
                                    (24 / 800),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * (176 / 800),
                child: Image.asset(
                  'assets/images/avatar/captain_earth.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ])),
      ],
    );
  }
}






// import 'package:flutter/material.dart';
// import '../Screens/ChooseGamePage.dart';
// import 'package:projet_2cp/constants.dart';
// import 'package:audioplayers/audioplayers.dart';

// class WelcomePage extends StatefulWidget {
//   @override
//   State<WelcomePage> createState() => _WelcomePageState();
// }

// class _WelcomePageState extends State<WelcomePage> {
//   int index = 0;
//   bool isAllonsyPlaying=false;

//   @override
//   Widget build(BuildContext context) {
//     Map routeArgs =
//         ModalRoute.of(context)!.settings.arguments as Map<String, String>;
//     String Station = routeArgs['numStation'];
//     int numStation = int.parse(Station);
//     String pathJeu = routeArgs['pathJeu'];
//     String pathQuiz = routeArgs['pathQuiz'];

//     List<String> listeIndicationBienVenues = [
//       'bienvenue-station-1',
//       'bienvenue-station-2',
//       'bienvenue-station-3',
//       'bienvenue-station-4',
//       'bienvenue-station-5',
//       'bienvenue-station-6',
//     ];

//     List<String> listeIndicationAllonsY = [
//       'allons-y-station-1',
//       'allons-y-station-2',
//       'allons-y-station-3',
//       'allons-y-station-4',
//       'allons-y-station-5',
//       'allons-y-station-6',
//     ];
//     //AudioPlayer playerAllonsY= AudioPlayer();
//     final allonsYSound =AllonsyPlayer("indications/${listeIndicationAllonsY[numStation]}.mp3");

//     @override
//     void initState() {
//       // TODO: implement initState
//       super.initState();
//       player1.play(
//         AssetSource('assets/sounds/stations/map.mp3'),
//       );
//       player1.setReleaseMode(ReleaseMode.loop);
//     }

//     @override
//     void dispose() {
//       player2.stop();
//       super.dispose();
//     }

//     Future<void> playAudio() async {
//       await player2.play(AssetSource('sound.mp3'));
//     }

//     if (true) {
//       backgroundPlayerMap.playMusic();
//     }
//     if (listeGlobale[numStation][index] != 'Allons-y !') {
//       playSoundIndication(listeIndicationBienVenues[numStation]);
//     }

//     return Stack(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(listeGlobale[numStation][4]),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Center(
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 2 / 3,
//                 child: Stack(
//                     alignment: Alignment.bottomCenter,
//                     clipBehavior: Clip.none,
//                     children: [
//                       Container(
//                         width: MediaQuery.of(context).size.width * (477 / 800),
//                         height:
//                             MediaQuery.of(context).size.height * (298 / 360),
//                         decoration: BoxDecoration(
//                           color: const Color(0xffffffff),
//                           borderRadius: BorderRadius.circular(
//                               MediaQuery.of(context).size.width * (97 / 800)),
//                           border: Border.all(
//                             color: const Color(0xff135617),
//                             width: 3,
//                           ),
//                         ),
//                         child: Center(
//                             child: Column(
//                           children: [
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height *
//                                   (33 / 360),
//                             ),
//                             if (listeGlobale[numStation][index] == 'Allons-y !')
//                               Text(
//                                 'Allons-y !',
//                                 style: TextStyle(
//                                   height: 30 / 32,
//                                   decoration: TextDecoration.none,
//                                   fontFamily: 'Atma',
//                                   fontSize: MediaQuery.of(context).size.width *
//                                       (28 / 800),
//                                   color: const Color(0xff134E49),
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               )
//                             else
//                               Text(
//                                 listeGlobale[numStation][index],
//                                 style: TextStyle(
//                                   decoration: TextDecoration.none,
//                                   fontFamily: 'Atma',
//                                   height: 30 / 26,
//                                   fontSize: MediaQuery.of(context).size.width *
//                                       (26 / 800),
//                                   color: const Color(0xff134E49),
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height *
//                                   (int.parse(
//                                           listeGlobale[numStation][index + 2]) /
//                                       360),
//                             ),
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width *
//                                   (int.parse(
//                                           listeGlobale[numStation][index + 3]) /
//                                       800),
//                               child: Text(
//                                 listeGlobale[numStation][index + 1],
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   height: 38 / 26,
//                                   decoration: TextDecoration.none,
//                                   fontFamily: 'Atma',
//                                   fontSize: MediaQuery.of(context).size.width *
//                                       (26 / 800),
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )),
//                       ),
//                       Positioned(
//                         bottom:
//                             -MediaQuery.of(context).size.height * (16 / 360),
//                         child: Container(
//                           width:
//                               MediaQuery.of(context).size.width * (130 / 800),
//                           height:
//                               MediaQuery.of(context).size.height * (39 / 360),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                                 MediaQuery.of(context).size.width * (10 / 800)),
//                             border: Border.all(
//                               color: const Color(0xff7B2B85),
//                               width: 3,
//                             ),
//                           ),
//                           child: ElevatedButton(
//                             onPressed: () {
//                               backgroundPlayerMap.stopMusic();
//                               player1.stop();
                            
                            
                              
//                               if (numStation % 2 != 0) {
//                                 player2.dispose();
//                               }
        
//                               setState(() {

//                                 if(isAllonsyPlaying==false){
//                                 isAllonsyPlaying=true;
//                                 allonsYSound.playMusic();
//                                //  allonsYSound.isPlaying=true;
                      
//                               }else{
//                                 allonsYSound.stopMusic();
//                               }
                              
                
//                                 if (index == 0) {
//                                   index = index + 5;
//                                 } else {
//                                   Navigator.pushReplacement(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => ChooseGamePage(
//                                               pathBackGround:
//                                                   listeGlobale[numStation][4],
//                                               stationIndex: numStation,
//                                               pathJeu: pathJeu,
//                                               pathQuiz: pathQuiz)));
//                                 }
//                               });
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xffE84560),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(
//                                     MediaQuery.of(context).size.width *
//                                             (10 / 800) -
//                                         3),
//                               ),
//                             ),
//                             child: Text(
//                               'Suivant',
//                               style: TextStyle(
//                                 fontFamily: 'Atma',
//                                 fontSize: MediaQuery.of(context).size.width *
//                                     (24 / 800),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ]),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * (176 / 800),
//                 child: Image.asset(
//                   'assets/images/avatar/captain_earth.png',
//                   fit: BoxFit.fitWidth,
//                 ),
//               ),
//             ])),
//       ],
//     );
//   }
// }

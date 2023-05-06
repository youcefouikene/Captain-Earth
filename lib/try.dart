import 'package:flutter/material.dart';
import '../Screens/Profil/Profil.dart';
import 'package:projet_2cp/data/data.dart';
import 'package:projet_2cp/progress/progress.dart';
import 'package:projet_2cp/Widgets/stations/locked_station/locked_station.dart';
import 'package:projet_2cp/Widgets/stations/unlocked_stations/unlock_station_1.dart';
import 'package:projet_2cp/Widgets/stations/unlocked_stations/unlock_station_2.dart';
import 'package:projet_2cp/Widgets/stations/unlocked_stations/unlock_station_3.dart';
import 'package:projet_2cp/Widgets/stations/unlocked_stations/unlock_station_4.dart';
import 'package:projet_2cp/Widgets/stations/unlocked_stations/unlock_station_5.dart';
import 'package:projet_2cp/Widgets/stations/unlocked_stations/unlock_station_6.dart';
import 'package:projet_2cp/Widgets/PointBar.dart';

class tryi extends StatefulWidget {
  tryi({Key? key}) : super(key: key);

  @override
  State<tryi> createState() => _tryiState();
}

class _tryiState extends State<tryi> {
  // Loading stations Cards
  void loadStations() async {
    //! Online & Local
    WidgetsFlutterBinding.ensureInitialized();
    setState(() {
      gameData = [
        StationCard(
          stationProgress: userProgress.stations[0],
          games: [],
        ),
        StationCard(
          stationProgress: userProgress.stations[1],
          games: [],
        ),
        StationCard(
          stationProgress: userProgress.stations[2],
          games: [],
        ),
        StationCard(
          stationProgress: userProgress.stations[3],
          games: [],
        ),
        StationCard(
          stationProgress: userProgress.stations[4],
          games: [],
        ),
        StationCard(
          stationProgress: userProgress.stations[5],
          games: [],
        ),
      ];
    });
  }


  IconData  _icone = Icons.music_note;
  Color col= const Color.fromRGBO(232,69,96,1);

  @override
  void initState() {
    super.initState();
    loadStations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
            fit: StackFit.expand,
            children: [
              // importing the background image
              Image.asset('assets/images/map-image.png', fit: BoxFit.cover,),
              // using the buttons
              Positioned(
                top: MediaQuery.of(context).size.height * (18 / 360),
                left: MediaQuery.of(context).size.width * (14 / 360),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width *
                              (40 / 800),
                          height: MediaQuery.of(context).size.width *
                              (40 / 800),
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
                            setState(() {
                              if (_icone == Icons.music_note) {
                                _icone = Icons.music_off;
                              } else {
                                _icone = Icons.music_note;
                              }
                            });
                          },
                          icon: Icon(_icone),
                          iconSize: MediaQuery.of(context).size.width *
                              (25 / 800),
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
                          //margin: EdgeInsets.only(bottom: 12.0),
                          width: MediaQuery.of(context).size.width *
                              (40 / 800),
                          height: MediaQuery.of(context).size.width *
                              (40 / 800),
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
                            builder: (context) => Profil(
                                username: userProgress.playerName, pathPhoto: "assets/images/player_avatars/avatar${userProgress.avatar + 1}.png")));
                          },
                          icon: const Icon(Icons.person),
                          iconSize: MediaQuery.of(context).size.width * (30 / 800),
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Positioned(
                right: (21/800) * MediaQuery.of(context).size.width,
                top: (20/360) * MediaQuery.of(context).size.height,
                child: PointBar(score: userProgress.leaves),
              ),
              Positioned(
                right: (3/360) * MediaQuery.of(context).size.width,
                bottom: (23.54/360) * MediaQuery.of(context).size.height,
                child: Container(
                  width: (110/800) * MediaQuery.of(context).size.width,
                  height: (190/360) * MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/avatar/captain_earth_standing.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom:0.214 * MediaQuery.of(context).size.height,
                right: 0.23 * MediaQuery.of(context).size.width,
                child: StationCart(station: gameData[0], isOpened: 0 <= userProgress.currentStation, widthPercentage: 0.039),
              ),
              Positioned(
                top:0.227 * MediaQuery.of(context).size.height,
                right: 0.339 * MediaQuery.of(context).size.width,
                child: StationCart(station: gameData[1], isOpened: 1 <= userProgress.currentStation, widthPercentage: 0.039),
              ),
              Positioned(
                top:0.4 * MediaQuery.of(context).size.height,
                right: 0.481 * MediaQuery.of(context).size.width,
                child: StationCart(station: gameData[2], isOpened: true, widthPercentage: 0.039), // 2 <= userProgress.currentStation
              ),
              Positioned(
                top:0.195 * MediaQuery.of(context).size.height,
                right: 0.505 * MediaQuery.of(context).size.width,
                child: StationCart(station: gameData[3], isOpened: 3 <= userProgress.currentStation, widthPercentage: 0.039),
              ),
              Positioned(
                top:0.228 * MediaQuery.of(context).size.height,
                left: 0.21 * MediaQuery.of(context).size.width,
                child: StationCart(station: gameData[4], isOpened: 4 <= userProgress.currentStation, widthPercentage: 0.039),
              ),
              Positioned(
                bottom:0.30 * MediaQuery.of(context).size.height,
                left: 0.295 * MediaQuery.of(context).size.width,
                child: StationCart(station: gameData[5], isOpened: 5 <= userProgress.currentStation, widthPercentage: 0.039),
              ),
            ]
        ),
      ),
    );
  }
}


class StationCart extends StatefulWidget {
  final StationCard station;
  final bool isOpened;
  final double widthPercentage;

  const StationCart({
    super.key,
    required this.station,
    required this.isOpened,
    required this.widthPercentage,
  });

  @override
  State<StationCart> createState() => _StationCartState();
}

class _StationCartState extends State<StationCart> {
  @override
  Widget build(BuildContext context) {
    if(widget.isOpened){
      if (widget.station.stationProgress.stationIndex == 0) {
        return InkWell(
            onTap: () async {
              Navigator.of(context)
                  .pushNamed('/WelcomeStation', arguments: {
                'numStation': '0',
                'pathJeu': '/OceanieMiniJeu',
                'pathQuiz': '/QuizOceanie',
              });
            },
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width * widget.widthPercentage, (MediaQuery.of(context).size.width * widget.widthPercentage *1.0714285714285714).toDouble()),
              painter: UnlockedFirstStation(nbrStarsObtained: widget.station.stationProgress.stars ~/ 2),
            )
        );
      }else if(widget.station.stationProgress.stationIndex == 1) {
        return InkWell(
            onTap: () async {
              Navigator.of(context)
                  .pushNamed('/WelcomeStation', arguments: {
                'numStation': '1',
                'pathJeu': '/AsieMiniJeu',
                'pathQuiz': '/QuizAsie',
              });
            },
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width * widget.widthPercentage, (MediaQuery.of(context).size.width * widget.widthPercentage*1.0714285714285714).toDouble()),
              painter: UnlockedSecondStation(nbrStarsObtained: widget.station.stationProgress.stars ~/ 2),
            )
        );
      }else if (widget.station.stationProgress.stationIndex == 2) {
        return InkWell(
            onTap: () async {
              Navigator.of(context)
                .pushNamed('/WelcomeStation', arguments: {
                'numStation': '2',
                'pathJeu': '/AfriqueMiniJeu',
                'pathQuiz': '/QuizAfrique',
              });
            },
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width * widget.widthPercentage, (MediaQuery.of(context).size.width * widget.widthPercentage *1.0714285714285714).toDouble()),
              painter: UnlockedThirdStation(nbrStarsObtained: widget.station.stationProgress.stars ~/ 2),
            )
        );
      }else if (widget.station.stationProgress.stationIndex == 3) {
        return InkWell(
            onTap: () async {
              Navigator.of(context)
                  .pushNamed('/WelcomeStation', arguments: {
                'numStation': '3',
                'pathJeu': '/EuropeMiniJeu',
                'pathQuiz': '/QuizEurope',
              });
            },
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width * widget.widthPercentage, (MediaQuery.of(context).size.width * widget.widthPercentage *1.0714285714285714).toDouble()),
              painter: UnlockedFourthStation(nbrStarsObtained: widget.station.stationProgress.stars ~/ 2),
            )
        );
      }else if (widget.station.stationProgress.stationIndex == 4) {
        return InkWell(
            onTap: () async {
              Navigator.of(context)
                  .pushNamed('/WelcomeStation', arguments: {
                'numStation': '4',
                'pathJeu': '/AmeriqueNordMiniJeu',
                'pathQuiz': '/QuizAmeriqueNord',
              });
            },
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width * widget.widthPercentage, (MediaQuery.of(context).size.width * widget.widthPercentage *1.0714285714285714).toDouble()),
              painter: UnlockedFifthStation(nbrStarsObtained: widget.station.stationProgress.stars ~/ 2),
            )
        );
      }else{
        return InkWell(
            onTap: () async {
              Navigator.of(context)
                  .pushNamed('/WelcomeStation', arguments: {
                'numStation': '5',
                'pathJeu': '/AmeriqueSudMiniJeu',
                'pathQuiz': '/QuizAmeriqueSud',
              });
            },
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width * widget.widthPercentage, (MediaQuery.of(context).size.width * widget.widthPercentage *1.0714285714285714).toDouble()),
              painter: UnlockedSixthStation(nbrStarsObtained: widget.station.stationProgress.stars ~/ 2),
            )
        );
      }
    } else {
      return InkWell(
          onTap: () {
          },
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width * widget.widthPercentage, (MediaQuery.of(context).size.width * widget.widthPercentage *1.0714285714285714).toDouble()),
            painter: LockedContinent(),
          )
      );
    }
  }
}
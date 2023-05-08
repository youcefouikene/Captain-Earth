import 'package:flutter/material.dart';
import '../Widgets/BoxInfo.dart';
import '../Widgets/RectangleButton.dart';
import '../Widgets/CustomContainer.dart';
import 'package:projet_2cp/progress/progress.dart';
import 'package:projet_2cp/constants.dart';

class AcquisitionPage extends StatefulWidget {
  const AcquisitionPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AcquisitionPage> createState() => _AcquisitionPageState();
}

class _AcquisitionPageState extends State<AcquisitionPage> {
  IconData _icone = Icons.music_note; //attribut de la classe

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double het = MediaQuery.of(context).size.height;
    const double widthBloc = 243.0;
    int acquisitionTotale = userProgress.leaves;
    print(userProgress.stations[1].leaves);
    return Scaffold(
        backgroundColor: const Color.fromRGBO(158, 231, 251, 1),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: het * 25 / 360,
                ),
                child: Text(
                  "Acquisition",
                  style: TextStyle(
                    color: const Color(0xff135617),
                    fontFamily: "Atma",
                    fontSize: wid * 38 / 800,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            Positioned(
              top: het * 118 / 360,
              left: wid * 108 / 800,
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: wid * 243 / 800,
                        height: het * 41 / 360,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(244, 244, 244, 1),
                          borderRadius: BorderRadius.circular(wid * 14 / 800),
                          border: Border.all(
                            color: const Color.fromRGBO(19, 78, 73, 1),
                            width: wid * 1 / 800,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: wid *
                                  (userProgress.stations[0].leaves *
                                      widthBloc /
                                      maxLeavesOceanieStation) /
                                  800,
                              height: het * 41 / 360,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(104, 216, 104, 1),
                                borderRadius:
                                    BorderRadius.circular(wid * 14 / 800),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Pollution de l'eau",
                                style: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: "Atma",
                                  fontSize: wid * 22 / 800,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: het * 19 / 360,
                      ),
                      Container(
                        width: wid * 243 / 800,
                        height: het * 41 / 360,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(244, 244, 244, 1),
                          borderRadius: BorderRadius.circular(wid * 14 / 800),
                          border: Border.all(
                            color: const Color.fromRGBO(19, 78, 73, 1),
                            width: wid * 1 / 800,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: (wid) *
                                  (userProgress.stations[1].leaves *
                                      widthBloc /
                                      maxLeavesAsieStation) /
                                  800,
                              height: het * 41 / 360,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(104, 216, 104, 1),
                                borderRadius:
                                    BorderRadius.circular(wid * 14 / 800),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Pollution de l'air",
                                style: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: "Atma",
                                  fontSize: wid * 22 / 800,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: het * 19 / 360,
                      ),
                      Container(
                        width: wid * 243 / 800,
                        height: het * 41 / 360,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(244, 244, 244, 1),
                          borderRadius: BorderRadius.circular(wid * 14 / 800),
                          border: Border.all(
                            color: const Color.fromRGBO(19, 78, 73, 1),
                            width: wid * 1 / 800,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: wid *
                                  (userProgress.stations[2].leaves *
                                      widthBloc /
                                      maxLeavesAfriqueStation) /
                                  800,
                              height: het * 41 / 360,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(104, 216, 104, 1),
                                borderRadius:
                                    BorderRadius.circular(wid * 14 / 800),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Animaux en danger",
                                style: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: "Atma",
                                  fontSize: wid * 22 / 800,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: wid * 99 / 800,
                  ),
                  Column(
                    children: [
                      Container(
                        width: wid * 243 / 800,
                        height: het * 41 / 360,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(244, 244, 244, 1),
                          borderRadius: BorderRadius.circular(wid * 14 / 800),
                          border: Border.all(
                            color: const Color.fromRGBO(19, 78, 73, 1),
                            width: wid * 1 / 800,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: wid *
                                  (userProgress.stations[3].leaves *
                                      widthBloc /
                                      maxLeavesEuropeStation) /
                                  800, //il change suivant un pourcentage de points
                              height: het * 41 / 360,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(104, 216, 104, 1),
                                borderRadius:
                                    BorderRadius.circular(wid * 14 / 800),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Recyclage",
                                style: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: "Atma",
                                  fontSize: wid * 22 / 800,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: het * 19 / 360,
                      ),
                      Container(
                        width: wid * 243 / 800,
                        height: het * 41 / 360,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(244, 244, 244, 1),
                          borderRadius: BorderRadius.circular(wid * 14 / 800),
                          border: Border.all(
                            color: const Color.fromRGBO(19, 78, 73, 1),
                            width: wid * 1 / 800,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: wid *
                                  (userProgress.stations[4].leaves *
                                      widthBloc /
                                      maxLeavesAmeriqueNordStation) /
                                  800, //il change suivant un pourcentage de points
                              height: het * 41 / 360,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(104, 216, 104, 1),
                                borderRadius:
                                    BorderRadius.circular(wid * 14 / 800),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Energies renouvlables",
                                style: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: "Atma",
                                  fontSize: wid * 22 / 800,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: het * 19 / 360,
                      ),
                      Container(
                        width: wid * 243 / 800,
                        height: het * 41 / 360,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(244, 244, 244, 1),
                          borderRadius: BorderRadius.circular(wid * 14 / 800),
                          border: Border.all(
                            color: const Color.fromRGBO(19, 78, 73, 1),
                            width: wid * 1 / 800,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: (wid) *
                                  (userProgress.stations[5].leaves *
                                      widthBloc /
                                      maxLeavesAmeriqueSudStation) /
                                  800, //il change suivant un pourcentage de points
                              height: het * 41 / 360,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(104, 216, 104, 1),
                                borderRadius:
                                    BorderRadius.circular(wid * 14 / 800),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Déforestation",
                                style: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: "Atma",
                                  fontSize: wid * 22 / 800,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Positioned(
              left: wid * 108 / 800,
              top: het * 317 / 360,
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: wid * 584 / 800,
                        height: het * 11 / 360,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(238, 236, 235, 1),
                          borderRadius: BorderRadius.circular(wid * 28 / 800),
                        ),
                      ),
                      Container(
                        width: wid *
                            (acquisitionTotale * 584 / maxLeavesTotal) /
                            800, //il change suivant un pourcentage de points
                        height: het * 7 / 360,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(232, 69, 96, 1),
                          borderRadius: BorderRadius.circular(wid * 28 / 800),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: wid * 14 / 800,
                  ),
                  Positioned(
                    top: het * 305 / 360,
                    left: wid * 706 / 800,
                    child: Text(
                      "100%",
                      style: TextStyle(
                        color: const Color.fromRGBO(19, 78, 73, 1),
                        fontFamily: "Atma",
                        fontSize: wid * 18 / 800,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: wid * 705 / 800,
              top: het * 34 / 360,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 50 / 800,
                    height: MediaQuery.of(context).size.width * 50 / 800,
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
                    onPressed: () {},
                    //icon:const Icon(MyFlutterApp.vector),
                    icon: const Icon(Icons.emoji_events),
                    iconSize: MediaQuery.of(context).size.width * 29 / 800,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ],
              ),
            ),
            //NOUVEAU MODEL
            //----------------------------------------------
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
                          setState(() {
                            if (_icone == Icons.music_note) {
                              _icone = Icons.music_off;
                            } else {
                              _icone = Icons.music_note;
                            }
                          });
                        },
                        icon: Icon(_icone),
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

            //-------------------------------------------------------------
          ],
        ));
  }
}

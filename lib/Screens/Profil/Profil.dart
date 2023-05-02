import 'package:flutter/material.dart';
import '../../Widgets/BoxInfo.dart';
import '../../Widgets/RectangleButton.dart';
import '../Classement.dart';
import '../AcquisitionPage.dart';
//import '../Widgets/DefiContainer.dart';
import '../DefiPage.dart';

class Profil extends StatefulWidget {
  String? username;
  String? pathPhoto;
  int? score = 0;
  int ptOcianie = 0;
  int ptAsie = 0;
  int ptAfrique = 0;
  int ptEurope = 0;
  int ptAmeriqueNord = 0;
  int ptAmeriqueSud = 0;
  //constructeur
  Profil({
    required this.username,
    required this.pathPhoto,
    this.score,
    Key? key,
  }) : super(key: key);

  String getUserName() {
    return username ?? '';
  }

  String getPathPhoto() {
    return pathPhoto ?? '';
  }

  int getScore() {
    return score ?? 0;
  }

  void addPtOcianie(int pt) {
    ptOcianie = ptOcianie + pt;
  }

  void addPtAsie(int pt) {
    ptAsie = ptAsie + pt;
  }

  void addPtAfrique(int pt) {
    ptAfrique = ptAfrique + pt;
  }

  void addPtEurope(int pt) {
    ptEurope = ptEurope + pt;
  }

  void addPtAmeriqueN(int pt) {
    ptAmeriqueNord = ptAmeriqueNord + pt;
  }

  void addPtAmeriqueS(int pt) {
    ptAmeriqueSud = ptAmeriqueSud + pt;
  }

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  IconData _icone = Icons.music_note;
  Color? col = const Color.fromRGBO(232, 69, 96, 1); //attribut de la classe

  void incrementScore(int add) {
    setState(() {
      widget.score = widget.score! + add;
    });
  }

  //decrement score
  void decrementScore(int sub) {
    setState(() {
      widget.score = widget.score! - sub;
    });
  }

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double het = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: const Color.fromRGBO(158, 231, 251, 1),
        body: Stack(
          children: [
            Positioned(
                left: wid * (47 / 800),
                top: het * (28 / 360),
                child: Container(
                  width: wid * (706 / 800),
                  height: het * ((301 * 2 + 60) / 800),
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(wid * (42 / 800)),
                    border: Border.all(
                      color: const Color(0xff134E49),
                      width: 3,
                    ),
                  ),
                )),
            Positioned(
              top: MediaQuery.of(context).size.height * (50 / 360),
              left: MediaQuery.of(context).size.width * (70 / 800),
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
                          color: Color(0xFFE84560),
                          border: Border.all(
                            color: Color(0xff752683),
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
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * (5 / 360),
                  ),
                  Container(
                      child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        //margin: EdgeInsets.only(bottom: 12.0),
                        width: MediaQuery.of(context).size.width * (40 / 800),
                        height: MediaQuery.of(context).size.width * (40 / 800),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE84560),
                          border: Border.all(
                            color: Color(0xff752683),
                            width: 2,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.map_outlined),
                        iconSize:
                            MediaQuery.of(context).size.width * (24 / 800),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            // Positioned(
            // left: wid * (343 / 800),
            // top: het * (45 / 360),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: het * (45 / 360)),
                child: Text(
                  "Profil",
                  style: TextStyle(
                    color: const Color(0xff134E49),
                    fontFamily: 'Atma',
                    fontSize: wid * (29 / 800),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // )
            ),
            Positioned(
              right: wid * (70 / 800),
              top: het * (50 / 360),
              child: Stack(alignment: Alignment.center, children: [
                Container(
                  width: MediaQuery.of(context).size.width * 40 / 800,
                  height: MediaQuery.of(context).size.width * 40 / 800,
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
                  icon: const Icon(Icons.close_rounded),
                  iconSize: MediaQuery.of(context).size.width * 30 / 800,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ]),
            ),
            Positioned(
                left: wid * (136 / 800),
                top: het * (72 / 360),
                child: Column(
                  children: [
                    Positioned(
                      child: Container(
                        width: wid * (89 / 800),
                        height: wid * (89 / 800),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: (2 / 800) * wid,
                            color: const Color(0xff135617),
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(widget.getPathPhoto()),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: het * (20 / 360),
                    ),
                    Positioned(
                      child: BoxInfo(
                          bordercolor: const Color(0xffF4F4F4),
                          contentcolor: const Color(0xffF4F4F4),
                          element: Row(
                            children: [
                              SizedBox(
                                width: wid * (12 / 800),
                              ),
                              Icon(
                                Icons.person_outline,
                                color: const Color(0xff135617),
                                size: wid * (25 / 800),
                              ),
                              SizedBox(
                                width: wid * (13 / 800),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Nom: ",
                                    style: TextStyle(
                                      fontFamily: 'Atma',
                                      fontSize: wid * (18 / 800),
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff135617),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: wid * (34 / 800),
                                  // ),
                                  Text(
                                    widget.getUserName(),
                                    style: TextStyle(
                                      fontFamily: 'Atma',
                                      fontSize: wid * (18 / 800),
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: het * (15 / 360),
                    ),
                    Positioned(
                      child: BoxInfo(
                          bordercolor: const Color(0xffF4F4F4),
                          contentcolor: const Color(0xffF4F4F4),
                          element: Row(
                            children: [
                              SizedBox(
                                width: wid * (13 / 800),
                              ),
                              const Image(
                                image: AssetImage('assets/images/leaf.png'),
                              ),
                              SizedBox(
                                width: wid * (13 / 800),
                              ),
                              Text(
                                "Score: ",
                                style: TextStyle(
                                  fontFamily: 'Atma',
                                  fontSize: wid * (18 / 800),
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff135617),
                                ),
                              ),
                              SizedBox(
                                width: wid * (34 / 800),
                              ),
                              Text(
                                (widget.getScore())
                                    .toString(), //apres une variable
                                style: TextStyle(
                                  fontFamily: 'Atma',
                                  fontSize: wid * (18 / 800),
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                )),
            Positioned(
                left: wid * (504 / 800),
                top: het * (113 / 360),
                child: Column(
                  children: [
                    Positioned(
                      child: BoxInfo(
                        bordercolor: const Color(0xff134E49),
                        contentcolor: Colors.white,
                        element: Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) {
                                    return AcquisitionPage(
                                        ptOcianie: widget.ptOcianie,
                                        ptAsie: widget.ptAsie,
                                        ptAfrique: widget.ptAfrique,
                                        ptEurope: widget.ptEurope,
                                        ptAmeriqueNord: widget.ptAmeriqueNord,
                                        ptAmeriqueSud: widget.ptAmeriqueSud);
                                  },
                                ),
                              );
                            },
                            child: Text(
                              " Acquesition",
                              style: TextStyle(
                                fontFamily: 'Atma',
                                fontSize: wid * (24 / 800),
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: het * (26 / 360),
                    ),
                    Positioned(
                      child: BoxInfo(
                          bordercolor: const Color(0xff134E49),
                          contentcolor: Colors.white,
                          element: Center(
                              child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) {
                                    return Defi();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              " Défi",
                              style: TextStyle(
                                fontFamily: 'Atma',
                                fontSize: wid * (24 / 800),
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ))),
                    ),
                    SizedBox(
                      height: het * (26 / 360),
                    ),
                    Positioned(
                      child: BoxInfo(
                          bordercolor: Color(0xff134E49),
                          contentcolor: Colors.white,
                          element: Center(
                              child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) {
                                    return Classement();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              " Classement",
                              style: TextStyle(
                                fontFamily: 'Atma',
                                fontSize: wid * (24 / 800),
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ))),
                    ),
                  ],
                )),
            Positioned(
              left: wid * (312 / 800),
              top: het * (304 / 360),
              child: Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * (17 / 360)),
                width: MediaQuery.of(context).size.width * (175 / 800),
                height: MediaQuery.of(context).size.height * (39 / 360),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * (10 / 800)),
                  border: Border.all(
                    color: Color(0xff7B2B85),
                    width: 3,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffE84560),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * (10 / 800) - 3),
                      //side: BorderSide(color: Color(0xff7B2B85)),
                    ),
                  ),
                  child: Text(
                    'DECONNEXION',
                    style: TextStyle(
                      fontFamily: 'Atma',
                      fontSize: MediaQuery.of(context).size.width * (21 / 800),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

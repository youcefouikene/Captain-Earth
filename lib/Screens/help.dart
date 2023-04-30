import 'package:flutter/material.dart';

class helpPage extends StatelessWidget {
  List<String> listeIndication = [
    'Appuyer sur les dechets pour\nnettoyer l\'ocean et sauver\nles poissons',
    'Pour chaque carte sélectionner celle\nqui la ressemble',
    'Selectionnez la bonne réponse afin\nde sauver le pauvre animal',
    'rien',
    'Pour chaque carte sélectionner celle\nqui la ressemble',
    'Appuyer sur les feu pour\nles éteindre et sauver\nla foret',
  ];
  int numStation = 0;
  String background;
  helpPage({required this.numStation, required this.background});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(background),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        fontSize:
                            MediaQuery.of(context).size.width * (32 / 800),
                        color: Color(0xff134E49),
                      ),
                    ),
                    Text(
                      listeIndication[numStation],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Atma',
                        fontSize:
                            MediaQuery.of(context).size.width * (27 / 800),
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * (15 / 360),
                    // ),
                    Positioned(
                      // bottom: MediaQuery.of(context).size.height * (18 / 360),
                      child: Container(
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
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffE84560),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width *
                                          (10 / 800) -
                                      3),
                              //side: BorderSide(color: Color(0xff7B2B85)),
                            ),
                          ),
                          child: Text(
                            'OK',
                            style: TextStyle(
                              fontFamily: 'Atma',
                              fontSize: MediaQuery.of(context).size.width *
                                  (24 / 800),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * (190 / 800),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Image.asset(
                    'assets/images/avatar/captain_earth_hi.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ])),
      ],
    );
  }
}

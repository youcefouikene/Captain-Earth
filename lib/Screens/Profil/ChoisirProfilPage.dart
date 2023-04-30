import 'package:flutter/material.dart';
import 'AjouterProfilPage.dart';

class ChoisirProfil extends StatefulWidget {
  //ajouter une liste de profils de display in listView
  //pour l'instant je vaus mettre une liste of Strings comme des nom de profils
  @override
  State<ChoisirProfil> createState() => _ChoisirProfilState();
}

class _ChoisirProfilState extends State<ChoisirProfil> {
  List<String> listProfils = [
    "Mello",
    "Jack",
    "Lola",
    "Zake",
    "Youcef"
  ]; //normalement les profils existants dans la base de donnees
  IconData _icone = Icons.music_note;

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double het = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(158, 231, 251, 1),
      body: Stack(
        children: [
          //NOUVEAU MODEL boutton
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
                      width: MediaQuery.of(context).size.width * (39 / 800),
                      height: MediaQuery.of(context).size.width * (39 / 800),
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
                      iconSize: MediaQuery.of(context).size.width * (20 / 800),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * (12 / 360),
                ),
                Container(
                    child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      //margin: EdgeInsets.only(bottom: 12.0),
                      width: MediaQuery.of(context).size.width * (39 / 800),
                      height: MediaQuery.of(context).size.width * (39 / 800),
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
                      icon: Icon(Icons.close_rounded),
                      iconSize: MediaQuery.of(context).size.width * (25 / 800),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                )),
              ],
            ),
          ),
          Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * (25 / 360),
              ),
              Text(
                "CHOISIR UN PROFIL",
                style: TextStyle(
                  color: const Color(0xff134E49),
                  fontFamily: 'Atma',
                  fontSize: wid * (33 / 800),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * (68 / 360),
              ),
              listProfils.isEmpty
                  ? Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            //navigation a la page d'ajout d'un profil
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AjouterProfil(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: const Color.fromRGBO(158, 231, 251, 1),
                          ),
                          child: Image.asset(
                            "assets/images/ajouter.png",
                            width: wid * (117 / 800),
                            height: wid * (117 / 800),
                          ),
                        ),
                        SizedBox(
                          height: het * 12 / 360,
                        ),
                        Text(
                          "Ajouter",
                          style: TextStyle(
                            fontFamily: "Atma",
                            fontSize: wid * 22 / 800,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      width: wid * 500 / 800,
                      height: het * (36 + 117) / 360,
                      child: ListView.builder(
                          itemCount: listProfils.length + 1,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, int index) {
                            if (index == listProfils.length) {
                              return Positioned(
                                top: het * 146.33 / 360,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        //navigation a la page d'ajout d'un profil
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AjouterProfil(),
                                            ));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        primary: const Color.fromRGBO(
                                            158, 231, 251, 1),
                                      ),
                                      child: Image.asset(
                                        "assets/images/ajouter.png",
                                        width: wid * (117 / 800),
                                        fit: BoxFit.fitWidth,
                                        // height: het * (117 / 800),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: het * 12 / 360,
                                    // ),
                                    Text(
                                      "Ajouter",
                                      style: TextStyle(
                                        fontFamily: "Atma",
                                        fontSize: wid * 22 / 800,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Row(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          //naviger vers les pages de connexion a un profil
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          primary: const Color.fromRGBO(
                                              158, 231, 251, 1),
                                        ),
                                        child: Container(
                                          width: wid * (117 / 800),
                                          height: wid * (117 / 800),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: const Color.fromARGB(
                                                255, 219, 205, 207),
                                            border: Border.all(
                                              color: const Color(0xff134E49),
                                              width: 3,
                                            ),
                                          ),
                                          // child: , ici on met l'avatar de chaque profil
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: het * 12 / 360,
                                      // ),
                                      Text(
                                        listProfils[index],
                                        style: TextStyle(
                                          fontFamily: "Atma",
                                          fontSize: wid * 22 / 800,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ), // ici le nom le chaque profil
                                    ],
                                  ),
                                  // SizedBox(
                                  //   width: wid * (107.33 / 800),
                                  // ),
                                ],
                              );
                            }
                          }),
                    ),
            ],
          )),
        ],
      ),
    );
  }
}

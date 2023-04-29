import 'package:flutter/material.dart';

class AjouterProfil extends StatefulWidget {
  const AjouterProfil({super.key});

  @override
  State<AjouterProfil> createState() => _AjouterProfilState();
}

class _AjouterProfilState extends State<AjouterProfil> {
  IconData _icone = Icons.music_note;
  final TextEditingController _nameController = TextEditingController();
  bool isLoading = false;
  String userName = '';

  @override
  Widget build(BuildContext context) {
    Function affecterNom = () {
      setState(() {
        userName = _nameController.text;
      });
    };
    double wid = MediaQuery.of(context).size.width;
    double het = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(158, 231, 251, 1),
      body: Stack(
        children: [
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

          Positioned(
            top: het * 120 / 360,
            left: wid * 600 / 800,
            child: Image.asset(
              'assets/images/avatar/captain_earth_hi.png',
              width: wid * 136.35 / 800,
              height: het * 214.29 / 360,
            ),
          ),
          Stack(children: [
            Positioned(
              left: wid * 157 / 800,
              top: het * 63 / 360,
              child: Container(
                width: wid * 408 / 800,
                height: het * 217 / 360,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(wid * 52 / 800),
                  border: Border.all(
                    color: const Color.fromRGBO(64, 142, 64, 1),
                    width: wid * 3 / 800,
                  ),
                ),
              ),
            ),
            Positioned(
                top: het * 82 / 360,
                left: wid * 249 / 800,
                child: Text(
                  "Nouveau profil",
                  style: TextStyle(
                    fontFamily: "Atma",
                    fontSize: wid * 30 / 800,
                    color: const Color.fromRGBO(19, 78, 73, 1),
                    fontWeight: FontWeight.w700,
                  ),
                )),
            Positioned(
              top: het * 168 / 360,
              left: wid * 189 / 800,
              child: Container(
                  width: wid * 347 / 800,
                  height: het * 50 / 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(wid * 9 / 800),
                    color: Color.fromRGBO(238, 236, 235, 1),
                  ),
                  //cette sera completer apres
                  // normalement la methode de travail est dans le code de Wassim
                  child: Column(children: [
                    TextFormField(
                      controller: _nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: (26.42 / 800) * wid),
                          child: Icon(Icons.person_outline_outlined,
                              size: (26 / 800) * wid,
                              color: const Color.fromRGBO(96, 94, 94, 1)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(238, 236, 235, 1),
                          ),
                          borderRadius: BorderRadius.circular((9 / 800) * wid),
                        ),
                        hintText: 'Prénom de votre enfant',
                        hintStyle: const TextStyle(
                          fontFamily: 'Atma',
                          color: Color.fromRGBO(74, 72, 72, 1),
                          fontSize: (19 / 16) * 16,
                          fontWeight: FontWeight.w400,
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(238, 236, 235, 1),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: (4 / 360) * het,
                            horizontal: (24 / 800) * wid),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Prénom de votre enfant ';
                        }
                        return null;
                      },
                    ),
                  ])),
            ),
            Positioned(
              left: wid * 301 / 800,
              top: het * 259 / 360,
              child: Container(
                width: MediaQuery.of(context).size.width * (164 / 800),
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
                  onPressed: () {
                    setState(() {
                      userName = _nameController.text;
                    });
                    print(userName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffE84560),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * (10 / 800) - 3),
                      //side: BorderSide(color: Color(0xff7B2B85)),
                    ),
                  ),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontFamily: 'Atma',
                      fontSize: MediaQuery.of(context).size.width * (24 / 800),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

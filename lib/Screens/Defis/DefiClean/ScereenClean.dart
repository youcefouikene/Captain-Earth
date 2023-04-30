import 'package:flutter/material.dart';
import './Box6.dart';

class ScreenClean extends StatefulWidget {
  @override
  State<ScreenClean> createState() => _ScreenCleanState();
}

class _ScreenCleanState extends State<ScreenClean> {
  @override
  Widget build(BuildContext context) {
    IconData _icone = Icons.music_note;
    return Scaffold(
      body: Container(
        color: Color(0xff9EE7FB),
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Box6(
                    pourcentage1: (499 / 800),
                    pourcentage2: (312 / 360),
                    text1:
                        "Je nettoies les espaces dans lesquelles je vis je ramasse les déchets et je les mes a la ",
                    title: "Ayez le bon reflexe",
                    text2: "poubelle même si ce n’est pas les miennes.",
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * (23 / 360),
                      right: MediaQuery.of(context).size.width * (35 / 800),
                      left: MediaQuery.of(context).size.width * (29 / 800),
                    ),
                    child: Image.asset(
                      "assets/images/avatar/captain_earth_hi.png",
                      width: MediaQuery.of(context).size.width * (136 / 800),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
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
                        iconSize:
                            MediaQuery.of(context).size.width * (20 / 800),
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
                        iconSize:
                            MediaQuery.of(context).size.width * (25 / 800),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

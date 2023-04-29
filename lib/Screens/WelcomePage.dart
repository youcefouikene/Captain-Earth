import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Widgets/StartBox.dart';
import '../try.dart';
import '../widgets/RectangleButton.dart';
import 'Profil/ChoisirProfilPage.dart';

class WelcomePage1 extends StatefulWidget {
  @override
  State<WelcomePage1> createState() => _WelcomePage1State();
}

class _WelcomePage1State extends State<WelcomePage1> {
  Color? col = Color.fromRGBO(232, 69, 96, 1);

  @override
  Widget build(BuildContext context) {
    double? wid = (MediaQuery.of(context).size.width);
    double? hei = (MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: Color.fromRGBO(158, 231, 251, 1),
      body: SafeArea(
        child: Container(
          child: Stack(children: [
            Positioned(
              left: wid * (76 / 800),
              top: hei * (29 / 360),
              child: Start(
                width: (407 / 800) * wid,
                height: (247 / 360) * hei,
                borderColor: Color(0xff135617),
                contextColor: Color(0xffffffff),
                text:
                    "Salut Champion, je suis\n captain earth ensemble on\n sauvera la planete contre la\n pollution Etês vous prêts ?",
                textColor: Colors.black,
              ),
            ),
            Positioned(
              top: hei * (18 / 360),
              left: wid * (539 / 800),
              child: Container(
                child: Image.asset(
                  "assets/images/avatar/captain_earth_hi.png",
                  width: (211.25 / 800) * wid,
                  fit: BoxFit.fitWidth,
                  // height: (332 / 360) * hei,
                ),
              ),
            ),
            Positioned(
              top: hei * (289 / 360),
              left: wid * (60 / 800),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * (134 / 800),
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => tryi(),
                            ));
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
                        'JOUER',
                        style: TextStyle(
                          fontFamily: 'Atma',
                          fontSize:
                              MediaQuery.of(context).size.width * (24 / 800),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: (153 / 800) * wid),
                  Container(
                    width: MediaQuery.of(context).size.width * (156 / 800),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChoisirProfil(),
                            ));
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
                        'S\'INSCRIRE',
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
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../Widgets/StartBox.dart';
import '../try.dart';
import 'Profil/ChoisirProfilPage.dart';
import '../settings.dart';
import '../progress/progress.dart';
import '../backend/local_progress/local_progress.dart';
import '../backend/progress_controllers.dart';
import '../backend/synchronization.dart';


class WelcomePage1 extends StatefulWidget {
  @override
  State<WelcomePage1> createState() => _WelcomePage1State();
}

class _WelcomePage1State extends State<WelcomePage1> {
  Color? col = const Color.fromRGBO(232, 69, 96, 1);

  @override
  Widget build(BuildContext context) {
    double? wid = (MediaQuery.of(context).size.width);
    double? hei = (MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(158, 231, 251, 1),
      body: SafeArea(
        child: Stack(
            children: [
          Positioned(
            left: wid * (76 / 800),
            top: hei * (20 / 360),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Start(
                  width: (407 / 800) * wid,
                  height: (247 / 360) * hei,
                  borderColor: const Color(0xff135617),
                  contextColor: const Color(0xffffffff),
                  text:
                  "Salut Champion, je suis\n captain earth ensemble on\n sauvera la planete contre la\n pollution Etês vous prêts ?",
                  textColor: Colors.black,
                ),
                SizedBox(
                  height: hei * (13 / 360),
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * (134 / 800),
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
                        onPressed: () async{
                          WidgetsFlutterBinding.ensureInitialized();
                          kUser = 'guest';
                          Future<UserProgress> g = getSQFLite('guest');
                          userProgress = await g;
                          if (userProgress.leaves == 0 && userProgress.stars == 0) {
                            LocalProgress.addUser(userProgress);
                          }
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => tryi(),
                            ));
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
                          'JOUER',
                          style: TextStyle(
                            fontFamily: 'Atma',
                            fontSize: MediaQuery.of(context).size.width *
                                (24 / 800),
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
                          color: const Color(0xff7B2B85),
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
                          backgroundColor: const Color(0xffE84560),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width *
                                    (10 / 800) -
                                    3),
                            //side: BorderSide(color: Color(0xff7B2B85)),
                          ),
                        ),
                        child: Text(
                          'S\'INSCRIRE',
                          style: TextStyle(
                            fontFamily: 'Atma',
                            fontSize: MediaQuery.of(context).size.width *
                                (24 / 800),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Positioned(
            top: hei * (18 / 360),
            left: wid * (539 / 800),
            child: Image.asset(
              "assets/images/avatar/captain_earth_hi.png",
              width: (211.25 / 800) * wid,
              fit: BoxFit.fitWidth,
            ),
          ),
        ]),
      ),
    );
  }
}


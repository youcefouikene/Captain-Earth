import 'package:flutter/material.dart';
import 'package:projet_2cp/Screens/ChooseGamePage.dart';
import 'package:projet_2cp/Widgets/ChooseBoxgame2.dart';
import '../Widgets/WelcomeTextBox.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<List<String>> listeGlobale = [
    [
      'Bienvenue en Oceanie',
      'Ici la terre est divisée en de nombreuses îles entourées d\'eau ! Avez-vous une idée de ce que sera notre mission ?',
      '25',
      'assets/images/oceanie/Background_Ocean_1.png',
      'Allons-y !',
      'à travers cette mission, nous en apprendrons plus sur la pollution de l\'eau et ses effets nocifs sur la planete',
      '26'
    ],
    [
      'Bienvenue en Asie',
      'Ici ou se trouve la plupart des usines des sociétés industrielle ! Avez-vous une idée de ce que sera notre mission ? ',
      '24',
      'assets/images/asie/Background_Asia.png',
      'Allons-y !',
      'à travers cette mission, nous en apprendrons plus sur la pollution de l\'aire et ses effets nocifs sur la planete',
      '26'
    ],
    [
      'Bienvenue en Afrique',
      'Plus de 1000 mammifères et 2600 espèces d\'oiseaux vivent ici ! Avez-vous une idée de ce que sera notre mission ? ',
      '25',
      'assets/images/afrique/Background_Africa_1.png',
      'Allons-y !',
      ' à travers cette mission, nous en apprendrons plus sur les animaux en danger et comment les préservés !',
      '26'
    ],
    [
      'Benvenue en Europe',
      'Ici  48 % des déchets ont été recyclés l\'an dernier! Avez-vous une idée de ce que sera notre mission ? ',
      '22',
      'assets/images/europeBackground.png',
      'Allons-y !',
      'à travers cette mission, nous en apprendrons plus sur le recyclage des déchets et comment peut-on l\'appliquer au quotidien  !',
      '15'
    ],
    [
      'Bienvenue en Amerique du nord',
      'Ici les sources d\'énergie renouvelables représentaient environ 12,4 % de la consommation totale d\'énergie primaire. Avez-vous une idée de ce que sera notre mission ? ',
      '2',
      'assets/images/ameriqueNord/Background_NorthAmerica.png',
      'Allons-y !',
      'à travers cette mission, nous en apprendrons plus sur les énergies  renouvelables et leurs impact positive sur la planète',
      '25'
    ],
    [
      'Bienvenue en Amerique du sud',
      ' Ici la moitié de la surface du continent est boisée ! Avez-vous une idée de ce que sera notre mission ? ',
      '22',
      'assets/images/ameriqueSud/Background_SouthAmerica_1.png',
      'Allons-y !',
      'à travers cette mission, nous en apprendrons plus sur la déforestation et comment peut-on préserver la flore !',
      '17'
    ],
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Map routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String Station = routeArgs['numStation'];
    int numStation = int.parse(Station);
    String pathJeu = routeArgs['pathJeu'];
    String pathQuiz = routeArgs['pathQuiz'];
    // final String title = routeArgs['title'] as String;
    // final String description = routeArgs['description'] as String;

    // final String background = 'assets/images/oceanie/Background_Ocean_1.png';
    // final String title = 'Bienvenue en Oceanie';
    // final String description =
    //     'Ici la terre est divisée en de\n nombreuses îles entourées d\'eau ! \n Avez-vous une idée de ce que sera notre mission ?';

    // print(routeArgs['background']);
    // print(routeArgs['title']);
    // print(routeArgs['description']);

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(listeGlobale[numStation][3]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
              Container(
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
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * (97 / 800)),
                          border: Border.all(
                            color: Color(0xff135617),
                            width: 3,
                          ),
                        ),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  (33 / 360),
                            ),
                            if (listeGlobale[numStation][index] == 'Allons-y !')
                              Container(
                                child: Text(
                                  listeGlobale[numStation][index],
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Atma',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            (32 / 800),
                                    color: Color(0xff134E49),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            else
                              Container(
                                child: Text(
                                  listeGlobale[numStation][index],
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Atma',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            (28 / 800),
                                    color: Color(0xff134E49),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  (int.parse(
                                          listeGlobale[numStation][index + 2]) /
                                      360),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width *
                                  (450 / 800),
                              child: Text(
                                listeGlobale[numStation][index + 1],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Atma',
                                  fontSize: MediaQuery.of(context).size.width *
                                      (28 / 800),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            // ),
                            // SizedBox(
                            //     height: MediaQuery.of(context).size.height *
                            //         (22 / 360)),
                            // Container(
                            //   child: Text(
                            //     listeGlobale[numStation][index],
                            //     style: TextStyle(
                            //       decoration: TextDecoration.none,
                            //       fontFamily: 'Atma',
                            //       fontSize: MediaQuery.of(context).size.width *
                            //           (28 / 800),
                            //       color: Color(0xff134E49),
                            //       fontWeight: FontWeight.w500,
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //     height: MediaQuery.of(context).size.height *
                            //         (15 / 360)),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       right: MediaQuery.of(context).size.width *
                            //           (25 / 800),
                            //       left: MediaQuery.of(context).size.width *
                            //           (25 / 800)),
                            //   child: Align(
                            //     alignment: Alignment.center,
                            //     child: Text(
                            //       listeGlobale[numStation][index + 1],
                            //       textAlign: TextAlign.center,
                            //       style: TextStyle(
                            //         decoration: TextDecoration.none,
                            //         fontFamily: 'Atma',
                            //         fontSize:
                            //             MediaQuery.of(context).size.width *
                            //                 (28 / 800),
                            //         color: Colors.black,
                            //         fontWeight: FontWeight.w400,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        )),
                      ),
                      Positioned(
                        bottom:
                            -MediaQuery.of(context).size.height * (20 / 360),
                        child: Container(
                          width:
                              MediaQuery.of(context).size.width * (130 / 800),
                          height:
                              MediaQuery.of(context).size.height * (39 / 360),
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
                                if (index == 0) {
                                  index = index + 4;
                                } else {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChooseGamePage(
                                              pathBackGround:
                                                  listeGlobale[numStation][3],
                                              pathJeu: pathJeu,
                                              pathQuiz: pathQuiz)));
                                }
                              });
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
              Container(
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

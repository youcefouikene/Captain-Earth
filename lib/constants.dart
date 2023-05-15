import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:projet_2cp/backend/progress_controllers.dart';
import 'package:projet_2cp/backend/local_progress/local_progress.dart';
import 'package:projet_2cp/progress/progress.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:projet_2cp/settings.dart';

//  ****************************************
// ************ Global variables *************
//  ****************************************

final player = AudioPlayer();
final backgroundPlayerOceanie = BackgoundPlayer("stations/station_1.mp3");
final backgroundPlayerAsie = BackgoundPlayer("stations/station_2.mp3");
final backgroundPlayerAfrique = BackgoundPlayer("stations/station_3.mp3");
final backgroundPlayerEurope = BackgoundPlayer("stations/station_4.mp3");
final backgroundPlayerAmeriqueNord = BackgoundPlayer("stations/station_5.mp3");
final backgroundPlayerAmeriqueSud = BackgoundPlayer("stations/station_6.mp3");
final backgroundPlayerQuiz = BackgoundPlayer("stations/station_4.mp3");
final backgroundPlayerMap = BackgoundPlayer("stations/map.mp3");

late bool clickRight;
List<int> choices = [0, 1, 2, 3];
bool didAnswer = false;

//  ****************************************
// **************  Constants  ****************
//  ****************************************

//        -----   FOR THE MAP   ----
int maxLeavesOceanieStation =
    54; // OceaniaQuizzes(12 Questions) * 2 + Mini jeu 30
int maxLeavesAsieStation = 48; // AsiaQuizzes(9 Questions) * 2 + Mini jeu 30
int maxLeavesAfriqueStation =
    48; // AfriqueQuizzes (12 Questions) * 2 + Mini jeu 24
int maxLeavesEuropeStation =
    60; // EuropeQuizzes (15 Questions) * 2 + Mini jeu 30
int maxLeavesAmeriqueNordStation =
    48; // Amerique de nord Quizzes (9 Questions) * 2 + Mini jeu 30
int maxLeavesAmeriqueSudStation =
    54; // Amerique de sud Quizzes (12 Questions) * 2 + Mini jeu 30
int maxLeavesTotal = 312;



//        -----   FOR Oceania   ----
List<String> listeGarbages = [
  'assets/images/oceanie/boutle.png',
  'assets/images/oceanie/materialTrash1.png',
  'assets/images/oceanie/materialTrash2.png',
  'assets/images/oceanie/banana.png',
  'assets/images/oceanie/plasticSac.png',
  'assets/images/oceanie/sacPoubelle.png',
];

List<String> animal = [
  'assets/images/oceanie/cancer.png',
  'assets/images/oceanie/poisson_violet.png',
  'assets/images/oceanie/hippocamps.png',
  'assets/images/oceanie/poisson_jaune.png',
  'assets/images/oceanie/poisson_rose.png',
  'assets/images/oceanie/tortue.png',
];

//        -----   FOR Africa   ----
final List<String> listAnimaux = [
  'assets/images/afrique/zebre.png',
  'assets/images/afrique/elephant.png',
  'assets/images/afrique/lion.png',
];

//        -----   FOR South AMERICA   ----
List<String> feu = [
  'assets/images/ameriqueSud/fire1.png',
  'assets/images/ameriqueSud/fire2.png',
  'assets/images/ameriqueSud/fire3.png',
  'assets/images/ameriqueSud/fire4.png',
  'assets/images/ameriqueSud/fire5.png',
  'assets/images/ameriqueSud/fire6.png',
  'assets/images/ameriqueSud/fire7.png',
  'assets/images/ameriqueSud/fire8.png',
  'assets/images/ameriqueSud/fire9.png',
];


List<List<String>> listeGlobale = [
  [
    'Bienvenue en Oceanie',
    'Ici la terre est divisée en de nombreuses îles entourées d\'eau ! Avez-vous une idée de ce que sera notre mission ?',
    '25',
    '378',
    'assets/images/oceanie/Background_Ocean_1.png',
    'Allons-y !',
    'à travers cette mission, nous en apprendrons plus sur la pollution de l\'eau et ses effets nocifs sur la planete',
    '26',
    '399'
  ],
  [
    'Bienvenue en Asie',
    'Ici ou se trouve la plupart des usines des sociétés industrielle ! Avez-vous une idée de ce que sera notre mission ? ',
    '24',
    '410',
    'assets/images/asie/Background_Asia.png',
    'Allons-y !',
    'à travers cette mission, nous en apprendrons plus sur la pollution de l\'aire et ses effets nocifs sur la planete',
    '26',
    '395',
  ],
  [
    'Bienvenue en Afrique',
    'Plus de 1000 mammifères et 2600 espèces d\'oiseaux vivent ici !Avez-vous une idée de ce que sera notre mission ? ',
    '25',
    '376',
    'assets/images/afrique/Background_Africa_1.png',
    'Allons-y !',
    ' à travers cette mission, nous en apprendrons plus sur les animaux en danger et comment les préservés !',
    '26',
    '391'
  ],
  [
    'Benvenue en Europe',
    'Ici  48 % des déchets ont été recyclés l\'an dernier!Avez-vous une idée de ce que sera notre mission ? ',
    '22',
    '369',
    'assets/images/europeBackground.png',
    'Allons-y !',
    'à travers cette mission, nous en apprendrons plus sur le recyclage des déchets et comment peut-on l\'appliquer au quotidien  !',
    '20',
    '380'
  ],
  [
    'Bienvenue en Amerique du nord',
    'Ici les sources d\'énergie renouvelables représentaient environ 12,4 % de la consommation totale d\'énergie primaire.Avez-vous une idée de ce que seranotre mission ? ',
    '13',
    '448',
    'assets/images/ameriqueNord/Background_NorthAmerica.png',
    'Allons-y !',
    'à travers cette mission, nous en apprendrons plus sur les énergies  renouvelables et leurs impact positive sur la planète',
    '26',
    '361'
  ],
  [
    'Bienvenue en Amerique du sud',
    'Ici la moitié de la surface du continent est boisée !\nAvez-vous une idée de ce que sera notre mission ? ',
    '22',
    '371',
    'assets/images/ameriqueSud/Background_SouthAmerica_1.png',
    'Allons-y !',
    'à travers cette mission, nous en apprendrons plus sur la déforestation et comment peut-on préserver la flore !',
    '17',
    '388',
  ],
];


int max(int x, int y) => x > y ? x : y;

//  ****************************************
// ************* UPDATING DATA ***************
//  ****************************************

void dataUpdator(BuildContext context, StationProgress stationProgress,
    GameProgress gameProgress, int leaves, int stars) async {
  if (stars > gameProgress.stars) {

    //! Changes
    int previousStars = gameProgress.stars;
    gameProgress.stars = stars;
    userProgress.stars = userProgress.stars - previousStars + stars;
    stationProgress.stars = stationProgress.stars - previousStars + stars;

    if (userProgress.currentStation == 5 &&
        (userProgress.stations[5].stars / 2 >= 2)) {
      //? If Last Game in the last station
      if( 0< userProgress.leaves && userProgress.leaves <= 4){
        userProgress.trophy = 1;
      }else if( 104 < userProgress.leaves && userProgress.leaves <= 208 ){
        userProgress.trophy = 2;
      }else{
        userProgress.trophy = 3;
      }
    } else if (userProgress.currentStation < 5 &&
        ((stationProgress.stars / 2) >= 2)) {
      //! else if we passed the condition of getting 2 stars for the station to pass to the next station
      userProgress.currentStation++;
    }
  }
  if (gameProgress.leaves < leaves) {
    userProgress.leaves = userProgress.leaves - gameProgress.leaves + leaves;
    stationProgress.leaves = stationProgress.leaves - gameProgress.leaves + leaves;
    gameProgress.leaves = leaves;
  }
  userProgress.leaves += leaves;
  stationProgress.leaves += leaves;

  //! Updates
  LocalProgress.updateUser(userProgress);
  LocalProgress.updateCurrentStation(stationProgress);
  LocalProgress.updateCurrentGame(gameProgress);
}

//  ****************************************
// ************** Animations ****************
//  ****************************************

//              ----   1   ----

class BlinkingStars extends StatefulWidget {
  @override
  _BlinkingStarsState createState() => _BlinkingStarsState();
}
class _BlinkingStarsState extends State<BlinkingStars> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 40));
    _animation = Tween<double>(begin: 0.8, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ))..addListener(() {
      setState(() {});
    });
    _controller.repeat(reverse: true);
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: List.generate(6, (index) {
        final double xPos = Random().nextDouble() * screenWidth;
        final double yPos = Random().nextDouble() * screenHeight;
        return Positioned(
          left: xPos,
          top: yPos,
          child: Opacity(
            opacity: _animation.value,
            child: const Icon(
              Icons.star,
              size: 25,
              color: Color.fromRGBO(253,205,86,1),
            ),
          ),
        );
      }),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


//              ----   2   ----

class WinningAnimationTopCenter extends StatefulWidget {
  const WinningAnimationTopCenter({Key? key}) : super(key: key);

  @override
  State<WinningAnimationTopCenter> createState() => _WinningAnimationTopCenterState();
}

class _WinningAnimationTopCenterState extends State<WinningAnimationTopCenter> {
  bool isPlaying = false;
  final controller = ConfettiController();

  @override
  void initState(){
    super.initState();
    controller.play();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ConfettiWidget(
          confettiController: controller,
          shouldLoop: true,
          // Set direction
          blastDirectionality: BlastDirectionality.explosive,
          // Set emission count
          minBlastForce: 10,
          numberOfParticles: 24,
          // Set speed
          gravity: 0.3,
        ),
      ],
    );
  }
}



class WinningAnimation extends StatefulWidget {
  const WinningAnimation({Key? key}) : super(key: key);

  @override
  State<WinningAnimation> createState() => _WinningAnimationState();
}

class _WinningAnimationState extends State<WinningAnimation> {
  bool isPlaying = false;
  final controller = ConfettiController();

  @override
  void initState(){
    super.initState();
    controller.play();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              ConfettiWidget(
                confettiController: controller,
                shouldLoop: true,
                // Set direction
                blastDirectionality: BlastDirectionality.explosive,
                // Set emission count
                minBlastForce: 10,
                numberOfParticles: 24,
                // Set speed
                gravity: 0.3,
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              ConfettiWidget(
                confettiController: controller,
                shouldLoop: true,
                // Set direction
                blastDirectionality: BlastDirectionality.explosive,
                // Set emission count
                minBlastForce: 10,
                numberOfParticles: 24,
                // Set speed
                gravity: 0.3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}



//  ****************************************
// **************** SOUNDS ******************
//  ****************************************

//              ----   1   ----

void playQqs(sound) {
  player.play(
    AssetSource(
      'sounds/questions/$sound.mp3',
    ),
  );
  player.setVolume(0.8);
}


//              ----   2   ----

class BackgoundPlayer {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  late String _music;

  BackgoundPlayer(String backgroundMusic) {
    _audioPlayer = AudioPlayer();
    playMusic(); // start playing the audio automatically
    _music = backgroundMusic;
  }
  void playMusic() async {
    await _audioPlayer.play(
      AssetSource('../assets/sounds/$_music'),
    );
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
    isPlaying = true;
  }
  void stopMusic() async {
    await _audioPlayer.stop();
    isPlaying = false;
  }
  void toggleMusic() {
    if (isPlaying) {
      stopMusic();
    } else {
      playMusic();
    }
  }
  void dispose() {
    _audioPlayer.dispose();
  }
}
//              ----   3   ----

void playDefi(sound) {
  player.play(
    AssetSource(
      'sounds/defis/$sound.mp3',
    ),
  );
  player.setVolume(2.0);
}

void playSoundHelp(sound) {
  player.play(
    AssetSource(
      'sounds/help/$sound.mp3'
    ),
  );
  player.setVolume(2.0);
}
void playSoundIndication(sound) {
   player.play(
    AssetSource(
      'sounds/indications/$sound.mp3',
     
    ),
  );
  player.setVolume(2.0);
}
void playSoundEncouragement(sound) {
   player.play(
    AssetSource(
      'sounds/felecitations/$sound.mp3',
     
    ),
  );
  player.setVolume(2.0);
}

IconData iconeTypeFunction(){
  return (kSound) ? Icons.music_note : Icons.music_off;
}
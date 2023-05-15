import 'package:flutter/material.dart';
import 'package:projet_2cp/constants.dart';
import 'package:projet_2cp/progress/progress.dart';
import 'package:projet_2cp/backend/progress_controllers.dart';
import '../Widgets/WiningBox.dart';
import 'package:projet_2cp/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:projet_2cp/constants.dart';
import 'package:projet_2cp/settings.dart';

class EndGamePage extends StatefulWidget {
  final String background;
  final String station;
  final int stationIndex;
  int score;
  int stars;
  String refreshPath;

  EndGamePage({
    super.key,
    required this.score,
    required this.stars,
    required this.background,
    required this.station,
    required this.stationIndex,
    required this.refreshPath,
  });

  @override
  State<EndGamePage> createState() => _EndGamePageState();
}

class _EndGamePageState extends State<EndGamePage> {
  String choixAvatar() {
    if (widget.stars == 0) {
      return 'assets/images/avatar/Captain_craying.png';
    } else if (widget.stars == 1) {
      return 'assets/images/avatar/Captain_good.png';
    } else if (widget.stars == 2) {
      return 'assets/images/avatar/Captain_good.png';
    } else {
      return 'assets/images/avatar/Captain_jumping.png';
    }
  }

    String choixEncouragement() {
    if (widget.stars == 0) {
      return '1';
    } else if (widget.stars == 1) {
      return '2';
    } else if (widget.stars == 2) {
      return '3';
    } else {
      return '3';
    }
  }

  double separateur() {
    if (widget.stars == 0) {
      return 3;
    } else if (widget.stars == 1) {
      return 41;
    } else if (widget.stars == 2) {
      return 41;
    } else {
      return 23;
    }
  }

  double pourcentageAvatar() {
    if (widget.stars == 0) {
      return 287;
    } else if (widget.stars == 1) {
      return 174;
    } else if (widget.stars == 2) {
      return 174;
    } else {
      return 271;
    }
  }

  double left() {
    if (widget.stars == 0) {
      return 134;
    } else if (widget.stars == 1) {
      return 159;
    } else if (widget.stars == 2) {
      return 159;
    } else {
      return 124;
    }
  }

  @override
  Widget build(BuildContext context) {
     AudioPlayer player = AudioPlayer();
  AudioPlayer player1 = AudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player1.play(
      AssetSource('assets/sounds/stations/map.mp3'),
    );
   player1.setReleaseMode(ReleaseMode.loop);
  }
  @override
  void dispose() {
    player.stop();
    super.dispose();
  }
 Future<void> playAudio() async {
    await player.play(AssetSource('sound.mp3'));
  }
    if (true) {
      backgroundPlayerMap.playMusic();
    }
    playSoundEncouragement(choixEncouragement());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.background),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * (34 / 360),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * (left() / 800)),
                WiningBox(
                  Score: widget.score,
                  Stars: widget.stars,
                  station: widget.station,
                  refreshPath: widget.refreshPath,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width *
                        (separateur() / 800)),
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      (pourcentageAvatar() / 800),
                  child: Image.asset(
                    choixAvatar(),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

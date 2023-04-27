import 'package:flutter/material.dart';
import '../shapes/winning_box.dart';

class EndGamePage extends StatelessWidget {
  final String background;
  final int stars;
  final int score;
  final String station;

  EndGamePage({
    required this.background,
    required this.stars,
    required this.score,
    required this.station,
  });

  String choixAvatar() {
    if (stars == 0) {
      return 'assets/avatar/Captain crying.png';
    } else if (stars == 1) {
      return 'assets/avatar/Captain good.png';
    } else if (stars == 2) {
      return 'assets/avatar/Captain good.png';
    } else {
      return 'assets/avatar/Captain jumping.png';
    }
  }

  double separateur()
  {
    if (stars == 0) {
      return 3;
    } else if (stars == 1) {
      return 41;
    } else if (stars == 2) {
      return 41;
    } else {
      return 23;
    }
  }

  double pourcentageAvatar()
  {
    if (stars == 0) {
      return 287;
    } else if (stars == 1) {
      return 174;
    } else if (stars == 2) {
      return 174;
    } else {
      return 271;
    }
  }

  double left()
  {
    if (stars == 0) {
      return 134;
    } else if (stars == 1) {
      return 159;
    } else if (stars == 2) {
      return 159;
    } else {
      return 124;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0xff88EA88),
              image: DecorationImage(
                image: AssetImage(background),
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
                SizedBox(width: MediaQuery.of(context).size.width * (left() / 800)),
                WinningBox(
                  pourcentage1: (286 / 800),
                  pourcentage2: (247 / 360),
                  pourcentageFont: (33 / 800),
                  pourcentageRaduis: (43 / 800),
                  score: score,
                  stars: stars,
                  station: station,
                ),

                SizedBox(width: MediaQuery.of(context).size.width * (separateur() / 800)),

                SizedBox(
                  width: MediaQuery.of(context).size.width * (pourcentageAvatar() / 800),
                  child:Image.asset(
                    choixAvatar(),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
        ],
    );
  }
}
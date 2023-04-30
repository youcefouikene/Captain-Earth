import 'package:flutter/material.dart';
import '../Widgets/WiningBox.dart';

class EndGamePage extends StatelessWidget {
  final String background;
  //final String avatar;
  // final String text;
  // final double pourcentage1;
  //final double pourcentage2;
  //final double pourcentage3;
  // final double pourcentageFont;
  //
  //final double pourcentageAvatar;
  final int stars;
  final int score;
  //final String textButton;
  final String station;
  String refreshPath;

  EndGamePage({
    required this.background,
    required this.stars,
    required this.score,
    required this.station,
    required this.refreshPath,
    //required this.pourcentage1,
    //required this.pourcentage2,
    //required this.pourcentage3,
    //required this.pourcentageAvatar,
    //required this.pourcentageFont,
    //required this.textButton
  });

  String choixAvatar() {
    if (stars == 0) {
      return 'assets/images/avatar/Captain_craying.png';
    } else if (stars == 1) {
      return 'assets/images/avatar/Captain_good.png';
    } else if (stars == 2) {
      return 'assets/images/avatar/Captain_good.png';
    } else {
      return 'assets/images/avatar/Captain_jumping.png';
    }
  }

  double separateur() {
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

  double pourcentageAvatar() {
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

  double left() {
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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              //color: Color(0xff88EA88),
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
                SizedBox(
                    width: MediaQuery.of(context).size.width * (left() / 800)),
                WiningBox(
                  Score: score,
                  Stars: stars,
                  station: station,
                  refreshPath: refreshPath,
                ),

                SizedBox(
                    width: MediaQuery.of(context).size.width *
                        (separateur() / 800)),

                Container(
                  //color: Colors.black,
                  // margin: EdgeInsets.only(top:122),
                  width: MediaQuery.of(context).size.width *
                      (pourcentageAvatar() / 800),
                  child: Image.asset(
                    choixAvatar(),
                    fit: BoxFit.fitWidth,
                  ),
                ),

                // Container(
                //   //color: Colors.black,
                //     width: MediaQuery.of(context).size.width * (pourcentageAvatar() / 800),
                //     child: Image.asset(
                //       choixAvatar(),
                //       fit: BoxFit.fitWidth,
                //     ),
                // ),

                // Container(
                //   color: Colors.green,
                //   width: MediaQuery.of(context).size.width * (pourcentageAvatar() / 800),
                //   child: Align(
                //     alignment: Alignment.bottomCenter,
                //     child: Padding(
                //       padding: EdgeInsets.only(bottom: 20),
                //       child: Image.asset(choixAvatar(),fit: BoxFit.fitHeight,),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

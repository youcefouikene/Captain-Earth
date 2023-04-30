import 'package:flutter/material.dart';
import '../Widgets/ChooseBoxGame1.dart';
import 'quizOption.dart';
import 'Etoiles2.dart';

class ChooseBoxgame extends StatelessWidget {
  final double pourcentage1;
  final double pourcentage2;
  final double pourcentage3;
  final double pourcentageFont;
  final double pourcentageRaduis;
  final String TextFont;
  final String text;
  final Color TextColor;
  final int Stars;
  final String path;

  ChooseBoxgame(
      {required this.text,
      required this.pourcentage1,
      required this.pourcentage2,
      required this.pourcentage3,
      required this.pourcentageFont,
      required this.pourcentageRaduis,
      required this.TextFont,
      required this.TextColor,
      required this.Stars,
      required this.path});
  //pourcentage3 est consacre pour le margin bottom

  CustomPainter choix() {
    if (Stars == 0) {
      return RPSCustomPainter1();
    } else if (Stars == 1) {
      return RPSCustomPainter4();
    } else if (Stars == 2) {
      return RPSCustomPainter2();
    } else {
      return RPSCustomPainter3();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        quizOption2(
          text: text,
          pourcentage1: pourcentage1,
          pourcentage2: pourcentage2,
          pourcentage3: pourcentage3,
          pourcentageFont: pourcentageFont,
          pourcentageRaduis: pourcentageRaduis,
          TextFont: TextFont,
          TextColor: TextColor,
          path: path,
        ),
        Container(
          width: MediaQuery.of(context).size.width * pourcentage1,
          height: MediaQuery.of(context).size.height * pourcentage2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * pourcentageRaduis),
            border: Border.all(
              color: Color(0xff135617),
              width: 4,
            ),
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(path);
            },
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: TextFont,
                  fontWeight: FontWeight.w700,
                  color:Color(0xff135617) ,
                  fontSize: MediaQuery.of(context).size.width * pourcentageFont,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * pourcentageRaduis),
              ),
              primary: Color.fromARGB(255, 255, 255, 255),
              onPrimary: TextColor,
            ),
          ),
        ),
        Positioned(
          top: -MediaQuery.of(context).size.height * 0.11,
          child: CustomPaint(
            size: Size(
                (MediaQuery.of(context).size.width * 0.2111875),
                (MediaQuery.of(context).size.height * 0.192472222)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: choix(),
          ),
        ),
      ],
    );
  }
}

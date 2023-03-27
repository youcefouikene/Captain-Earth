import 'package:flutter/material.dart';
import 'quizOption.dart';
import 'Etoiles.dart';

class ChooseBoxgame extends StatelessWidget {
 final double pourcentage1;
 //width
 final double pourcentage2;//heith
 final double pourcentage3;//0
 final double pourcentageFont;
 final double pourcentageRaduis;
 final String TextFont;
 final String text;
 final Color TextColor;
 final int Stars;

 ChooseBoxgame({required this.text,required this.pourcentage1,required this.pourcentage2,required this.pourcentage3,required this.pourcentageFont,required this.pourcentageRaduis,required this.TextFont, required this.TextColor,required this.Stars});
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
        quizOption(text: text, pourcentage1: pourcentage1, pourcentage2: pourcentage2, pourcentage3: pourcentage3, pourcentageFont: pourcentageFont,pourcentageRaduis: pourcentageRaduis ,TextFont: TextFont,TextColor:TextColor),
        
        Positioned(
          top: -MediaQuery.of(context).size.height*0.11,
          child: CustomPaint(
              size: Size(
                  (MediaQuery.of(context).size.width* 0.2111875),
                  (MediaQuery.of(context).size.height*0.192472222)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: choix(),
          ),
        ),
      ],
    
    );


    }

}

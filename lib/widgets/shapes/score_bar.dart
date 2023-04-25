import 'package:flutter/material.dart';
class ScoreBar extends StatelessWidget{

  //final String leaf;
  final double pourcentage1;
  final double pourcentage2;
  final double pourcentage3;
  final double pourcentage4;
  final double pourcentage5;
  final double pourcentageleaf;
  final double pourcentageFont;
  final int score;
  final double pourcentageRaduis;


  ScoreBar({

    //required this.leaf,
    required this.pourcentage1,
    required this.pourcentage2,
    required this.pourcentage3,
    required this.pourcentage4,
    required this.pourcentage5,
    required this.pourcentageleaf,
    required this.pourcentageFont,
    required this.score,
    required this.pourcentageRaduis,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right:MediaQuery.of(context).size.width *pourcentage5),
          width: MediaQuery.of(context).size.width * pourcentage1,
          height: MediaQuery.of(context).size.height * pourcentage2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*pourcentageRaduis),
            color: Color(0xffF4F4F4),
          ),

          child:Container(
            width: MediaQuery.of(context).size.width*(50/800),
            height: MediaQuery.of(context).size.height*(41/360),
            // child: Image.asset(
            //   'assets/images/leaf.png',
            //   fit: BoxFit.fitWidth,
            // ),
            child: FractionallySizedBox(
              widthFactor: 0.5,
              //heightFactor: 0.5,
              child: Image(
                image: AssetImage('assets/images/leaf.png'),
              ),
            ),
          ),
          //
        ),

        Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*pourcentageRaduis),
            color: Color(0xffF4F4F4),

          ),

          width: MediaQuery.of(context).size.width *pourcentage3,
          height: MediaQuery.of(context).size.height *pourcentage4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child:   Text(
                  'Score:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Atma',
                    fontSize:
                    MediaQuery.of(context).size.width * pourcentageFont,
                    color: Color(0xff135617),
                  ),
                ),
                //margin:EdgeInsets.all(10.0) ,
              ),
              Container(

                child:Text(
                  score.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Atma',
                    fontSize:
                    MediaQuery.of(context).size.width * pourcentageFont,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),

              ),

            ],
          ),
        ),
      ],
    );
  }
}
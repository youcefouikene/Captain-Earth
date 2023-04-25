import 'package:flutter/material.dart';
class StationBar extends StatelessWidget{

  final String leaf;
  final double pourcentage1;
  final double pourcentage2;
  final double pourcentage3;
  final double pourcentage4;
  final double pourcentage5;
  final double pourcentageleaf;
  final double pourcentageFont;
  final String station;
  final double pourcentageRaduis;


  StationBar({

    required this.leaf,
    required this.pourcentage1,
    required this.pourcentage2,
    required this.pourcentage3,
    required this.pourcentage4,
    required this.pourcentage5,
    required this.pourcentageleaf,
    required this.pourcentageFont,
    required this.station,
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
          child: FractionallySizedBox(
            widthFactor: 0.5,
            //heightFactor: 0.5,
            child: Image(
              image: AssetImage('assets/images/Map_marker.png'),
            ),
          ),

        ),
        Container(
          width: MediaQuery.of(context).size.width *pourcentage3,
          height: MediaQuery.of(context).size.height *pourcentage4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*pourcentageRaduis),
            color: Color(0xffF4F4F4),

          ),
          child: Center(
            child: Text(
              // textAlign:TextAlign.center,
              station,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Atma',
                fontSize:
                MediaQuery.of(context).size.width * pourcentageFont,
                color: Colors.black,
              ),
            ),
          ),

        )
      ],
    );
  }
}
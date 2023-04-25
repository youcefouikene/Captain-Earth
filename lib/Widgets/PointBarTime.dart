import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class PointBarTime extends StatelessWidget {
  late int score;

  PointBarTime({required this.score});
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.0859444,
          width: MediaQuery.of(context).size.width * 0.146425,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(36.5),
            border: Border.all(
              color: Color(0xff752683),
              width: 3,
            ),
          ),
          //padding: EdgeInsets.all(10),
          child: Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              score.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Atma",
                fontSize: MediaQuery.of(context).size.width * 0.025,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.1277777,
          width: MediaQuery.of(context).size.height * 0.1277777,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Color(0xff752683),
              width: 3,
            ),
          ),
          child:
          /*const Icon(Icons.access_alarm,
          color: Colors.amber,
          ),*/const Image(
            image: AssetImage('assets/images/openmoji_timer.png'),
            //width: 10,
          ),
        ),
      ],
    );
  }
}

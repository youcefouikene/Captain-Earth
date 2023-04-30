import 'package:flutter/material.dart';

class Box11 extends StatelessWidget {
  final String text;
  final String title;
  final double pourcentage1;
  final double pourcentage2;

  Box11(
      {required this.pourcentage1,
      required this.pourcentage2,
      required this.text,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * pourcentage1,
        height: MediaQuery.of(context).size.height * pourcentage2,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(97),
          border: Border.all(
            color: Color(0xff135617),
            width: 5,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: MediaQuery.of(context).size.height * (20 / 360),
              left: MediaQuery.of(context).size.width * (120 / 800),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Atma',
                  fontSize: MediaQuery.of(context).size.width * (27 / 800),
                  fontWeight: FontWeight.w700,
                  color: Color(0xff134E49),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * (68 / 360),
              left: MediaQuery.of(context).size.width * (205 / 800),
              child: Image.asset(
                "assets/images/defi/arroser.png",
                //height: MediaQuery.of(context).size.height * (109/360),
                //width: MediaQuery.of(context).size.width* (142.15/800),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * (31 / 360),
              left: MediaQuery.of(context).size.width * (218 / 800),
              child: Container(
                width: MediaQuery.of(context).size.width * (209 / 800),
                height: MediaQuery.of(context).size.height * (80 / 360),
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Atma',
                    fontSize: MediaQuery.of(context).size.width * (25 / 800),
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * (0 / 360),
              left: MediaQuery.of(context).size.width * (87 / 800),
              child: Image.asset(
                "assets/images/defi/flower1.png",
                //height: MediaQuery.of(context).size.height * (192/360),
                //width: MediaQuery.of(context).size.width* (80/800),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ));
  }
}

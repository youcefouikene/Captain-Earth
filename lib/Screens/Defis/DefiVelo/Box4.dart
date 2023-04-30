import 'package:flutter/material.dart';

class Box4 extends StatelessWidget {
  final String text;
  final String title;
  final double pourcentage1;
  final double pourcentage2;

  Box4(
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
            color: Color(0xff408E40),
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
            Center(
                child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * (27 / 360)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/defi/ridingByc.png",
                    //height: MediaQuery.of(context).size.height * (192/360),
                    width: MediaQuery.of(context).size.width * (155 / 800),
                    fit: BoxFit.fitWidth,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * (260 / 800),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontFamily: 'Atma',
                        fontSize:
                            MediaQuery.of(context).size.width * (25 / 800),
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ));
  }
}

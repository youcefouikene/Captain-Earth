import 'package:flutter/material.dart';
import '../Widgets/Europe/boxWelcom.dart';
import '../Widgets/RectangleButton.dart';

class helpPageEu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/europeBackground.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(children: [
        Positioned(
            top: MediaQuery.of(context).size.height * (15.96 / 360),
            left: MediaQuery.of(context).size.width * (33.99 / 800),
            child: boxWelcom(
                pourcentage1: (529 / 800), pourcentage2: (302 / 360))),
        Positioned(
          top: MediaQuery.of(context).size.height * (36.96 / 360),
          right: MediaQuery.of(context).size.width * (33.81 / 800),
          width: MediaQuery.of(context).size.width * (190.88 / 800),
          height: MediaQuery.of(context).size.height * (299.99 / 360),
          child: Image.asset(
            "assets/images/avatar/captain_earth_hi.png",
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
            bottom: MediaQuery.of(context).size.height * (22.73 / 360),
            left: MediaQuery.of(context).size.width * (242 / 800),
            child: Container(
              width: MediaQuery.of(context).size.width * (82 / 800),
              height: MediaQuery.of(context).size.height * (49 / 360),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * (10 / 800)),
                border: Border.all(
                  color: Color(0xff7B2B85),
                  width: 3,
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffE84560),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * (10 / 800) - 3),
                    //side: BorderSide(color: Color(0xff7B2B85)),
                  ),
                ),
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontFamily: 'Atma',
                    fontSize: MediaQuery.of(context).size.width * (26 / 800),
                  ),
                ),
              ),
            )),
      ]),
    );
  }
}

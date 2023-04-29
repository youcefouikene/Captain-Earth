import 'package:flutter/material.dart';

class quizOption extends StatelessWidget {
  final String text;
  final double pourcentage1;
  final double pourcentage2;
  final double pourcentage3;
  final double pourcentageFont;
  final double pourcentageRaduis;
  final String TextFont;
  final Color TextColor;
  quizOption(
      {required this.text,
      required this.pourcentage1,
      required this.pourcentage2,
      required this.pourcentage3,
      required this.pourcentageFont,
      required this.pourcentageRaduis,
      required this.TextFont,
      required this.TextColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * pourcentage3),
      width: MediaQuery.of(context).size.width * pourcentage1,
      height: MediaQuery.of(context).size.height * pourcentage2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * pourcentageRaduis),
        border: Border.all(
          color: Color(0xff135617),
          width: 3,
        ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: TextFont,
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
    );
  }
}

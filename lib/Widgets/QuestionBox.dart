import 'package:flutter/material.dart';

class QuestionBox extends StatelessWidget {
 final String text;
  final double pourcentage1;
  final double pourcentage2;
  final double pourcentage3;

  QuestionBox({required this.text, required this.pourcentage1,required this.pourcentage2,required this.pourcentage3,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * pourcentage3),
      width: MediaQuery.of(context).size.width * pourcentage1,
      height: MediaQuery.of(context).size.height* pourcentage2,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
            color: Color(0xff135617),
            width: 3,
          ),
      ),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text(text,
        style: TextStyle(
              fontFamily: 'Atma',
              fontSize: MediaQuery.of(context).size.width*0.02375,
              color: Colors.black,
            ),
          
          ),
      ),
      );
    
  }
}
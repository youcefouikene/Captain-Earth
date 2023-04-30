import 'package:flutter/material.dart';

class Box6 extends StatelessWidget {
  final String text1;
  final String text2;
  final String title;
  final double pourcentage1;
  final double pourcentage2;
 

  Box6({
   required this.pourcentage1, required this.pourcentage2,required this.text1,required this.title,required this.text2
  });

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
    
      child:  Stack(  children: <Widget>[
    Positioned(
      top: MediaQuery.of(context).size.height * (15/360),
      left: MediaQuery.of(context).size.width* (120/800),
      child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Atma',
            fontSize: MediaQuery.of(context).size.width * (27/800),
            fontWeight: FontWeight.w700,
            color: Color(0xff134E49),
          ),
        ),
      ),
 
        Positioned(
      top: MediaQuery.of(context).size.height * (66/360),
      left: MediaQuery.of(context).size.width* (46/800),
      child: Container(
        width:MediaQuery.of(context).size.width* (430/800),
        height:MediaQuery.of(context).size.height* (80/360),
        child: Text(
            text1,
            style: TextStyle(
              fontFamily: 'Atma',
              fontSize: MediaQuery.of(context).size.width * (25/800),
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
      ),
      ),
            Positioned(
      top: MediaQuery.of(context).size.height * (149/360),
      left: MediaQuery.of(context).size.width* (215/800),
      child: Container(
        width:MediaQuery.of(context).size.width* (262/800),
        height:MediaQuery.of(context).size.height* (96/360),
        child: Text(
            text2,
            style: TextStyle(
              fontFamily: 'Atma',
              fontSize: MediaQuery.of(context).size.width * (25/800),
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
      ),
      ),
          Positioned(
      top: MediaQuery.of(context).size.height * (139/360),
      left: MediaQuery.of(context).size.width* (41/800),
      child:  Image.asset(
        "assets/images/defi/PickTrash.png",
        //height: MediaQuery.of(context).size.height * (192/360),
        //width: MediaQuery.of(context).size.width* (80/800),
        fit: BoxFit.cover,
      ),
      ),

     ],
    )
  );}
}


import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  final double width;
  final double height;
  final Color borderColor;
  final Color contextColor;

  final Color textColor;
  final String text;

   const Start({
    required this.width,
    required this.height,
    required this.borderColor,
    required this.contextColor,
    required this.textColor,
    required this.text,
   
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
       Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: contextColor,
        borderRadius: BorderRadius.circular(97),
        border: Border.all(
          color: borderColor,
          width: 3,
        ),
      ),
      
    ),
    Positioned(
      left: MediaQuery.of(context).size.width*(68/800),
      top: MediaQuery.of(context).size.height*(39/360),
     
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "Atma",
          fontWeight:FontWeight.w500,
          fontSize: MediaQuery.of(context).size.width*(26/800),
          color: textColor,
        ),
      ),

    
    ),
    
      
    ],);
  }
}
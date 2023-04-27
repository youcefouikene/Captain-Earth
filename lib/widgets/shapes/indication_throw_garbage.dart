import 'package:flutter/material.dart';

class IndicationThrowGarbage extends StatelessWidget {
  String choix;
  String plusOrMinus;
  Color currentColor = Colors.white;

  IndicationThrowGarbage({
    required this.choix,
    required this.plusOrMinus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    switch(choix){
      case "1" :
        currentColor = const Color.fromRGBO(198, 23, 23, 0.8);
        break;
      case "2" :
        currentColor = const Color.fromRGBO(25, 99, 206, 0.8);
        break;
      case "3" :
        currentColor = const Color.fromRGBO(22, 181, 60, 0.8);
        break;
      case "4" :
        currentColor = const Color.fromRGBO(255, 206, 0, 0.8);
        break;
    }

    return Text(
      (choix == "") ? '': (plusOrMinus == 'plus') ? '+1':'',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Atma',
        fontSize: 50,
        color: currentColor,
      ),
    );
  }
}
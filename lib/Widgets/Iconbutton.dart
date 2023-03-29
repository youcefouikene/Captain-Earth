import 'package:flutter/material.dart';

class Iconbutton extends StatelessWidget {
  Icon icon;
  final double pourcentage;
  final double pourcentageMargin;
  Iconbutton({required this.icon,required this.pourcentage,required this.pourcentageMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*pourcentageMargin), 
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          //margin: EdgeInsets.only(bottom: 12.0), 
          width: MediaQuery.of(context).size.width * pourcentage,
          height: MediaQuery.of(context).size.width * pourcentage,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFE84560),
            border: Border.all(
              color: Color(0xff752683),
              width: 2,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: icon,
          iconSize: MediaQuery.of(context).size.width * 0.03,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ],
    ));
  }
}

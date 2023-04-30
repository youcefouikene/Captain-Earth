import 'package:flutter/material.dart';
import '../RectangleButton.dart';
class boxWelcom extends StatelessWidget {
 
  final double pourcentage1;
  final double pourcentage2;
 

  boxWelcom({
   required this.pourcentage1, required this.pourcentage2
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
      bottom: MediaQuery.of(context).size.height * (57.64/360),
      left: MediaQuery.of(context).size.width* (88/800),
      right: MediaQuery.of(context).size.width* (88/800),
      child:  Image.asset(
        "assets/images/dechets/indicationTypeDechets.png",
        //height: MediaQuery.of(context).size.height * (192/360),
        //width: MediaQuery.of(context).size.width* (80/800),
        fit: BoxFit.cover,
      ),
      ),

     ],
    )
  );}
}


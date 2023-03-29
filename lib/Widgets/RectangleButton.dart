import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  final String text;
   final double pourcentage1;
   final double pourcentage2;
   final double pourcentage3;
   final double pourcentageFont;
   final double pourcentageRaduis; 
   
  RectangleButton({required this.text,required this.pourcentage1,required this.pourcentage2,required this.pourcentage3,required this.pourcentageFont,required this.pourcentageRaduis});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * pourcentage3),
      width: MediaQuery.of(context).size.width * pourcentage1,
      height: MediaQuery.of(context).size.height* pourcentage2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*pourcentageRaduis),
        border: Border.all(
          color:  Color(0xff7B2B85),
          width: 3,
        ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Atma',
              fontSize: MediaQuery.of(context).size.width*pourcentageFont,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*pourcentageRaduis),
          ),
          primary: Color(0xffE84560),
          onPrimary:  Colors.white,
        ),
      ),
    );
  }
}

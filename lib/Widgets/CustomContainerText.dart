import 'package:flutter/material.dart';

class CustomContainerText extends StatelessWidget {
  final Color colorTop;
  final Color colorBottom;
  final double widthContainer;
  final double heightContainer;
  final String texte;
  final Color colorText;

  const CustomContainerText({
    required this.colorTop,
    required this.colorBottom,
    required this.widthContainer,
    required this.heightContainer,
    required this.texte,
    required this.colorText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
       child: Stack(
        children: [
            Container(
                width: widthContainer,//200.0
                height: heightContainer,//75.0
                decoration: BoxDecoration(
                  borderRadius:const  BorderRadius.all(
                    Radius.circular(25.0),//25.0
                  ),
                   color:colorBottom,
                    ),
                     ),
              
            Container(
                width: widthContainer,//200.0
                height: heightContainer,//75.0
                decoration: BoxDecoration(
                  border: Border.all(color:const Color.fromRGBO(123, 43, 133, 1), width: 4.5,),
                  borderRadius:const BorderRadius.all(
                    Radius.circular(25.0),//25.0
                    ),
                     ),
                     ),
            Positioned(
              left: 50.0,
              top:13.0,
              child:Text(texte,
              style: TextStyle(
                  color: colorText,
                  fontFamily:"Atma" ,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  ),
                  ),
                   ),
                   ],
                   ),
                   );
  }
}

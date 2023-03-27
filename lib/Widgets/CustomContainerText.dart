import 'package:flutter/material.dart';
class CustomContainerText extends StatelessWidget {
  final Color colorTop;
  final double widthContainer;
  final double heightContainer;
  final String texte;
  final Color colorText;

  const CustomContainerText({

    required this.colorTop,
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
                width: widthContainer,
                height: heightContainer,
                decoration: BoxDecoration(
                  borderRadius:const  BorderRadius.all(
                    Radius.circular(15.0),//25.0
                  ),
                   color:colorTop,
                    ),
                     ),
              
           
            Container(
                width: widthContainer,//200.0
                height: heightContainer,//75.0
                decoration: BoxDecoration(
                  border: Border.all(color:const Color.fromRGBO(123, 43, 133, 1), width: 4.5,),
                  borderRadius:const BorderRadius.all(
                    Radius.circular(15.0),
                    ),
                     ),
                     child: Center(child: Text(
                      texte,
                     style: TextStyle(
                      color: colorText,
                     fontFamily:"Atma" ,
                     fontSize: 24.0,
                     fontWeight: FontWeight.w600,
                      ),
                   ),),
                     ),
                   ],
                   ),
                   );
  }
}

import 'package:flutter/material.dart';
class CustomContainer extends StatelessWidget {
  final Color colorTop;
  final Color colorBottom;
  final double widthContainer;
  final double heightContainer;
  final IconData icon;

  const CustomContainer({
    required this.colorTop,
    required this.colorBottom,
    required this.widthContainer,
    required this.heightContainer,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
            children: [
             Container(
                width: widthContainer,
                height: heightContainer,
                decoration: BoxDecoration(
                   borderRadius:const BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                   color:colorBottom,
                   ),
                   ),

             Container(
                width:widthContainer,
                height: heightContainer,
                decoration: BoxDecoration(
                  border: Border.all(color:const Color.fromRGBO(123, 43, 133, 1), width: 4.5,),
                   borderRadius:const BorderRadius.all(
                     Radius.circular(25.0),
                     ),
                     ),
                     ),
              Positioned(
                 left: 15.0,
                 top:15.0,
                child:Icon(icon,color: Colors.white),
                ),
                 ],
                  ),
                  );
  }
}

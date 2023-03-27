import 'package:flutter/material.dart';

class BoxInfo extends StatelessWidget {
  final Color bordercolor;
  final Color contentcolor;
  final Widget element;

  const BoxInfo({
   required this.bordercolor,
   required this.contentcolor,
   required this.element,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;

    return Container(
      width:w*(211/800) ,
      height: h*(45/360),
      decoration: BoxDecoration(
        color: contentcolor,
         borderRadius: BorderRadius.circular(w*(14/800)),
        border: Border.all(
            color:bordercolor,
            width: 3,
          ),
      ),
      child: element,
    );
  }
}
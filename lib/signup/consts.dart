import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pommy/constants.dart';

InputDecoration inputDecorator(String hinter) {
  return InputDecoration(
    hintText: hinter,
    hintStyle: TextStyle(
      color: Colors.grey,
      fontSize: 17.0,
    ),
    filled: true,
    fillColor: white,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: themeClr),
      borderRadius: BorderRadius.circular(30.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: themeClr),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: themeClr),
      borderRadius: BorderRadius.circular(30.0),
    ),
  );
}

class Steps extends StatelessWidget {
  final int step;
  Steps({required this.step});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        2,
        (index) => Container(
          height: 15.0,
          width: 15.0,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index <= step ? themeClr : Colors.grey,
          ),
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final String? label;
  final Function? toDo;
  NavButton({this.label, this.toDo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Text(
            label!,
            style: TextStyle(color: themeClr, fontSize: 20.0),
          ),
        if (label != null) SizedBox(width: 12.0),
        Container(
          height: 45.0,
          width: 45.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 4.0, color: themeClr),
            boxShadow: bxShdA,
            color: white,
          ),
          child: InkWell(
            onTap: () {
              if (toDo != null) toDo!();
            },
            child: Transform.rotate(
              angle: label == 'Next' || label == 'Suivant' ? 0 : pi,
              child: SvgPicture.asset(
                'assets/icons/goto.svg',
                color: themeClr,
                height: 15,
                width: 15,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

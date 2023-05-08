import 'dart:async';

import 'package:flutter/material.dart';

class AfricaAnimal extends StatefulWidget {
  bool isCorrect;
  final String name;
  final String image;
  bool pressed;
  double width;
  Function(bool, bool, String) callback;
  Function(bool) callback1;
  Function() click;
  // final Function() answer;
  AfricaAnimal({
    required this.isCorrect,
    required this.name,
    required this.image,
    required this.callback,
    required this.pressed,
    required this.callback1,
    required this.width,
    required this.click,
  });

  @override
  State<AfricaAnimal> createState() => _AfricaAnimalState();
}

class _AfricaAnimalState extends State<AfricaAnimal> {
  Color _buttonColor = Color.fromARGB(255, 255, 243, 210);
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    if (widget.pressed) {
      isPressed = false;
    }

    return Container(
      height: MediaQuery.of(context).size.height * (89 / 360),
      width: MediaQuery.of(context).size.width * (96 / 800),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width * (8 / 800)),
          border: Border.all(
            color: Color(0xff727271),
            width: 1,
          )),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * (8 / 800)),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            isPressed
                ? widget.isCorrect
                    ? Color(0xffD2FFDF)
                    : Color(0xffFFB2B2)
                : Color.fromARGB(255, 255, 243, 210),
          ),
        ),
        onPressed: () {
          setState(() {
            isPressed = true;
          });
          widget.callback(isPressed, widget.isCorrect, widget.name);
          widget.callback1(false);
          widget.click();
        },
        child: FractionallySizedBox(
          widthFactor: (widget.image == 'assets/images/afrique/dog.png')
              ? 0.65
              : (widget.image == 'assets/images/afrique/gazelle.png')
                  ? 0.8
                  : 1,
          child: Image.asset(
            widget.image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

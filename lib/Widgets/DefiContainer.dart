import 'package:flutter/material.dart';

class DefiConatainer extends StatelessWidget {
  String pathImage;
  Function() onPressed;
  DefiConatainer({required this.pathImage, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return Container(
      width: w * 120 / 800,
      height: h * 74 / 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * (21 / 800)),
        color: const Color(0xffFFFDD3),
        border: Border.all(
          color: const Color.fromRGBO(19, 78, 73, 1),
          width: 3,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Image.asset(pathImage),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * (21 / 800)),
          ),
          primary: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}

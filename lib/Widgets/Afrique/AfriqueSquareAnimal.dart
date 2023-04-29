import 'package:flutter/material.dart';

class AfricaSquareAnimal extends StatelessWidget {
  final bool isImage;
  final String image;
  AfricaSquareAnimal({required this.isImage, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (210 / 800),
      height: MediaQuery.of(context).size.height * (160 / 360),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isImage ? Color(0xffffffff) : Color(0xffD9D9D9),
      ),
      child: isImage
          ? FractionallySizedBox(
              widthFactor: 0.8,
              //heightFactor: 1,
              child: Image.asset(
                image,
                //width: MediaQuery.of(context).size.width*(180/800),
                //height:  MediaQuery.of(context).size.height*(115/800),
                fit: BoxFit.contain,
              ),
            )
          : FractionallySizedBox(
              widthFactor: 0.5,
              child: Container(
                //height: MediaQuery.of(context).size.width*(81/800),
                //width: MediaQuery.of(context).size.width*(81/800),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF8C8989),
                ),
                child: Icon(Icons.question_mark_rounded,
                    color: Color(0xffD9D9D9),
                    size: MediaQuery.of(context).size.width * (81 / 800)),
              ),
            ),
    );
  }
}

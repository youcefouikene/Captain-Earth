import 'package:flutter/material.dart';


class AvatarContainer extends StatelessWidget {
  double shapeWidth;
  double shapeHeight;
  String imagePath;

  AvatarContainer({required this.shapeWidth, required this.shapeHeight, required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // handle button press event here
        },
        child: Container(
          width: shapeWidth,
          height: shapeHeight,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(217, 217, 217, 1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(shapeWidth/2), // set half of the width/height to make it circular
            child: const Center(
              child: Text('Avatar'),
            ),
          ),
        ),
      );
  }
}



/*
Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
 */
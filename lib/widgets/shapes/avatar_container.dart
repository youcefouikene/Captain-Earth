import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AvatarContainer extends StatelessWidget {
  double shapeWidth;
  double shapeHeight;
  int avatarNumber;

  AvatarContainer({required this.shapeWidth, required this.shapeHeight, required this.avatarNumber, Key? key}) : super(key: key);

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
            child: Center(
              child: Image.asset(
                'assets/player_avatars/avatar$avatarNumber.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
  }
}
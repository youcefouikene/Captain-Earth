import 'package:flutter/material.dart';

class PointBar extends StatelessWidget {
  late int score;

  PointBar({required this.score});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Stack(
          alignment: Alignment(0.4, -0.5),
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.0859444,
              width: MediaQuery.of(context).size.width * 0.146425,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(36.5),
                border: Border.all(
                  color: const Color(0xff752683),
                  width: 3,
                ),
              ),
            ),
            //padding: EdgeInsets.all(10),
            Text(
              score.toString(),
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Atma',
                fontWeight: FontWeight.w500,
                fontSize: MediaQuery.of(context).size.width * 0.025,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.1277777,
          width: MediaQuery.of(context).size.height * 0.1277777,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xff752683),
              width: 3,
            ),
          ),
          child: const Image(
            image: AssetImage('assets/images/leaf.png'),
            //width: 10,
          ),
        ),
      ],
    );
  }
}

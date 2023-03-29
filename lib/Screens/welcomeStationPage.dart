import 'package:flutter/material.dart';
import '../Widgets/WelcomeTextBox.dart';

class WelcomePage extends StatelessWidget {

  final String background;
  final String avatar;
  final String text;
  final String description;
  final double pourcentage1;
  final double pourcentage2;
  final double pourcentage3;
  final double pourcentageFont;
  final double pourcentageAvatar;
  final String textButton;

  WelcomePage(
      {required this.background,
      required this.avatar,
      required this.text,
      required this.description,
      required this.pourcentage1,
      required this.pourcentage2,
      required this.pourcentage3,
      required this.pourcentageAvatar,
      required this.pourcentageFont,
      required this.textButton
    });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(background),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
              Container(
                width: MediaQuery.of(context).size.width * 2 / 3,
                child: WelcomeTextBox(
                    text: text,
                    description: description,
                    pourcentage1: pourcentage1,
                    pourcentage2: pourcentage2,
                    pourcentage3: pourcentage3,
                    pourcentageFont: pourcentageFont,
                    textButton: textButton),
              ),
              Container(
                width: MediaQuery.of(context).size.width * pourcentageAvatar,
                child: Image.asset(
                  avatar,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ])),
      ],
    );
  }
}

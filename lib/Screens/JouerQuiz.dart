import 'package:flutter/material.dart';

class JouerQuiz extends StatelessWidget {
  const JouerQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(" QUIZ "),),
      body:Container(
        child:Center(
          child:const Text(" Readt to paly quiz !!!!!!"),

        ),
      )
    );;
  }
}
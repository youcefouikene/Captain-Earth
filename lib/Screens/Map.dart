import 'package:flutter/material.dart';

class Map extends StatelessWidget {
  const Map({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MAP"),),
      body:Container(
        child:Center(
          child:const Text("hello i am the map"),

        ),
      )
    );
  }
}
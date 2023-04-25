import 'package:flutter/material.dart';

class Map extends StatelessWidget {
  const Map({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("MAP"),),
      body:const Center(
          child:Text("hello i am the map"),
          )
    );
  }
}
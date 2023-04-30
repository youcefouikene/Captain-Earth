import 'package:flutter/material.dart';
import 'package:flutter_sparkle/flutter_sparkle.dart';
import 'package:particles_flutter/particles_flutter.dart';

class Garbage extends StatefulWidget {
  final String garbageImage;
  final String animalImage;
  final Function() callback;
  Garbage(
      {required this.garbageImage,
      required this.animalImage,
      required this.callback});

  @override
  State<Garbage> createState() => _GarbageState();
}

class _GarbageState extends State<Garbage> {
  bool _imageVisible = true;
  //bool _isSparkling =false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image(
          image: AssetImage(widget.animalImage),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _imageVisible = false;
            });
            widget.callback();
          },
          child: AnimatedOpacity(
            opacity: _imageVisible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: Image(
              image: AssetImage(widget.garbageImage),
            ),
          ),
        ),
      ],
    );
  }
}

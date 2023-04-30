import 'package:flutter/material.dart';

class fire extends StatefulWidget {
  final String fireImage;
  final Function() callback;
  fire({required this.fireImage, required this.callback});

  @override
  State<fire> createState() => _fireState();
}

class _fireState extends State<fire> {
  bool _imageVisible = true;
  //bool _isSparkling =false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          image: AssetImage(widget.fireImage),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import '../../EndGamePage.dart';

class TimeFlip extends StatefulWidget {
  TimeFlip(
      {required this.ignore,
      required this.background,
      required this.station,
      required this.refreshPath});
  String station;
  String background;
  bool ignore;
  String refreshPath;
  @override
  _TimeFlip createState() => _TimeFlip();
}

class _TimeFlip extends State<TimeFlip> {
  int _secondsElapsed = 90;
  Color _backgroundColor = Colors.white;

  void _startTimer() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _secondsElapsed--;
      });
      print(widget.ignore);
      if ((_secondsElapsed == 0) || (widget.ignore == true)) {
        print(_secondsElapsed);
        timer.cancel();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => EndGamePage(
                background: widget.background,
                score: _secondsElapsed,
                stars: (_secondsElapsed == 0) ? 0 : _secondsElapsed ~/ 30 + 1,
                station: widget.station,
                refreshPath: widget.refreshPath,
              ),
            ));
      }
    });
  }

  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.0859444,
            width: MediaQuery.of(context).size.width * 0.146425,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(36.5),
              border: Border.all(
                color: Color(0xffE84560),
                width: 3,
              ),
            ),
            //padding: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05),
              child: Text(
                '$_secondsElapsed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Atma',
                  fontSize: MediaQuery.of(context).size.width * 0.025,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1277777,
            width: MediaQuery.of(context).size.height * 0.1277777,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xffE84560),
                width: 3,
              ),
            ),
            child: Image.asset('assets/images/oceanie/timer.png'),
          ),
        ],
      ),
    );
  }
}

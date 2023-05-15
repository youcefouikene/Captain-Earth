import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projet_2cp/progress/progress.dart';
import '../../../Screens/EndGamePage.dart';
import 'package:projet_2cp/backend/progress_controllers.dart';
import 'package:projet_2cp/constants.dart';

class TimeAsie extends StatefulWidget {
  int stationIndex;
  String station;
  String background;
  bool ignore;
  String refreshPath;
  TimeAsie(
      {required this.stationIndex,
      required this.ignore,
      required this.background,
      required this.station,
      required this.refreshPath});
  @override
  _TimeAsie createState() => _TimeAsie();
}

class _TimeAsie extends State<TimeAsie> {
  int _secondsElapsed = 120;
  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _secondsElapsed--;
      });
      if ((_secondsElapsed == 0) || (widget.ignore == true)) {
        if (widget.stationIndex == 0) {
          backgroundPlayerOceanie.stopMusic();
        } else if (widget.stationIndex == 5) {
          backgroundPlayerAmeriqueSud.stopMusic();
        }
        timer.cancel();
        dataUpdator(
            context,
            userProgress.stations[widget.stationIndex],
            userProgress.stations[widget.stationIndex].games[1],
            _secondsElapsed ~/ 4,
            (_secondsElapsed == 0) ? 0 : _secondsElapsed ~/ 40 + 1);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => EndGamePage(
                score: _secondsElapsed ~/ 4,
                stars: (_secondsElapsed == 0) ? 0 : _secondsElapsed ~/ 40 + 1,
                stationIndex: widget.stationIndex,
                background: widget.background,
                station: widget.station,
                refreshPath: widget.refreshPath,
              ),
            ));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  int getSecond() {
    return _secondsElapsed;
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
                color: const Color(0xffE84560),
                width: 3,
              ),
            ),
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
                  color: const Color.fromARGB(255, 0, 0, 0),
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
                color: const Color(0xffE84560),
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

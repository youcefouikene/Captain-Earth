import 'dart:async';
import 'package:flutter/material.dart';
import '../../EndGamePage.dart';
import 'package:projet_2cp/backend/progress_controllers.dart';
import 'package:projet_2cp/constants.dart';
import 'package:projet_2cp/progress/progress.dart';

class TimeFlipAsie extends StatefulWidget {
  String station;
  String background;
  bool ignore;
  String refreshPath;
  TimeFlipAsie(this.station, this.background, this.ignore, this.refreshPath,
      {super.key});

  @override
  _TimeFlipAsie createState() => _TimeFlipAsie();
}

class _TimeFlipAsie extends State<TimeFlipAsie> {
  final StationProgress stationProgress = userProgress.stations[1];
  final GameProgress gameProgress = userProgress.stations[1].games[1];

  int _secondsElapsed = 90;
  Color backgroundColor = Colors.white;

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _secondsElapsed--;
      });
      if ((_secondsElapsed == 0) || (widget.ignore == true)) {
        backgroundPlayerAsie.stopMusic();
        timer.cancel();
        dataUpdator(
            context,
            stationProgress,
            gameProgress,
            _secondsElapsed ~/ 3,
            (_secondsElapsed == 0) ? 0 : _secondsElapsed ~/ 30 + 1);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => EndGamePage(
                stars: (_secondsElapsed == 0) ? 0 : _secondsElapsed ~/ 30 + 1,
                score: _secondsElapsed,
                background: widget.background,
                stationIndex: stationProgress.stationIndex,
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
                color: const Color(0xffE84560),
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

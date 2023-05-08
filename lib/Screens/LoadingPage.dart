import 'package:flutter/material.dart';
import 'dart:async';

import 'package:projet_2cp/widgets.dart';

class LoadingPage extends StatelessWidget {
  LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(158, 231, 251, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/avatar/logo.png',
            width: 0.281275 * MediaQuery.of(context).size.width,
            height: 0.4943 * MediaQuery.of(context).size.height,
          ),
          SizedBox(height: (5 * MediaQuery.of(context).size.height) / 1000),
          const Text(
            'Captain Earth',
            style: TextStyle(
                color: Color.fromRGBO(19, 78, 73, 1),
                fontFamily: 'Atma',
                fontSize: 33,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: (14 * MediaQuery.of(context).size.height) / 1000),
          const LinearProgressIndicatorDemo(),
        ],
      ),
    );
  }
}

class LinearProgressIndicatorDemo extends StatefulWidget {
  const LinearProgressIndicatorDemo({super.key});

  @override
  State<LinearProgressIndicatorDemo> createState() =>
      _LinearProgressIndicatorDemoState();
}

class _LinearProgressIndicatorDemoState
    extends State<LinearProgressIndicatorDemo> {
  double _progress = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        if (_progress == 0.0) {
          _progress += 0.15;
        } else if (_progress == 0.15) {
          _progress += 0.35;
        } else if (_progress == 0.5) {
          _progress += 0.25;
        } else if (_progress == 0.75) {
          _progress += 0.25;
        } else {
          _timer?.cancel();
          _timer = null;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => WelcomePage1()));
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        width: 405,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          border:
              Border.all(color: const Color.fromRGBO(0, 114, 106, 1), width: 4),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: LinearProgressIndicator(
            value: _progress,
            valueColor: const AlwaysStoppedAnimation<Color>(
                Color.fromRGBO(111, 234, 211, 0.9)),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  static const routeName = '/welcome-page';

  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Welcome Page')),
    );
  }
}
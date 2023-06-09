import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Center(
        child: Text(user.email!),
      ),
    );
  }
}

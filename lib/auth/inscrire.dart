import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_2cp/Screens/AcquisitionPage.dart';
import 'package:projet_2cp/Screens/LoadingPage.dart';
import 'package:projet_2cp/Screens/Profil/AjouterProfilPage.dart';
import 'package:projet_2cp/Screens/test.dart';
import 'package:projet_2cp/Screens/welcomeStationPage.dart';
import 'dart:developer';

import 'package:projet_2cp/try.dart';

import '../Screens/WelcomePage.dart';

class Inscrire extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ( context,  snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              print('youcef');
              return test();
              /*User user = FirebaseAuth.instance.currentUser!;
              bool decide = true;
              UserInfos? ma;
              return FutureBuilder<UserInfos?>(
              future: checkExistence(user.email!),
              builder: (BuildContext context, AsyncSnapshot<UserInfos?> snap){
                print(snap);
                if (snap.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
              } else {
                if (snap.data != null){
                  decide = false;
                  return Accueil();
                }
                else{
                  return UserName();
                }
              }
              });*/
            } else if (snapshot.hasError) {
              return Center(child: Text('Oups, something went Wrong !'));
            } else {
              print('ouikene');
              return WelcomePage1();
            }
            
          },
        ),
      );
}

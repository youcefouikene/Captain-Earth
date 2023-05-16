import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_2cp/backend/progress_controllers.dart';
import 'package:projet_2cp/data/initializedThemes.dart';


class OnlineProgress {
  static final db = FirebaseFirestore.instance;

  // **** Sign IN ****
  static Future<UserCredential?> signInWithGooglee() async {
    //!Signing In with google
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // **** Sign OUT ****
  static void signOutWithGooglee() {
    //!Sign Out
    FirebaseAuth.instance.signOut();
  }




}

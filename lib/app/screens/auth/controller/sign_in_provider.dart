import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_zartek/app/screens/auth/view/login.dart';
import 'package:task_zartek/app/screens/home/view/user_home.dart';

class SignInProvider extends ChangeNotifier {
  final _googleSignIn = GoogleSignIn();
  final user = FirebaseAuth.instance.currentUser;
  bool isLoading = false;
  Future<UserCredential?> googleSignIn() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      isLoading = true;
      notifyListeners();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await _googleSignIn.signOut();
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    log('got it yaaaaaaaaaaaaa');
    return null;
  }

  signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then(
      (value) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
      },
    );
    notifyListeners();
  }

  validatioin(BuildContext context) {
    googleSignIn().then(
      (value) {
        isLoading = false;
        notifyListeners();
        value != null
            ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const Home(),
              ))
            : log(value.toString());
      },
    );
    notifyListeners();
  }
}

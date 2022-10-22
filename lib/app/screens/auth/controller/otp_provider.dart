import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_zartek/app/screens/home/view/user_home.dart';

class OtpController extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  String verificationIdRecived = '';

  void verifyNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            log("logged in successffully");
            phoneController.clear();
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          log(exception.message.toString());
        },
        codeSent: (String verificatiionId, int? resendToken) {
          verificationIdRecived = verificatiionId;
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  void verifyCode(BuildContext context) {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIdRecived, smsCode: otpController.text);
    auth.signInWithCredential(credential).then((value) {
      log("your logged in succffully !!");
      otpController.clear();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Home(),
      ));
    });
  }
}

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_zartek/app/screens/home/view/user_home.dart';

import '../view/otp_varification_screen.dart';

class OtpController extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  String verificationIdRecived = '';
  final formkey = GlobalKey<FormState>();

  void verifyNumber(BuildContext context) {
    final phoneNum = '+91 ${phoneController.text}';
    if (formkey.currentState!.validate()) {
      auth
          .verifyPhoneNumber(
              phoneNumber:  phoneNum,
              verificationCompleted: (PhoneAuthCredential credential) async {
                await auth.signInWithCredential(credential).then((value) {
                 
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
              codeAutoRetrievalTimeout: (String verificationId) {})
          .then(
            (value) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const OtpVerificationScreen(),
              ),
            ),
          );
    }
  }

  void verifyCode(BuildContext context) {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIdRecived, smsCode: otpController.text);
    auth.signInWithCredential(credential).then((value) {
  
      otpController.clear();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Home(),
      ));
    });
  }

  String? formValidation(String? value) {
    if (value == null || value.isEmpty || value.length < 10) {
      return 'Enter a valid number';
    }
    return null;
  }
}

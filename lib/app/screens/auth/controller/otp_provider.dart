import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_zartek/app/screens/home/view/user_home.dart';
import 'package:task_zartek/app/utils/utils.dart';

import '../view/otp_varification_screen.dart';

class OtpController extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  String verificationIdRecived = '';
  final formkey = GlobalKey<FormState>();
  bool isLoading = false;

  void verifyNumber(BuildContext context) {
    
    final phoneNum = '+91 ${phoneController.text}';
   
    if (formkey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      auth.verifyPhoneNumber(
          phoneNumber: phoneNum,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential).then((value) {
              
            });
          },
          verificationFailed: (FirebaseAuthException exception) {
            Utils.showSnackbar(context: context, msg: "Something went wrong! try again",);
            phoneController.clear();
            isLoading = false;
            notifyListeners();
            log(exception.message.toString());
          },
          codeSent: (String verificatiionId, int? resendToken) {
            log('.........$verificatiionId');
            verificationIdRecived = verificatiionId;
            isLoading = false;
            notifyListeners();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const OtpVerificationScreen(),
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
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
    if ( value == null || value.isEmpty || value.length !=10) {
      return 'Enter a valid number';
    }
    return null;
  }
}

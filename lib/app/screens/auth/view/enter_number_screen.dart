import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_zartek/app/const/constant.dart';
import 'package:task_zartek/app/screens/auth/controller/otp_provider.dart';
import 'package:task_zartek/app/screens/auth/view/otp_varification_screen.dart';

class NumberEnterScreen extends StatelessWidget {
  const NumberEnterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/otp.webp"),
              const Text(
                "Registration",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: kdefaultPadding / 2),
                child: Text(
                  "Add your phone number. we'll send you a verification code \n so we know you're real",
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: context.read<OtpController>().phoneController,
                          decoration: const InputDecoration(
                              hintText: "Enter phone number here",
                              border:  OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.deepPurpleAccent),
                                onPressed: () {
                                  context.read<OtpController>().verifyNumber();
                                  Navigator.of(context).push(MaterialPageRoute(builder:(context) =>const  OtpVerificationScreen(),));
                                },
                                child: const Text(
                                  "Send",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

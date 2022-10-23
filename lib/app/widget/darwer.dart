import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_zartek/app/screens/auth/controller/sign_in_provider.dart';

import '../const/constant.dart';

class MyDarawer extends StatelessWidget {
  const MyDarawer({Key? key, required this.size}) : super(key: key);
final Size size;
  @override
  Widget build(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser;
    return ListView(
          children: [
            Container(
              height: size.height * .3,
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: DrawerHeader(
                  child: Consumer<SignInProvider>(
                builder: (context, value, child) => Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: user?.photoURL !=
                                null
                            ? Image.network(
                                user?.photoURL ??
                                    '')
                            : const CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 60,
                              )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kdefaultPadding / 2),
                      child: Text(
                        user?.displayName ??
                            user?.phoneNumber
                                .toString() ??
                            '',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "ID : ${user?.uid}",
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ),
            ListTile(
              onTap: () =>  context.read<SignInProvider>().signOut(context),
              leading: const Icon(
                Icons.logout,
                size: 30,
              ),
              title: const Text(
                'Log Out',
                style: TextStyle(fontSize: 22, color: kTextLightColor),
              ),
            )
          ],
        );
  }
}
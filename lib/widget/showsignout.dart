
// ignore_for_file: file_names

import 'package:demosafespace/utility/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignOut extends StatefulWidget {
  const SignOut({ Key? key }) : super(key: key);

  @override
  State<SignOut> createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  @override
  Widget build(BuildContext context) {
     double size = MediaQuery.of(context).size.width;
   return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50),
              width: size * 0.6,
              child: ElevatedButton(
                  style: Constant().ourButton(),
                  onPressed: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    preferences.clear().then(
                          (value) => Navigator.pushNamedAndRemoveUntil(
                              context,
                              Constant.routeWelcome,
                              (route) => false),
                        );
                  },
                  child: Text(
                    'Sign out',
                    style: Constant().h4Style(),
                  )),
            ),
          ],
   );
  }
}
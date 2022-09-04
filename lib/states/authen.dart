// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, sized_box_for_whitespace

import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool statusRedEye = true;
  get childen => null;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            buildBGWelcome(),
            buildFrameWel(),
            buildParking(),
            buildPassword(size),
            Container(
              child: Positioned(
                top: 80,
                right: 40,
                left: 40,
                child: Text(
                  "WelCome Back!",
                  style: Constant().h1Style(),
                ),
              ),
            ),
            Container(
              child: Positioned(
                top: 110,
                right: 40,
                left: 40,
                child: Text(
                  "Sign In to your account",
                  style: Constant().hStyle(),
                ),
              ),
            ),
            buildUser(size),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 530,
                    left: 90,
                    right: 80,
                  ),
                  width: size * 0.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Sign in'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildUser(double size) {
    return Container(
      margin: EdgeInsets.only(
        top: 380,
        left: 80,
        right: 80,
      ),
      width: size * 0.6,
      child: TextFormField(
        decoration: InputDecoration(
          labelStyle: Constant().h6Style(),
          labelText: 'E-mail :',
          prefixIcon: Icon(
            Icons.account_circle_outlined,
            color: Constant.colorF,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Constant.colorF),
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Constant.colorF),
          ),
        ),
      ),
    );
  }

  Container buildPassword(double size) {
    return Container(
      margin: EdgeInsets.only(
        top: 450,
        left: 80,
        right: 80,
      ),
      width: size * 0.6,
      child: TextFormField(
        obscureText: statusRedEye,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                statusRedEye = !statusRedEye;
              });
            },
            icon: statusRedEye
                ? Icon(Icons.remove_red_eye, color: Constant.colorF)
                : Icon(
                    Icons.remove_red_eye_outlined,
                    color: Constant.colorF,
                  ),
          ),
          labelStyle: Constant().h6Style(),
          labelText: 'Password :',
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Constant.colorF,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Constant.colorF),
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Constant.colorF),
          ),
        ),
      ),
    );
  }

  Container buildParking() {
    return Container(
      child: Positioned(
        top: 150,
        left: 60,
        right: 60,
        child: ShowImage(path: Constant.asset6),
      ),
    );
  }

  Positioned buildFrameWel() {
    return Positioned(
        top: 340,
        right: 0,
        left: 0,
        child: Image.asset(
          Constant.asset4,
        ));
  }

  Image buildBGWelcome() {
    return Image.asset(
      Constant.asset2,
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

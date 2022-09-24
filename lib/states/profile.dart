// ignore_for_file: prefer_const_constructors

import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.yello,
      body: SafeArea(
          child: Stack(
        children: [
          makeHeadingname(),
          makeline(),
          iconcontact(context),
          iconsPro(context),
          iconeHome(context),
        ],
      )),
    );
  }

  Padding iconeHome(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 560, left: 50),
      child: IconButton(
        onPressed: () => Navigator.pushNamed(context, Constant.routeHome),
        icon: Icon(
          Icons.home_rounded,
          size: 60,
        ),
      ),
    );
  }

  Padding iconsPro(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 560, left: 170),
      child: IconButton(
        onPressed: () => Navigator.pushNamed(context, Constant.routeProfile),
        icon: Icon(
          Icons.account_circle,
          size: 60,
        ),
      ),
    );
  }

  Padding iconcontact(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 560, left: 290),
      child: IconButton(
        onPressed: () => Navigator.pushNamed(context, Constant.routeAboutus),
        icon: Icon(
          Icons.support_agent,
          size: 60,
        ),
      ),
    );
  }

  Row makeline() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 100),
          child: ShowImage(path: Constant.asset7),
        ),
      ],
    );
  }

  Row makeHeadingname() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 50),
          child: Text(
            "S  a  f  e  S  p  a  c  e",
            style: Constant().hhStyle(),
          ),
        ),
      ],
    );
  }
}

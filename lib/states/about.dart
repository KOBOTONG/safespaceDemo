// ignore_for_file: prefer_const_constructors

import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:flutter/material.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.yello,
      body: SafeArea(
          child: Stack(
        children: [
          makeHeading(),
          makeLine(),
          iconHome(context),
          iconProfile(context),
          iconAboutus(context),
           Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 140, left: 0),
          child: Text(
            "Contact Us",
            style: Constant().hBookingStyle(),
          ),
        ),
        
      ],
    ), Padding(
                padding: const EdgeInsets.only(top: 160, left: 40),
                child: ShowImage(path: Constant.assetCalen),
              ),
              Container(
          padding: EdgeInsets.only(top: 230, left: 200),
          child: Text(
            "Safespace Page",
            style: Constant().hBookingStyle(),
          ),
        ),
        ],
      )),
    );
  }

  Row makeLine() {
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

  Padding iconAboutus(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 570, left: 290),
      child: IconButton(
        onPressed: () => Navigator.pushNamed(context, Constant.routeAboutus),
        icon: Icon(
          Icons.support_agent,
          size: 60,
        ),
      ),
    );
  }

  Padding iconProfile(BuildContext context) {
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

  Padding iconHome(BuildContext context) {
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

  Row makeHeading() {
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

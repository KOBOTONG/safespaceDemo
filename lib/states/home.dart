import 'package:demosafespace/bking.dart';
import 'package:flutter/material.dart';
import 'package:demosafespace/states/home.dart';
import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:lottie/lottie.dart';

import '../mbking.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.yello,
      body: SafeArea(
        child: Stack(
          children: [
            makeHeader(),
            makeLine(),
            makeCrop(),
            makeTextdata(),
            makebuttonBooking(),
            makebuttonMybooking(),
            makeHome(context),
            makeProfile(context),
            makeAboutus(context),
          ],
        ),
      ),
    );
  }

  Padding makeHome(BuildContext context) {
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

  Padding makeProfile(BuildContext context) {
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

  Padding makeAboutus(BuildContext context) {
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

  Padding makebuttonMybooking() {
    return Padding(
      padding: EdgeInsets.only(left: 170),
      child: Container(
        padding: EdgeInsets.only(top: 270, bottom: 250),
        child: ListView.builder(
            itemCount: 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MBking(mbookTitle: 'My Booking');
            }),
      ),
    );
  }

  Container makebuttonBooking() {
    return Container(
      padding: EdgeInsets.only(top: 270, bottom: 250),
      child: ListView.builder(
          itemCount: 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Bking(bookTitle: 'Booking');
          }),
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

  Row makeTextdata() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 180),
          child: ShowImage(path: Constant.asset9),
        ),
      ],
    );
  }

  Row makeCrop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 140),
          child: ShowImage(path: Constant.asset8),
        ),
      ],
    );
  }

  Row makeHeader() {
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

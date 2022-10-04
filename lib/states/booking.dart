// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';


import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/widget/show_image.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.yello,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              header(),
              line(),
              titletext(),
              imgcar(),
          
            ],
          ),
        ),
      ),
    );
  }

  Row imgcar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 160),
          child: ShowImage(path: Constant.assetCalen),
        ),
      ],
    );
  }

  Row titletext() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 130),
          child: Text(
            "Book  for Parking",
            style: Constant().hBookingStyle(),
          ),
        ),
      ],
    );
  }

  Row line() {
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

  Row header() {
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

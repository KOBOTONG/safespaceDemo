import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:flutter/material.dart';

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 125,left: 100),
                child: ShowImage(path: Constant.asset10),
              ),
            ],
          );
  }

  Row titletext() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 130,left: 60),
                  child: Text(
                    "Booking for Parking",
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

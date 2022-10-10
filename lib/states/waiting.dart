import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Waiting extends StatefulWidget {
  const Waiting({Key? key}) : super(key: key);

  @override
  State<Waiting> createState() => _WaitingState();
}

class _WaitingState extends State<Waiting> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constant.yello,
      body: SafeArea(
        child: Stack(
          children: [
            Row(
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 100),
                  child: ShowImage(path: Constant.asset7),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 150),
                  width: size * 0.7,
                  child: Lottie.network(
                      'https://assets8.lottiefiles.com/packages/lf20_kacioavj.json'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 450, left: 30),
                  child: Text(
                    " กรุณา 1-3 วันเพื่อทำการตรวจสอบการจอง",
                    style: Constant().hthaititleStyle(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 480, left: 30),
                  child: Text(
                    " ลูกค้าสามารถตรวจสอบได้ที่ My Booking",
                    style: Constant().hthaititleStyle(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                   padding: EdgeInsets.only(top: 550),
                  width: size * 0.5,
                  child: ElevatedButton(
                    style: Constant().ourButton(),
                    onPressed: () {
                      Navigator.pushNamed(context, Constant.routeHome);
                    },
                    child: Text(
                      'Confirm',
                      style: Constant().h4Style(),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

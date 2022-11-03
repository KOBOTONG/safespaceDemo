// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/widget/show_image.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}
/* Container(
              padding: EdgeInsets.only(top: 100),
              child: Lottie.network('https://assets1.lottiefiles.com/packages/lf20_xsrtzvyq.json'),
            ),*/
class _WelcomeState extends State<Welcome> {
  late double screenWidth, screenHeigth;
  final style = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          buildBG(),
          Positioned(
            top: 75,
            left: 75,
            right: 75,
            child: buildLogo(),
          ),
          Positioned(
            top: 300,
            child: Column(
              children: [
                buildFrame(),
              ],
            ),
          ),
          Container(
              child: Positioned(
            top: 250,
            right: 75,
            left: 125,
            child: Text(
              "S a f e S p a c e",
              style: Constant().h1Style(),
            ),
          )),
          Container(
              child: Positioned(
            top: 350,
            right: 25,
            left: 25,
            child: Text(
              "Welcome!",
              style: Constant().h4Style(),
            ),
          )),
          Container(
            child: Positioned(
              top: 400,
              right: 30,
              left: 40,
              child: Text("ลานจอดรถ Interchange 21  บริการจองที่จอดรถล่วงหน้ารายเดือน โดยบริษัท Nippon Parking Development Thailand Co.,Ltd.",
                //"An application for booking parking near the airport for short trips by SafeSpace CO.,LTD.",
                style: Constant().h6Style(),
              ),
            ),
          ),
          buildRegister(),
          buildSingIn(context),
        ],
      )),
    );
  }

  Container buildSingIn(BuildContext context) {
    return Container(margin: EdgeInsets.only(
      top: 550,
      left: 210,
    ),
    width: screenWidth * 0.4,
    //height: screenHeigth * 0.1,
    child: ElevatedButton(
      style: Constant().ligthButton(),
      onPressed: () =>Navigator.pushNamed(context, Constant.routeSignin),
      child: Text(
        'Sign In',
        style: Constant().h2Style(),
      ),
    ),);
  }

  Container buildRegister() {
    return Container(
      margin: EdgeInsets.only(
        top: 550,
        left: 30,
      ),
      width: screenWidth * 0.4,
      child: ElevatedButton(
        style: Constant().ligthButton(),
        onPressed: ()=>Navigator.pushNamed(context, Constant.routeCreateAcc),
        child: Text(
          'Register',
          style: Constant().h2Style(),
        ),
      ),
    );
  }

  Container buildFrame() {
    return Container(
      width: screenWidth,
      child: ShowImage(path: Constant.asset4),
    );
  }

  Container buildLogo() {
    return Container(
      width: screenWidth * 0.1,
      child: ShowImage(
        path: Constant.asset5,
      ),
    );
  }

  Container buildBG()  {
    return Container(
      width: screenWidth,
      child: Stack(
        children: [
          Positioned(top: 0, left: 0, child: ShowImage(path: Constant.asset1)),
        ],
      ),
    );
  }
}

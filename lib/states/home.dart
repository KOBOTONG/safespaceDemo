import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:flutter/material.dart';
import 'package:demosafespace/states/home.dart';

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
          ],
        ),
      ),
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

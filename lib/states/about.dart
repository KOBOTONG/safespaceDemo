import 'package:demosafespace/utility/constant.dart';
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
        ],
      )),
    );
  }
}

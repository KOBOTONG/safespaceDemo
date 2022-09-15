import 'package:demosafespace/utility/constant.dart';
import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

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
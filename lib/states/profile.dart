// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:demosafespace/model/user_model.dart';
import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/widget/showSignout.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UserModel? userModel;
  @override
  void initState() {
    super.initState();
    findDataUser();
  }

  Future<void> findDataUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var usernameProfile = preferences.getString('username')!;
    print('usernameProfile : $usernameProfile');
    String apiCheck =
        "${Constant.api}/safespace//checksignin.php?isAdd=true&username=$usernameProfile";
    await Dio().get(apiCheck).then((value) {
      for (var item in json.decode(value.data)) {
        setState(() {
          userModel = UserModel.fromMap(item);
          print('Firstname ===>${userModel!.fname}');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constant.yello,
      body: SafeArea(
          child: ListView(
        children: [
          makeHeadingname(),
          makeline(),
          Container(
            padding: EdgeInsets.only(top: 50, left: 40),
            child: Text(
              'Username       : ${userModel!.username}',
              style: Constant().h0Style(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 30,
            ),
            child: Text(
              ' Name-Lastname : ${userModel!.fname} ${userModel!.lname}',
              style: Constant().h0Style(),
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: Text(
                  ' Licsenseplate : ',
                  style: Constant().h0Style(),
                ),
              ),
               Container(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: Text(
                  ' ${userModel!.licsenseplate} ',
                  style: Constant().h3Style(),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              top: 30,
            ),
            child: Text(
              ' E-mail : ${userModel!.mailuser} ',
              style: Constant().h0Style(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 30,
            ),
            child: Text(
              'Phone : ${userModel!.phone} ',
              style: Constant().h0Style(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 30,
            ),
            child: Text(
              'Idencification : ',
              style: Constant().h0Style(),
            ),
          ),
          
          SignOut(),
          Row(
            children: [
              iconeHome(context),
              iconsPro(context),
              iconcontact(context),
            ],
          ),
        ],
      )),
    );
  }

  Padding iconeHome(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50),
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
      padding: const EdgeInsets.only(top: 10, left: 70),
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
      padding: const EdgeInsets.only(top: 10, left: 70),
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
          padding: EdgeInsets.only(top: 10),
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

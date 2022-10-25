// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:demosafespace/utility/normal_dialog.dart';
import 'package:http/http.dart ' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:demosafespace/model/user_model.dart';
import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/widget/showSignout.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:demosafespace/widget/show_process.dart';
import 'package:demosafespace/widget/showsignout.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool load = true;
  bool? haveBooking;
  List<UserModel> bookingModel = [];

  get http => null;
  @override
  void initState() {
    super.initState();
    findDataUser();
  }

  Future<void> findDataUser() async {
    if (bookingModel.length != 0) {
      bookingModel.clear();
    } else {}
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var usernameProfile = preferences.getString('username')!;
    print('usernameProfile : $usernameProfile');
    String apiCheck =
        "${Constant.api}/safespace//checksignin.php?isAdd=true&username=$usernameProfile";
    await Dio().get(apiCheck).then((value) {
      if (value.toString() == 'null') {
        setState(() {
          load = false;
          haveBooking = false;
        });
      } else {
        for (var item in json.decode(value.data)) {
          setState(() {
            load = false;
            UserModel model = UserModel.fromMap(item);
            print('Firstname ===>${model!.fname}');
            setState(() {
              load = false;
              haveBooking = true;
              bookingModel.add(model);
            });
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.yello,
      body: load
          ? ShowProgress()
          : haveBooking!
              ? LayoutBuilder(
                  builder: (context, constraints) => bookListview(constraints),
                )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 70),
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
                          padding: EdgeInsets.only(top: 10),
                          child: ShowImage(path: Constant.asset7),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Profile",
                            style: Constant().h0Style(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                 floatingActionButton: FloatingActionButton(
        backgroundColor: Constant.green,
        onPressed: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.clear().then(
                    (value) => Navigator.pushNamedAndRemoveUntil(
                        context, Constant.routeWelcome, (route) => false),
                  );
            },
        child: Icon(Icons.login_outlined),
      ),     
    );
  }

  ListView bookListview(BoxConstraints constraints) {
    return ListView.builder(
      itemCount: bookingModel.length,
      itemBuilder: (context, index) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 70),
            child: Text(
              "S  a  f  e  S  p  a  c  e",
              style: Constant().hhStyle(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: ShowImage(path: Constant.asset7),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Profile",
              style: Constant().h0Style(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 50, right: 120),
                child: Text(
                  'Username       : ${bookingModel[index].username}',
                  style: Constant().h0Style(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: Text(
                  'Name-Lastname : ${bookingModel[index].fname} ${bookingModel[index].lname}',
                  style: Constant().h0Style(),
                ),
              ),             
              Container(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: Text(
                  'E-mail          : ${bookingModel[index].mailuser} ',
                  style: Constant().h0Style(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: Text(
                  'Phone          :  ${bookingModel[index].phone} ',
                  style: Constant().h0Style(),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 160, left: 5),
                child: IconButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, Constant.routeHome),
                  icon: Icon(
                    Icons.home_rounded,
                    size: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 160, left: 35),
                child: IconButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, Constant.routeProfile),
                  icon: Icon(
                    Icons.account_circle,
                    size: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 160, left: 35),
                child: IconButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, Constant.routeAboutus),
                  icon: Icon(
                    Icons.support_agent,
                    size: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 160, left: 35),
                child: IconButton(
                  onPressed: () async {
                    print(
                        'Confirm delete ==>  ${bookingModel[index].username}');
                    String apiCheckDel =
                        '${Constant.api}/safespace/del.php?isAdd=true&username=${bookingModel[index].username}';
                    await Dio().get(apiCheckDel).then((value) => {
                          Navigator.pushNamed(context, Constant.routeWelcome),
                        });
                  },
                  icon: Icon(
                    Icons.delete_outline,
                    size: 50,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

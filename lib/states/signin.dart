// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, unused_import, unnecessary_new, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, prefer_void_to_null

import 'dart:convert';

import 'package:demosafespace/model/user_model.dart';

import 'package:demosafespace/states/create_acc.dart';
import 'package:demosafespace/states/home.dart';
import 'package:demosafespace/utility/normal_dialog.dart';
import 'package:demosafespace/widget/show_title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool statusRedEye = true;
  get childen => null;
  final formkey = GlobalKey<FormState>();
  TextEditingController usernamecontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constant.yello,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                makeTitle(),
                makeSub(),
                makeImage(),
                makeUsername(size),
                makePAssword(size),
                makeButton(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row makeButton(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.6,
          child: ElevatedButton(
              style: Constant().ourButton(),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  String username = usernamecontroler.text;
                  String passuser = passwordcontroler.text;
                  print('$username & $passuser');
                  checkAuthen(username: username, passuser: passuser);
                }
              },
              child: Text(
                'Sign In',
                style: Constant().h4Style(),
              )),
        ),
      ],
    );
  }

  Future<Null> checkAuthen({String? username, String? passuser}) async {
    String apiCheck =
        "${Constant.api}/safespace//checksignin.php?isAdd=true&username=$username";
    await Dio().get(apiCheck).then((value) async {
      print('$value');
      if (value.toString() == 'null') {
        normalDialog(context, ' No $username Account. Do you have acccount ?');
      } else {
        for (var item in json.decode(value.data)) {
          UserModel model = UserModel.fromMap(item);
          if (passuser == model.passuser) {
            //Success Authen

            if (username == model.username) {
              print('$username');
              Navigator.pushNamedAndRemoveUntil(
                  context, Constant.routeHome, (route) => false);
            }
            SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.setString('username', model.username);
              preferences.setString('fname', model.fname);
              preferences.setString('lname', model.lname);
              preferences.setString('phone', model.phone);
              preferences.setString('licsenseplate', model.licsenseplate);

            //Navigator.pushNamed(context, Constant.routeHome);*/
          } else {
            normalDialog(context, 'Invalid Password');
          }
        }
      }
    });
  }

  Row makePAssword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.only(top: 15, bottom: 10),
            width: size * 0.6,
            child: TextFormField(
              controller: passwordcontroler,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                } else {
                  return null;
                }
              },
              obscureText: statusRedEye,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      statusRedEye = !statusRedEye;
                    });
                  },
                  icon: statusRedEye
                      ? Icon(Icons.remove_red_eye, color: Constant.ligthBlack)
                      : Icon(
                          Icons.remove_red_eye_outlined,
                          color: Constant.colorF,
                        ),
                ),
                labelStyle: Constant().h3Style(),
                labelText: 'Password :',
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Constant.ligthBlack,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Constant.ligthBlack),
                    borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Constant.ligthBlack,
                  ),
                ),
              ),
            )),
      ],
    );
  }

  Row makeUsername(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 11, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: usernamecontroler,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your license plate';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelStyle: Constant().h3Style(),
              labelText: 'license plate',
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: Constant.ligthBlack,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Constant.ligthBlack),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Constant.ligthBlack),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container makeImage() {
    return Container(
      width: 250,
      child: ShowImage(path: Constant.asset6),
    );
  }

  Container makeSub() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 5),
      child: Row(
        children: [
          Text(
            "Sign In to your account",
            style: Constant().hStyle(),
          ),
        ],
      ),
    );
  }

  Container makeTitle() {
    return Container(
      padding: EdgeInsets.only(bottom: 5, top: 50, left: 30),
      child: Row(
        children: [
          Text(
            "Welcome Back!",
            style: Constant().h1Style(),
          ),
        ],
      ),
    );
  }
}

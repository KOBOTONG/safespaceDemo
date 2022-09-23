// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:demosafespace/utility/constant.dart';
import 'package:http/http.dart' as http;

class CreareAcc extends StatefulWidget {
  const CreareAcc({Key? key}) : super(key: key);

  @override
  State<CreareAcc> createState() => _CreareAccState();
}

class _CreareAccState extends State<CreareAcc> {
  bool statusRedEye = true;

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController mailuser = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

  Future<void> insertdata() async {
    if (fname.text != " " ||
        lname.text != " " ||
        mailuser.text != " " ||
        password.text != " " ||
        phone.text != " ") {
      try {
        String url = "http://10.0.2.2/safespace/insertUser.php";
        var res = await http.post(Uri.parse(url), body: {
          "fname": fname.text,
          "lname": lname.text,
          "mailuser": mailuser.text,
          "password": password.text,
          "phone": phone.text,
        });

        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("Success insert");
        } else {
          print("some isssue");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Please Fill All fileds");
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constant.yello,
      body: SafeArea(
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                makeTitalStart(),
                makeTitleC(),
                makeIden(size),
                firstname(size),
                lastname(size),
                email(size),
                makePassword(size),
                makePhonnuber(size),
                makeButton(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row makeIden(double size) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    width: size * 0.6,
                    child: TextFormField(
                      maxLength: 13,
                      validator: (value) {
                        if (value!.isEmpty /*|| !RegExp(r'^[+]*[(]{0,1}[0-9]{1-4}[)][-\s\./0-9]+$').hasMatch(value!)*/) {
                          return 'Enter correct Identification Number';
                        } else {}
                      },
                      decoration: InputDecoration(
                        labelStyle: Constant().h3Style(),
                        labelText: 'Identification Number',
                        prefixIcon: Icon(
                          Icons.badge_outlined,
                          color: Constant.ligthBlack,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Constant.ligthBlack),
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
                /*insertdata();*/
              },
              child: Text(
                'Register Now',
                style: Constant().h4Style(),
              )),
        ),
      ],
    );
  }

  Row makePhonnuber(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 11, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone number';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: Constant().h3Style(),
              labelText: 'Phone Number',
              prefixIcon: Icon(
                Icons.phone_android_outlined,
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

  Row makePassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: password,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              } else {}
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
          ),
        ),
      ],
    );
  }

  Row email(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 11, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: mailuser,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your E-mail';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: Constant().h3Style(),
              labelText: 'E-mail',
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

  Row lastname(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: lname,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your lastname';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: Constant().h3Style(),
              labelText: 'Lastname',
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

  Row firstname(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 30, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: fname,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your firstname';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: Constant().h3Style(),
              labelText: 'Firstname',
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

  Container makeTitleC() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: Row(
        children: [
          Text(
            "Create tour accound for join application",
            style: Constant().hStyle(),
          ),
        ],
      ),
    );
  }

  Container makeTitalStart() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 50),
      child: Row(
        children: [
          Text(
            "Get Started !",
            style: Constant().h1Style(),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, unused_import, avoid_print, unrelated_type_equality_checks, deprecated_member_use, unnecessary_null_comparison
import 'dart:convert';


import 'dart:io';

import 'package:demosafespace/utility/normal_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:demosafespace/widget/show_title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:demosafespace/utility/constant.dart';
import 'package:http/http.dart' as http;

class CreareAcco extends StatefulWidget {
  const CreareAcco({Key? key}) : super(key: key);

  @override
  State<CreareAcco> createState() => _CreareAccState();
}



class _CreareAccState extends State<CreareAcco> {
   String? username, fname, lname, licsenseplate, mail, password, phone;
  bool statusRedEye = true;
 

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constant.yello,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              makeTitalStart(),
              makeTitleC(),
              makeUsername(size),
              firstname(size),
              lastname(size),
              makeIsen(size),
              email(size),
              makePassword(size),
              makePhonnuber(size),
              registerButtom()
            ],
          ),
        ),
      ),
    );
  }

/*Future<Null> checkUser() async {
   try { String url =
        'http://localhost/safespace/checkuser.php?isAdd=true&username=$username';
    
      Response response = await Dio().get(url);
      
      if (response.toString()=='null'){
        insertUser();
      }else{
        normalDialog(context, '$username Duplicate Username');
      }
    } catch (e) {}
  }*/

  Future<void> insertUser() async {
    try {String url =
        'http://10.0.2.2/safespace/insertUser.php?isAdd=true&username=$username&fname=$fname&lname=$lname&licsenseplate=$licsenseplate&mailuser=$mail&password=$password&phone=$phone';
      Response response = await Dio().get(url);
      print('res = $response');
       if (response.toString() == 'true') {
            
            Navigator.pop(context);
          
          } else {
            normalDialog(context, 'ไม่สามารถ สมัครได้ กรุณาลองใหม่ คะ');
          }
    } catch (e) {

    }
  }

  Widget registerButtom() => Container(
        width: 240.0,
        child: RaisedButton(
          color: Constant.dropligthBlack,
          onPressed: () {
            print(
                'Username = $username, fname = $fname,lname = $lname,licsenseplate=$licsenseplate,mail=$mail,password=$password,phone=$phone');
            if (username==null || 
                fname == null ||
                lname == null ||
                licsenseplate == null ||
                mail == null ||
                password == null ||
                phone == null) {
              print('Have Space');
              normalDialog(context, 'Have Space');
            }else{
              insertUser();
            }
          },
          child: Text(
            'Register Now',
            style: Constant().h4Style(),
          ),
        ),
      );

  Row makeIsen(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 11, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            onChanged: (value) => licsenseplate = value.trim(),
            decoration: InputDecoration(
              labelStyle: Constant().h3Style(),
              labelText: 'License Plate',
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

  Row makeUsername(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 11, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            onChanged: (value) => username = value.trim(),
            maxLength: 6,
            decoration: InputDecoration(
              labelStyle: Constant().h3Style(),
              labelText: 'Username ',
              prefixIcon: Icon(
                Icons.badge_outlined,
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

  Widget makeButton(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.6,
          child: RaisedButton(
            color: Constant.dropligthBlack,
            onPressed: () {},
            child: Text(
              'Next',
              style: Constant().h4Style(),
            ),
          ),
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
            onChanged: (value) => phone = value.trim(),
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
            onChanged: (value) => password = value.trim(),
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
            onChanged: (value) => mail = value.trim(),
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
            onChanged: (value) => lname = value.trim(),
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
          padding: EdgeInsets.only(bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            onChanged: (value) => fname = value.trim(),
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
            "Create your accound for join application",
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

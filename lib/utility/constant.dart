// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class Constant {
  // Genernal
  static String appName = 'SafeSpace';
  static String SignName = 'welcome Back!';
  //Route
  static String routeWelcome = '/welcome';
  static String routeAuthen = '/authen';
  static String routeCreateAcc = '/create_acc';
  static String routeSignin = '/signin';
  static String routeHome = '/home';
  //Image
  static String asset1 = 'images/FFF1.png';
  static String asset2 = 'images/BGligthFFDB48.png';
  static String asset3 = 'images/frameSI.png';
  static String asset4 = 'images/CropWelcome.png';
  static String asset5 = 'images/FFcar.png';
  static String asset6 = 'images/Parking1.png';
  static String asset7 = 'images/Line7.png';
  static String asset8 = 'images/chome.png';
  static String asset9 = 'images/texthome.png';
  //color
  static Color yello = Color(0xffffdb48);
  static Color green = Color(0xff367d51);
  static Color black = Color(0xff000000);
  static Color colorF = Color(0xffFAF3E3);
  static Color ligthBlack = Color(0xff443C3C);
  static Color dropligthBlack = Color(0xff5E5555);

  //Style
  TextStyle hStyle() => TextStyle(
        fontFamily: 'LibreBodoni',
        fontSize: 20,
        color: dropligthBlack,
        fontWeight: FontWeight.w600,
      );
  TextStyle h1Style() => TextStyle(
        fontFamily: 'LibreBodoni',
        fontSize: 24,
        color: ligthBlack,
        fontWeight: FontWeight.w600,
      );
  TextStyle hhStyle() => TextStyle(
        fontFamily: 'LibreBodoni',
        fontSize: 30,
        color: ligthBlack,
        fontWeight: FontWeight.w600,
      );
  TextStyle h2Style() => TextStyle(
        fontFamily: 'LibreBodoni',
        fontSize: 20,
        color: green,
        fontWeight: FontWeight.w600,
      );
  TextStyle h4Style() => TextStyle(
        fontFamily: 'LibreBodoni',
        fontSize: 20,
        color: colorF,
        fontWeight: FontWeight.w600,
      );
  TextStyle h5Style() => TextStyle(
        fontFamily: 'EduSABeginner',
        fontSize: 18,
        color: colorF,
        fontWeight: FontWeight.normal,
      );
  TextStyle h6Style() => TextStyle(
        fontFamily: 'NotoSansThai',
        fontSize: 20,
        color: colorF,
        fontWeight: FontWeight.normal,
      );
  TextStyle h3Style() => TextStyle(
        fontFamily: 'NotoSansThai',
        fontSize: 16,
        color: ligthBlack,
        fontWeight: FontWeight.normal,
      );
  ButtonStyle ourButton() => ElevatedButton.styleFrom(
        primary: Constant.ligthBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
  ButtonStyle ligthButton() => ElevatedButton.styleFrom(
        primary: Constant.colorF,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
}

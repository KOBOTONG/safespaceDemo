// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class Constant {
  // Genernal
  static String appName = 'SafeSpace';
  //Route
  static String routeWelcome = '/welcome';
  static String routeAuthen = '/authen';
  static String routeCreateAcc = '/create_acc';

  //Image
  static String asset1 = 'images/FFF1.png';
  static String asset2 = 'images/BGligthFFDB48.png';
  static String asset3 = 'images/frameSI.png';
  static String asset4 = 'images/CropWelcome.png';
  static String asset5 = 'images/FFcar.png';

  //color
  static Color yello = Color(0xffffdb48);
  static Color green = Color(0xff367d51);
  static Color black = Color(0xff000000);
  static Color colorF = Color(0xffFAF3E3);

  //Style
  TextStyle h1Style() => TextStyle(
        fontFamily: 'LibreBodoni',
        fontSize: 24,
        color: black,
        fontWeight: FontWeight.w600,
      );
  TextStyle h2Style() => TextStyle(
        fontFamily: 'LibreBodoni',
        fontSize: 20,
        color: green,
        fontWeight: FontWeight.normal,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 18,
        color: colorF,
        fontWeight: FontWeight.normal,
      );

  TextStyle h4Style() => TextStyle(
        fontFamily: 'LibreBodoni',
        fontSize: 24,
        color: colorF,
        fontWeight: FontWeight.w600,
      );
  TextStyle h5Style() => TextStyle(
        fontFamily: 'EduSABeginner',
        fontSize: 18,
        color: colorF,
        fontWeight: FontWeight.normal,
      );
  ButtonStyle ourButton() => ElevatedButton.styleFrom(
        primary: Constant.colorF,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
}

// ignore_for_file: unused_import, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

class Constant {
  // Genernal
  static String appName = 'SafeSpace';
  static String SignName = 'welcome Back!';
   static String api = 'https://27e3-110-168-84-109.ap.ngrok.io';

  //Route
  static String routeWelcome = '/welcome';
  static String routeAuthen = '/authen';
  static String routeCreateAcc = '/create_acc';
  static String routeSignin = '/signin';
  static String routeHome = '/home';
  static String routeAboutus = '/about';
  static String routeProfile = '/profile';
  static String routeBooking = '/booking';
  static String routePaymentbook = '/paymentbook';
   static String routeMybooking = '/mybooking';
   static String routeWaiting = '/waiting';
   static String routeIden = '/addiden';

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
  static String assetCalen = 'images/Calendar.png';
  static String assetp = 'images/payment.png';
  static String assetQr = 'images/qrcode.png';
  static String assetDocument = 'images/contract.png';
  static String assetPay = 'images/layout.png';
  static String assetHome = 'images/head.png';
  static String assetEmail = 'images/ema.png';
  static String assetFac = 'images/facebook.png';
  static String assetPhone = 'images/pho.png';
  static String assetTwi = 'images/twi.png';
  static String assetFa = 'images/facebook.png';
    static String assetP = 'images/phone.png';
  static String assetT = 'images/twitter.png';
  static String assetE = 'images/email.png';
  //color
  static Color yello = Color(0xffffdb48);
  static Color green = Color(0xff367d51);
  static Color black = Color(0xff000000);
  static Color colorF = Color(0xffFAF3E3);
  static Color ligthBlack = Color(0xff443C3C);
  static Color dropligthBlack = Color(0xff5E5555);
  static Color red = Color(0xffaf0b0f);
  //Style
   TextStyle h0Style() => TextStyle(
        fontFamily: 'AbyssinicaSIL',
        fontSize: 20,
        color: dropligthBlack,
        fontWeight: FontWeight.w600,
      );
   TextStyle hh0Style() => TextStyle(
        fontFamily: 'AbyssinicaSIL',
        fontSize: 30,
        color: ligthBlack,
        fontWeight: FontWeight.w600,
      );
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
  TextStyle hBookingStyle() => TextStyle(
        fontFamily: 'LibreBodoni',
        fontSize: 20,
        color: ligthBlack,
        fontWeight: FontWeight.w600,
      );
        TextStyle hWaeningStyle() => TextStyle(
        fontFamily: 'LibreBodoni',
        fontSize: 18,
        color: Color.fromARGB(255, 194, 48, 48),
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
  TextStyle hh4Style() => TextStyle(
        fontFamily: 'LibreBodoni',
        fontSize: 20,
        color: dropligthBlack,
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
  TextStyle hthaiStyle() => TextStyle(
        fontFamily: 'NotoSansThai',
        fontSize: 20,
        color: black,
        fontWeight: FontWeight.normal,
      );
      TextStyle hthaititleStyle() => TextStyle(
        fontFamily: 'NotoSansThai',
        fontSize: 20,
        color: dropligthBlack,
        fontWeight: FontWeight.normal,
      );
  TextStyle hhthaiStyle() => TextStyle(
        fontFamily: 'NotoSansThai',
        fontSize: 20,
        color: red,
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

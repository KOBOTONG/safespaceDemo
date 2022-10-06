// ignore_for_file: prefer_const_constructors, avoid_print, prefer_void_to_null
import 'package:demosafespace/states/paymentbook.dart';
import 'package:demosafespace/states/booking.dart';

import 'package:demosafespace/states/signin.dart';

import 'package:flutter/material.dart';
import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/states/create_acc.dart';
import 'package:demosafespace/states/welcome.dart';
import 'package:demosafespace/states/home.dart';
import 'package:demosafespace/states/about.dart';
import 'package:demosafespace/states/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Map<String, WidgetBuilder> map = {
  '/welcome': (BuildContext context) => Welcome(),
  '/create_acc': (BuildContext context) => CreareAcc(),
  '/signin': (BuildContext context) => Signin(),
  '/home': (BuildContext context) => Home(),
  '/about': (BuildContext context) => Aboutus(),
  '/profile': (BuildContext context) => Profile(),
  '/booking': (BuildContext context) => Booking(),
  '/paymentbook':(BuildContext context) => Pay(),
};

String? initlalRoute;

/*void main() {
  initlalRoute = Constant.routeWelcome;
  runApp(MyApp());
}*/
Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? username = preferences.getString('username');
  print('user-->$username ');
  if (username?.isEmpty ?? true) {
    initlalRoute = Constant.routeWelcome;
    runApp(MyApp());
  } else {
    initlalRoute = Constant.routeHome;
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.appName,
      routes: map,
      initialRoute: initlalRoute,
    );
  }
}

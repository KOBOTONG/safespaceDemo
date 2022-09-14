// ignore_for_file: prefer_const_constructors

import 'package:demosafespace/states/signin.dart';
import 'package:flutter/material.dart';
import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/states/create_acc.dart';
import 'package:demosafespace/states/welcome.dart';
import 'package:demosafespace/states/home.dart';
final Map<String, WidgetBuilder> map = {
  '/welcome': (BuildContext context) => Welcome(),
  '/create_acc': (BuildContext context) => CreareAcc(),
  '/signin': (BuildContext context) => Signin(),
  '/home': (BuildContext context) => Home(),
};

String? initlalRoute;

void main() {
  initlalRoute = Constant.routeWelcome;
  runApp(MyApp());
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

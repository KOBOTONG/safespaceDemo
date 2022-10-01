// ignore_for_file: file_names
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:demosafespace/widget/show_title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:demosafespace/utility/constant.dart';
import 'package:http/http.dart' as http;


class Insertauthen extends StatefulWidget {
  const Insertauthen({Key? key}) : super(key: key);

  @override
  State<Insertauthen> createState() => _InsertauthenState();
}

class _InsertauthenState extends State<Insertauthen> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constant.yello,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              title(),
              subtitle()
            ],
          ),
        ),
      ),
    );
  }

  Container subtitle() {
    return Container(
    padding: EdgeInsets.only(left: 20, top: 10),
    child: Row(
      children: [
        Text(
          "Create your account for join application",
          style: Constant().hStyle(),
        ),
      ],
    ),
  );
  }

  Container title() {
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

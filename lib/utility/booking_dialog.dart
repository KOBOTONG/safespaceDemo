// ignore_for_file: deprecated_member_use, prefer_const_constructors, duplicate_ignore

import 'package:demosafespace/utility/constant.dart';
import 'package:flutter/material.dart';

Future<void> bookingDialog(BuildContext context, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(message,style: Constant().h3Style()),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 20),
              child: FloatingActionButton(
                
                backgroundColor: Color.fromARGB(255, 27, 94, 32),
                onPressed:  ()=> Navigator.pushNamed(context, Constant.routeHome),
                  // ignore: prefer_const_constructors
                  child: Text(
                    'OK',
                   
                  )),
            )
           
          ],
        )
      ],
    ),
  );
}
// ignore_for_file: deprecated_member_use, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

Future<void> normalDialog(BuildContext context, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(message),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(onPressed:  ()=> Navigator.pop(context),
                // ignore: prefer_const_constructors
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.red),
                ))
           /* FlatButton(
                onPressed: () => Navigator.pop(context),
                // ignore: prefer_const_constructors
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.red),
                )),*/
          ],
        )
      ],
    ),
  );
}
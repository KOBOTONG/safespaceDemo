// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:demosafespace/utility/constant.dart';
import 'package:flutter/material.dart';

class Bking extends StatelessWidget {
  final String bookTitle;

  Bking({required this.bookTitle});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Colors.orange[100],
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 140,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: IconButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, Constant.routeBooking),
                        icon: Icon(
                          Icons.toys,
                          size: 70,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Text(
                  'Booking',
                  style: Constant().hh4Style(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

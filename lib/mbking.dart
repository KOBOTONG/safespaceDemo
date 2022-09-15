import 'dart:ui';

import 'package:demosafespace/utility/constant.dart';
import 'package:flutter/material.dart';

class MBking extends StatelessWidget {
  final String mbookTitle;

  MBking({required this.mbookTitle});
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
                            Navigator.pushNamed(context, Constant.routeWelcome),
                        icon: Icon(
                          Icons.event_available,
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
                  'My Booking',
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

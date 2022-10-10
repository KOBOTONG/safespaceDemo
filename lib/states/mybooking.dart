import 'dart:convert';

import 'package:demosafespace/model/booking_model.dart';
import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:demosafespace/widget/show_process.dart';
import 'package:demosafespace/widget/show_title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mybooking extends StatefulWidget {
  const Mybooking({Key? key}) : super(key: key);

  @override
  State<Mybooking> createState() => _MybookingState();
}

class _MybookingState extends State<Mybooking> {
  bool load = true;
  bool? haveBooking;
  List<BookingModel> bookingModel = [];
  @override
  void initState() {
    super.initState();
    loadApiBooking();
  }

  Future<Null> loadApiBooking() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String usernamebook = preferences.getString('username')!;
    String apifindbooking =
        '${Constant.api}/safespace/findbooking.php?isAdd=true&usernamebook=$usernamebook';
    await Dio().get(apifindbooking).then((value) {
      if (value.toString() == 'null') {
        setState(() {
          load = false;
          haveBooking = false;
        });
      } else {
        for (var item in json.decode(value.data)) {
          BookingModel model = BookingModel.fromMap(item);
          print('Firstname ==> ${model.fnamebook}');

          setState(() {
            load = false;
            haveBooking = true;
            bookingModel.add(model);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.yello,
      body: load
          ? ShowProgress()
          : haveBooking!
              ? LayoutBuilder(
                  builder: (context, constraints) => bookListview(constraints),
                )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 70),
                          child: Text(
                            "S  a  f  e  S  p  a  c  e",
                            style: Constant().hhStyle(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: ShowImage(path: Constant.asset7),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Booking Detail",
                            style: Constant().h0Style(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 170),
                          child: Text(
                            'No Booking?',
                            style: Constant().h0Style(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 90),
                          child: Text(
                            'Click Start for booking!',
                            style: Constant().h0Style(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
       floatingActionButton: FloatingActionButton(
        backgroundColor: Constant.green,
        onPressed: () => Navigator.pushNamed(context, Constant.routeBooking),
        child: Text('Start!'),
      ),
    );
  }

  ListView bookListview(BoxConstraints constraints) {
    return ListView.builder(
      itemCount: bookingModel.length,
      itemBuilder: (context, index) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 70),
            child: Text(
              "S  a  f  e  S  p  a  c  e",
              style: Constant().hhStyle(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: ShowImage(path: Constant.asset7),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Booking Detail",
              style: Constant().h0Style(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 50,right: 120),
                child: Text(
                  'Username       : ${bookingModel[index].usernamebook}',
                  style: Constant().h0Style(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: Text(
                  ' Name-Lastname : ${bookingModel[index].fnamebook} ${bookingModel[index].lnamebook}',
                  style: Constant().h0Style(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30,right: 40),
                child: Text(
                  'Start Parking   : ${bookingModel[index].stmonth} ${bookingModel[index].styear}',
                  style: Constant().h0Style(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30,right: 40),
                child: Text(
                  'End Parking   : ${bookingModel[index].tomonth} ${bookingModel[index].toyear}',
                  style: Constant().h0Style(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30,right: 40),
                child: Text(
                  'Detail   : ${bookingModel[index].resultmy} ',
                  style: Constant().h0Style(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30,right: 40),
                child: Text(
                  'Status Booking  : ${bookingModel[index].status} ',
                  style: Constant().h0Style(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

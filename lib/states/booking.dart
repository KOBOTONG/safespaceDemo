// ignore_for_file: unused_import

import 'dart:convert';

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:demosafespace/utility/normal_dialog.dart';
import 'package:demosafespace/widget/show_title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}
final formKey = GlobalKey<FormState>();
class _BookingState extends State<Booking> {
  String? typeMonth;
  String? select;
  _StateBook() {
    _selectVal = _monthSelect[0];
  }

  _ToYear() {
    _toVal = _yearTo[0];
  }

  _EndTo() {
    _selectToVal = _monthTo[0];
  }

  _EndYearTo() {
    _toEndVal = _yearEnd[0];
  }

  final _yearEnd = [
    "2022",
    "2023",
    "2024",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
    "2030",
    "2031",
    "2032"
  ];
  String? _toEndVal = "2022";

  final _monthTo = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  String? _selectToVal = "January";

  final _monthSelect = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  String? _selectVal = "January";
  final _yearTo = [
    "2022",
    "2023",
    "2024",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
    "2030",
    "2031",
    "2032"
  ];
  String? _toVal = "2022";

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constant.yello,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Stack(
              children: [
                header(),
                line(),
                titletext(),
                imgcar(),
                selectTitle(),
                selectMonth(),
                toYear(),
                titleEnd(),
                selectEndM(),
                selectEndYear(),
                titleSelectMonth(),
                makeTypeM(),
                buttomConfirm(size),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Row buttomConfirm(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 780),
          width: size * 0.6,
          child: ElevatedButton(
            style: Constant().ourButton(),
            onPressed: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              String usernamebook = preferences.getString('username')!;
              String fnamebook = preferences.getString('fname')!;
              String lnamebook = preferences.getString('lname')!;
              String licsenbook = preferences.getString('licsenseplate')!;
              
              print('username for booking ->$usernamebook , first name -> $fnamebook, last name -> $lnamebook, licsenseplate -> $licsenbook');
              print('Start Month : $_selectVal ,Start Year : $_toVal');
              print('End Month : $_selectToVal ,End Year : $_toEndVal');
              print('$select');
              String path = "${Constant.api}/safespace/book.php?isAdd=true&usernamebook=$usernamebook&fnamebook=$fnamebook&lnamebook=$lnamebook&licsenbook=$licsenbook&stmonth=$_selectVal&styear=$_toVal&tomonth=$_selectToVal&toyear=$_toEndVal&resultmy=$select";
              await Dio().get(path).then((value)=>Navigator.pop(context));
             /* print('lastname for booking ->$lnamebook');
              print('licsenseplate for booking ->$licsenbook');*/
            },
            child: Text(
              'Confirm',
              style: Constant().h4Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row makeTypeM() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.only(top: 680),
            child: typeM("1 Month 2800 baht")),
        Container(
            padding: EdgeInsets.only(top: 680),
            child: typeM("2 Month 5600 baht")),
        Container(
            padding: EdgeInsets.only(top: 680),
            child: typeM("3 Month 8400 baht")),
      ],
    );
  }

  Row titleSelectMonth() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 630, left: 30),
          child: Text(
            "Select Month",
            style: Constant().hBookingStyle(),
          ),
        ),
      ],
    );
  }

  Widget typeM(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          select = title;
          print(select);
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 2, 20, 0),
        child: Container(
          height: 60,
          width: 100,
          decoration: BoxDecoration(
            border: title == select
                ? Border.all(color: Constant.dropligthBlack, width: 2)
                : null,
            color: Color.fromARGB(255, 238, 242, 238),
            borderRadius: BorderRadius.circular(9),
          ),
          // ignore: prefer_const_constructors
          child: Center(
            // ignore: prefer_const_constructors
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container selectEndYear() {
    return Container(
      padding: EdgeInsets.only(top: 540, left: 160, right: 70),
      child: DropdownButtonFormField(
        value: _toEndVal,
        items: _yearEnd
            .map(
              (e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ),
            )
            .toList(),
        onChanged: (val) {
          setState(() {
            _toEndVal = val as String;
            print('End Year : $_toEndVal');
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          color: Color.fromARGB(255, 27, 94, 32),
        ),
        decoration: InputDecoration(
           labelText: "Select Year",
          prefixIcon: Icon(Icons.event_available_rounded,color: Color.fromARGB(255, 27, 94, 32)),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 27, 94, 32)),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }

  Container selectEndM() {
    return Container(
      padding: EdgeInsets.only(top: 470, left: 160, right: 70),
      child: DropdownButtonFormField(
        value: _selectToVal,
        
        items: _monthTo
            .map(
              (e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ),
            )
            .toList(),
        onChanged: (val) {
          setState(() {
            _selectToVal = val as String;
            print('End Month : $_selectToVal');
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          color: Color.fromARGB(255, 27, 94, 32),
        ),
        decoration: InputDecoration(
          labelText: "Select Month",
          prefixIcon: Icon(Icons.calendar_month_rounded,color: Color.fromARGB(255, 27, 94, 32)),
            enabledBorder: const OutlineInputBorder(
              
              borderSide: BorderSide(color: Color.fromARGB(255, 27, 94, 32)),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }

  Container titleEnd() {
    return Container(
      padding: EdgeInsets.only(top: 480, left: 70),
      child: Text(
        "To : ",
        style: Constant().hBookingStyle(),
      ),
    );
  }

  Container selectTitle() {
    return Container(
      padding: EdgeInsets.only(top: 320, left: 50),
      child: Text(
        "Select : ",
        style: Constant().hBookingStyle(),
      ),
    );
  }

  Container toYear() {
    return Container(
      padding: EdgeInsets.only(top: 370, left: 160, right: 70),
      child: DropdownButtonFormField(
        value: _toVal,
        items: _yearTo
            .map(
              (e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ),
            )
            .toList(),
        onChanged: (val) {
          setState(() {
            _toVal = val as String;
            print('Start Year : $_toVal');
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          color: Color.fromARGB(255, 27, 94, 32),
        ),
        decoration: InputDecoration(
           labelText: "Select Year",
          prefixIcon: Icon(Icons.event_available_rounded,color: Color.fromARGB(255, 27, 94, 32)),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 27, 94, 32)),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }

  Container selectMonth() {
    return Container(
      padding: EdgeInsets.only(top: 300, left: 160, right: 70),
      child: DropdownButtonFormField(
        value: _selectVal,
        items: _monthSelect
            .map(
              (e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ),
            )
            .toList(),
        onChanged: (val) {
         
          setState(() {
            _selectVal = val as String;
            print('Start Month : $_selectVal');
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          color: Color.fromARGB(255, 27, 94, 32),
        ),
        
        decoration: InputDecoration(
          
           labelText: "Select Month",
          prefixIcon: Icon(Icons.calendar_month_rounded,color: Color.fromARGB(255, 27, 94, 32)),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 27, 94, 32)),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }

  Row imgcar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 160),
          child: ShowImage(path: Constant.assetCalen),
        ),
      ],
    );
  }

  Row titletext() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 130),
          child: Text(
            "Book  for Parking",
            style: Constant().hBookingStyle(),
          ),
        ),
      ],
    );
  }

  Row line() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 100),
          child: ShowImage(path: Constant.asset7),
        ),
      ],
    );
  }

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 50),
          child: Text(
            "S  a  f  e  S  p  a  c  e",
            style: Constant().hhStyle(),
          ),
        ),
      ],
    );
  }
}

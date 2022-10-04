// ignore_for_file: unused_import

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';

import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/widget/show_image.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
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
            ],
          ),
        ),
      ),
    );
  }

  Container selectEndYear() {
    return Container(
      padding: EdgeInsets.only(top: 540, left: 160, right: 80),
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
      padding: EdgeInsets.only(top: 470, left: 160, right: 80),
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
      padding: EdgeInsets.only(top: 370, left: 160, right: 80),
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
      padding: EdgeInsets.only(top: 300, left: 160, right: 80),
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
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 27, 94, 32)),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }

  /*Row addTo(double size) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top:460),
                      width: size * 0.9,
                      child: DropdownDatePicker(
                        inputDecoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(10))), // optional
                        isDropdownHideUnderline: true, // optional
                        isFormValidator: true, // optional
                        startYear: 2022, // optional
                        endYear: 2030, // optional
                        width: 10, // optional
                        selectedDay: 1, // optional
                        selectedMonth: 1, // optional
                        selectedYear: 2022, // optional
                        onChangedDay: (value) => print('onChangedDay: $value'),
                        onChangedMonth: (value) =>
                            print('onChangedMonth: $value'),
                        onChangedYear: (value) => print('onChangedYear: $value'),
                      ),
                    ),
                    
                  ],
                ),
              ],
            );
  }

  Row titleTo() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 430, left: 20),
                  child: Text(
                    "to Month: ",
                    style: Constant().hBookingStyle(),
                  ),
                ),
              ],
            );
  }

  Row addSelect(double size) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 350),
                      width: size * 0.9,
                      child: DropdownDatePicker(
                        inputDecoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(10))), // optional
                        isDropdownHideUnderline: true, // optional
                        isFormValidator: true, // optional
                         startYear: 2022, // optional
                        endYear: 2030, // optional
                        width: 10, // optional
                        selectedDay: 1, // optional
                        selectedMonth: 1, // optional
                        selectedYear: 2022, /// optional
                        onChangedDay: (value) => print('onChangedDay: $value'),
                        onChangedMonth: (value) =>
                            print('onChangedMonth: $value'),
                        onChangedYear: (value) => print('onChangedYear: $value'),
                      ),
                    ),
                    
                  ],
                ),
              ],
            );
  }

  Row titleSelect() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 310, left: 20),
                  child: Text(
                    "Select Month: ",
                    style: Constant().hBookingStyle(),
                  ),
                ),
              ],
            );
  }*/

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

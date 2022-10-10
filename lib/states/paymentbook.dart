import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:demosafespace/model/booking_model.dart';
import 'package:demosafespace/utility/normal_dialog.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Pay extends StatefulWidget {
  const Pay({Key? key}) : super(key: key);

  @override
  State<Pay> createState() => _PayState();
}

final formKey = GlobalKey<FormState>();

class _PayState extends State<Pay> {
  File? file;
   BookingModel? bookingModel;
  @override
  void initState() {
    super.initState();
    loadApiBooking();
  }
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
                imgpay(),
                imgline(),
                titlepayment(),
                 Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 200, left: 120),
          child: Text(
            "Total :",
            style: Constant().hBookingStyle(),
          ),
        ),
      ],
    ),
                typePayment(),
                Qr(size),
                warning(),
                tiltleslip(),
                Container(
                  padding: EdgeInsets.only(top: 630, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Container(
                          width: 200,
                          height: 200,
                          child: file == null
                              ? ShowImage(path: 'images/layout.png')
                              : Image.file(file!)),
                      SizedBox(height: 40),
                      Container(
                        padding: EdgeInsets.only(
                          left: 30,
                        ),
                        child: ElevatedButton(
                          style: Constant().ourButton(),
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
                          child: Text(
                            'Upload',
                            style: Constant().h4Style(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 850),
                      width: size * 0.6,
                      child: ElevatedButton(
                          style: Constant().ourButton(),
                          onPressed: () {
                            if (file == null) {
                              normalDialog(context, 'กรุณาเพิ่มรูปภาพ');
                            } else {
                              getSlipSuccess();
                            }
                          },
                          child: Text(
                            'Confirm',
                            style: Constant().h4Style(),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

 

  Future<void> getImage(ImageSource source) async {
    try {
      var result = await ImagePicker()
          .pickImage(source: source, maxWidth: 800, maxHeight: 800);
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  String? slip;
  var status='Wait for booking';
  Future<void> getSlipSuccess() async {
    int i = Random().nextInt(100000);
    String nameSlip = 'slip$i.jpg';
    String apisave = '${Constant.api}/safespace//saveslip.php';
    try {
      Map<String, dynamic> map = Map();
      map['file'] =
          await MultipartFile.fromFile(file!.path, filename: nameSlip);
      FormData data = FormData.fromMap(map);
      await Dio().post(apisave, data: data).then((value) async {
        slip = '/safespace/SlipPayment/$nameSlip';
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String usernamebook = preferences.getString('username')!;
        String url =
            '${Constant.api}/safespace/addslip.php?isAdd=true&usernamebook=$usernamebook&slip=$slip&status=$status';
        await Dio().get(url).then((value) {
          if (value.toString() == 'true' || formKey.currentState!.validate()) {
            Navigator.pushNamed(context, Constant.routeWaiting);
          } else {
            normalDialog(context, 'Try again');
          }
        });
      });
    } catch (e) {}
  }

  Future<Null> loadApiBooking() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String usernamebook = preferences.getString('username')!;
    String apifindbooking =
        '${Constant.api}/safespace/findbooking.php?isAdd=true&usernamebook=$usernamebook';
    await Dio().get(apifindbooking).then((value) {
      if (value.toString() == 'null') {
        
      } else {
        for (var item in json.decode(value.data)) {
          setState(() {
          bookingModel = BookingModel.fromMap(item);
          print('Firstname ===>${bookingModel!.fnamebook}');
        });
         
        }
      }
    });
  }

  Row tiltleslip() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 570, left: 20),
          child: Text(
            "Attach a proof of payment slip :",
            style: Constant().hBookingStyle(),
          ),
        ),
      ],
    );
  }

  Row warning() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 510),
          child: Text(
            "Please make the payment within 24 hours. ",
            style: Constant().hWaeningStyle(),
          ),
        ),
      ],
    );
  }

  Row Qr(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.5,
          padding: EdgeInsets.only(top: 290),
          child: ShowImage(path: Constant.assetQr),
        ),
      ],
    );
  }

  Row typePayment() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 250, left: 30),
          child: Text(
            "Payment by :  QRcode ",
            style: Constant().hBookingStyle(),
          ),
        ),
      ],
    );
  }

 
  Row titlepayment() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 140, left: 50),
          child: Text(
            "Payment",
            style: Constant().hBookingStyle(),
          ),
        ),
      ],
    );
  }

  Row imgline() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 120, left: 120),
          child: ShowImage(path: Constant.assetp),
        ),
      ],
    );
  }

  Row imgpay() {
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

import 'dart:io';
import 'dart:math';
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

class _PayState extends State<Pay> {
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
              imgpay(),
              imgline(),
              titlepayment(),
              total(),
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
                    imageSlip != null
                        ? Image.file(imageSlip!)
                        : Text(
                            'กรุณาเพิ่มรูปภาพ',
                            style: Constant().hthaititleStyle(),
                          ),
                    SizedBox(height: 40),
                    Container(
                      padding: EdgeInsets.only(
                        left: 30,
                      ),
                      child: ElevatedButton(
                        style: Constant().ourButton(),
                        onPressed: () {
                          getSlip();
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
                    padding: const EdgeInsets.only(top: 690),
                    width: size * 0.6,
                    child: ElevatedButton(
                        style: Constant().ourButton(),
                        onPressed: () {
                          addSlip();
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
    );
  }

  Future<Null> addSlip() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String usernamebook = preferences.getString('username')!;
    String url =
        '${Constant.api}/safespace/addslip.php?isAdd=true&usernamebook=$usernamebook&slip=$slip';
    await Dio().get(url).then((value) {
      if (value.toString() == 'true') {
        Navigator.pushNamed(context, Constant.routeHome);
      } else {
        normalDialog(context, 'Try again');
      }
    });
  }

  File? imageSlip;
  String? imagenameSlip;
  String slip = '';
  ImagePicker imagePicker = new ImagePicker();
  Future<void> getSlip() async {
    var getSlip = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 800, maxWidth: 800);
    int i = Random().nextInt(100000);
    imagenameSlip = 'slip$i.jpg';
    String apisave = '${Constant.api}/safespace//saveslip.php';
    Map<String, dynamic> map = Map();
    map['file'] =
        await MultipartFile.fromFile(getSlip!.path, filename: imagenameSlip);
    FormData data = FormData.fromMap(map);
    await Dio().post(apisave, data: data).then((value) {
      slip = '/safespace/SlipPayment/$imagenameSlip';
    });

    print(imagenameSlip);
  }

  Future<void> getSlipSuccess() async {
    print('get slip Successful!');
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

  Row total() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 200, left: 120),
          child: Text(
            "Total ",
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

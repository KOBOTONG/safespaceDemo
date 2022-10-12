import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:demosafespace/model/user_model.dart';
import 'package:demosafespace/utility/constant.dart';
import 'package:demosafespace/utility/normal_dialog.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addiden extends StatefulWidget {
  const Addiden({Key? key}) : super(key: key);

  @override
  State<Addiden> createState() => _AddidenState();
}

final formKey = GlobalKey<FormState>();

class _AddidenState extends State<Addiden> {
  String iden = '';
  File? file;
  UserModel? userModel;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 150),
                      child: Text(
                        "Step 2",
                        style: Constant().hBookingStyle(),
                      ),
                    ),
                  ],
                ),
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
  var status = 'Wait for booking';
  Future<void> getSlipSuccess() async {
    int i = Random().nextInt(100000);
    String apisaveiden = '${Constant.api}/safespace//saveiden.php';

    String nameiden = 'iden$i.jpg';
    try {
      Map<String, dynamic> map = Map();
      map['file'] =
          await MultipartFile.fromFile(file!.path, filename: nameiden);
      FormData data = FormData.fromMap(map);
      await Dio().post(apisaveiden, data: data).then((value) async {
        iden = '/safespace/Imageiden/$nameiden';
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String username = preferences.getString('username')!;
        String url =
            '${Constant.api}/safespace/regisuser.php?isAdd=true&username=$username&iden=$iden';
        await Dio().get(url).then((value) {
          if (value.toString() == 'true' || formKey.currentState!.validate()) {
            Navigator.pushNamed(context, Constant.routeWelcome);
          } else {
            normalDialog(context, 'Try again');
          }
        });
      });
    } catch (e) {}
  }

  Future<Null> loadApiBooking() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String username = preferences.getString('username')!;
    String apiCheck =
        "${Constant.api}/safespace//checksignin.php?isAdd=true&username=$username";
    await Dio().get(apiCheck).then((value) {
      if (value.toString() == 'null') {
      } else {
        for (var item in json.decode(value.data)) {
          setState(() {
            userModel = UserModel.fromMap(item);
            print('Firstname ===>${userModel!.fname}');
          });
        }
      }
    });
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

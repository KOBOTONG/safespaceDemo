// ignore_for_file: prefer_const_constructors, unused_import, avoid_print, unrelated_type_equality_checks, unused_local_variable
import 'dart:convert';
import 'dart:io';

import 'package:demosafespace/utility/normal_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:demosafespace/widget/show_image.dart';
import 'package:demosafespace/widget/show_title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:demosafespace/utility/constant.dart';
import 'package:http/http.dart' as http;

class CreareAcc extends StatefulWidget {
  const CreareAcc({Key? key}) : super(key: key);

  @override
  State<CreareAcc> createState() => _CreareAccState();
}

final formKey = GlobalKey<FormState>();

class _CreareAccState extends State<CreareAcc> {
  bool statusRedEye = true;
  TextEditingController username = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController licsenseplate = TextEditingController();
  TextEditingController mailuser = TextEditingController();
  TextEditingController passuser = TextEditingController();
  TextEditingController phone = TextEditingController();


Future<void> insertdata() async {
  
    if (username.text != " " ||
        fname.text != " " ||
        lname.text != " " ||
        licsenseplate.text != " " ||
        mailuser.text != " " ||
        passuser.text != " " ||
        phone.text != " ") {
          
      try {
       
        String url = "http://192.168.1.216/safespace/register.php";
        var res = await http.post(Uri.parse(url), body: {
          "username" : username.text,
          "fname": fname.text,
          "lname": lname.text,
          "licsenseplate": licsenseplate.text,
          "mailuser": mailuser.text,
          "passuser": passuser.text,
          "phone": phone.text,
          "nameiden": imagename,
          "namevehi": imagenamevehi
        });
       
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          Navigator.pop(context);
          
        } else if( response["success"] == "already"){
          normalDialog(context,'Username already Regisered' );
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Please Fill All fileds");
    }
  }

  File? imgepath;
  String? imagename;
  String? imgedata;
  ImagePicker imagePicker = new ImagePicker();
  Future<void> getImage() async {
    var getimage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 800, maxWidth: 800);
    setState(() {
      imgepath = File(getimage!.path);
      imagename = getimage.path.split('/').last;

      print(imgepath);
      print(imagename);
    });
  }

  File? imgeVehicel;
  String? imagenamevehi;
  String? imgedatavehi;
  Future<void> getVehicle() async {
    var getVehicle = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 800, maxWidth: 800);
    setState(() {
      imgeVehicel = File(getVehicle!.path);
      imagenamevehi = getVehicle.path.split('/').last;

      print(imgeVehicel);
      print(imagenamevehi);
    });
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
            child: Column(
              children: [
                makeTitalStart(),
                makeTitleC(),
                makeUsername(size),
                firstname(size),
                lastname(size),
                makeIsen(size),
                email(size),
                makePassword(size),
                makePhonnuber(size),
                makeBlueprintitlt(),
                addIden(size),
                makeBFvehicle(),
                addvehicle(),
                makeWarning(),
                makeButton(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row makeIsen(double size) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 11, bottom: 10),
                    width: size * 0.6,
                    child: TextFormField(
                      controller: licsenseplate,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your license plate';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelStyle: Constant().h3Style(),
                        labelText: 'License Plate',
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          color: Constant.ligthBlack,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Constant.ligthBlack),
                            borderRadius: BorderRadius.circular(30)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Constant.ligthBlack),
                        ),
                      ),
                    ),
                  ),
                ],
              );
  }

  Row addvehicle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 40),
        imgeVehicel != null
            ? Image.file(imgeVehicel!)
            : Text('กรุณาเพิ่มรูปภาพ', style: Constant().hthaititleStyle()),
        SizedBox(height: 40),
        Container(
          padding: EdgeInsets.only(left: 30),
          child: ElevatedButton(
            style: Constant().ourButton(),
            onPressed: () {
              getVehicle();
            },
            child: Text(
              'Upload',
              style: Constant().h4Style(),
            ),
          ),
        ),
      ],
    );
  }

  Container makeBFvehicle() {
    return Container(
      padding: EdgeInsets.only(right: 140),
      child: Text(
        'สำเนาทะเบียนรถ : ',
        style: Constant().hthaiStyle(),
      ),
    );
  }

  Container makeWarning() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        '    ทุกสำเนาต้องมีการเซ็นสำเนาถูกต้องเพื่อใช้สำหรับสมัครสมาชิกจอดรถรายเดือนกับบริษัท NIPPON PARKING DEVELOPMENT (THAILAND) CO.,LTD เท่านั้น',
        style: Constant().hhthaiStyle(),
      ),
    );
  }

  Row addIden(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 40),
        imgepath != null
            ? Image.file(imgepath!)
            : Text('กรุณาเพิ่มรูปภาพ', style: Constant().hthaititleStyle()),
        SizedBox(height: 40),
        Container(
          padding: EdgeInsets.only(left: 30),
          child: ElevatedButton(
            style: Constant().ourButton(),
            onPressed: () {
              getImage();
            },
            child: Text(
              'Upload',
              style: Constant().h4Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row makeUsername(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 11, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: username,
            maxLength: 6,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter Username ';
              } else {
                
              }
            },
            decoration: InputDecoration(
              labelStyle: Constant().h3Style(),
              labelText: 'Username ',
              prefixIcon: Icon(
                Icons.badge_outlined,
                color: Constant.ligthBlack,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Constant.ligthBlack),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Constant.ligthBlack),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container makeBlueprintitlt() {
    return Container(
      padding: EdgeInsets.only(right: 130),
      child: Text(
        'สำเนาบัตรประชาชน : ',
        style: Constant().hthaiStyle(),
      ),
    );
  }

  Row makeButton(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.6,
          child: ElevatedButton(
            style: Constant().ourButton(),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                setState(() {
                 insertdata();
                });
              }
            },
            child: Text(
              'Register Now',
              style: Constant().h4Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row makePhonnuber(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 11, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone number';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelStyle: Constant().h3Style(),
              labelText: 'Phone Number',
              prefixIcon: Icon(
                Icons.phone_android_outlined,
                color: Constant.ligthBlack,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Constant.ligthBlack),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Constant.ligthBlack),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row makePassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: passuser,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              } else {
                return null;
              }
            },
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    statusRedEye = !statusRedEye;
                  });
                },
                icon: statusRedEye
                    ? Icon(Icons.remove_red_eye, color: Constant.ligthBlack)
                    : Icon(
                        Icons.remove_red_eye_outlined,
                        color: Constant.colorF,
                      ),
              ),
              labelStyle: Constant().h3Style(),
              labelText: 'Password :',
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Constant.ligthBlack,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Constant.ligthBlack),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Constant.ligthBlack,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row email(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 11, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: mailuser,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your E-mail';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelStyle: Constant().h3Style(),
              labelText: 'E-mail',
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: Constant.ligthBlack,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Constant.ligthBlack),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Constant.ligthBlack),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row lastname(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: lname,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your lastname';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelStyle: Constant().h3Style(),
              labelText: 'Lastname',
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: Constant.ligthBlack,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Constant.ligthBlack),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Constant.ligthBlack),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row firstname(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: fname,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your firstname';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelStyle: Constant().h3Style(),
              labelText: 'Firstname',
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: Constant.ligthBlack,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Constant.ligthBlack),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Constant.ligthBlack),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container makeTitleC() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: Row(
        children: [
          Text(
            "Create tour accound for join application",
            style: Constant().hStyle(),
          ),
        ],
      ),
    );
  }

  Container makeTitalStart() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 50),
      child: Row(
        children: [
          Text(
            "Get Started !",
            style: Constant().h1Style(),
          ),
        ],
      ),
    );
  }
}

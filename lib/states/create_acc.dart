// ignore_for_file: prefer_const_constructors, unused_import, avoid_print, unrelated_type_equality_checks, unused_local_variable, unnecessary_new
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:demosafespace/main.dart';
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
  File? file;
  File? fileVehi;
  String vehicle = '';
  String iden = '';
  bool statusRedEye = true;
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController fnamecontroller = TextEditingController();
  TextEditingController lnamecontroller = TextEditingController();
  TextEditingController licsenseplatecontroller = TextEditingController();
  TextEditingController mailusercontroller = TextEditingController();
  TextEditingController passusercontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  Future<Null> insertdatauser() async {
    String username = usernamecontroller.text;
    String fname = fnamecontroller.text;
    String lname = lnamecontroller.text;
    String licsenseplate = licsenseplatecontroller.text;
    String mailuser = mailusercontroller.text;
    String passuser = passusercontroller.text;
    String phone = phonecontroller.text;
    print(
        'Data --> username : $username,fname : $fname,lname:$lname,licsenseplate :$licsenseplate,mailuser : $mailuser,password :$passuser,phone: $phone');
    String apiCheck =
        "${Constant.api}/safespace//checksignin.php?isAdd=true&username=$username";
    await Dio().get(apiCheck).then((value) async {
      print('$value');
      if (value.toString() == 'null') {
       /* if (file == null) {
          insertImguser(
              username: username,
              fname: fname,
              lname: lname,
              licsenseplate: licsenseplate,
              mailuser: mailuser,
              passuser: passuser,
              phone: phone);
        } else {*/int i = Random().nextInt(100000);
          String apisaveiden = '${Constant.api}/safespace//saveiden.php';
          
          String nameiden = 'iden$i.jpg';
          Map<String, dynamic> map = Map();
          map['file'] =
              await MultipartFile.fromFile(file!.path, filename: nameiden);
          FormData data = FormData.fromMap(map);
          await Dio().post(apisaveiden, data: data).then((value) {
            iden = '/safespace/Imageiden/$nameiden';
          });
          String namevehi = 'vehicle$i.jpg';         
          String apisave = '${Constant.api}/safespace//saveimage.php';
          Map<String, dynamic> mapvehi = Map();
          mapvehi['fileVehi'] =
              await MultipartFile.fromFile(fileVehi!.path, filename: namevehi);
          FormData datavehi = FormData.fromMap(mapvehi);
          await Dio().post(apisave, data: datavehi).then((value) {
            vehicle = '/safespace/Imageuserdata/$namevehi';
          });
          insertImguser(
              username: username,
              fname: fname,
              lname: lname,
              licsenseplate: licsenseplate,
              mailuser: mailuser,
              passuser: passuser,
              phone: phone);
        }
       else {
        normalDialog(context, ' Username Registed , Please change username!');
      }
    });
  }

  Future<Null> insertImguser(
      {String? username,
      String? fname,
      String? lname,
      String? licsenseplate,
      String? mailuser,
      String? passuser,
      String? phone}) async {
    print('Iden :$iden ,vehicle :$vehicle ');
    String apiInsertdata =
        '${Constant.api}/safespace/regisuser.php?isAdd=true&username=$username&fname=$fname&lname=$lname&licsenseplate=$licsenseplate&mailuser=$mailuser&passuser=$passuser&phone=$phone &iden=$iden&vehicle=$vehicle';
    await Dio().get(apiInsertdata).then((value) {
      if (value.toString() == 'true') {
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
      }
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
                Container(
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
                           
                              getiden((ImageSource.gallery));
                           
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
                // addIden(size),
                makeBFvehicle(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Container(
                          width: 200,
                          height: 200,
                          child: fileVehi == null
                              ? ShowImage(path: 'images/layout.png')
                              : Image.file(fileVehi!)),
                      SizedBox(height: 40),
                      Container(
                        padding: EdgeInsets.only(
                          left: 30,
                        ),
                        child: ElevatedButton(
                          style: Constant().ourButton(),
                          onPressed: () {
                            
                              getvehi((ImageSource.gallery));
                            
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
                //addvehicle(),
                makeWarning(),
                makeButton(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getiden(ImageSource source) async {
    try {
      var result = await ImagePicker()
          .pickImage(source: source, maxWidth: 800, maxHeight: 800);
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  Future<void> getvehi(ImageSource source) async {
    try {
      var result = await ImagePicker()
          .pickImage(source: source, maxWidth: 800, maxHeight: 800);
      setState(() {
        fileVehi = File(result!.path);
      });
    } catch (e) {}
  }

  Row makeIsen(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 11, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: licsenseplatecontroller,
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

 
  Row makeUsername(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 11, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            controller: usernamecontroller,
            maxLength: 10,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter Username ';
              } else {}
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
                  insertdatauser();
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
            keyboardType: TextInputType.number,
            controller: phonecontroller,
            maxLength: 10,
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
            controller: passusercontroller,
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
            controller: mailusercontroller,
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
            controller: lnamecontroller,
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
            controller: fnamecontroller,
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

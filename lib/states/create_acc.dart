// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:demosafespace/utility/constant.dart';

class CreareAcc extends StatefulWidget {
  const CreareAcc({Key? key}) : super(key: key);

  @override
  State<CreareAcc> createState() => _CreareAccState();
}

class _CreareAccState extends State<CreareAcc> {
  bool statusRedEye = true;
  get childen => null;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constant.yello,
      body: SafeArea(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                makeTitalStart(),
                makeTitleC(),
                firstname(size),
                lastname(size),
                email(size),
                password(size),
                makePhonnuber(size),
                makeButton(size),
              ],
            ),
          ),
        ),
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
                if (formkey.currentState!.validate()) {}
              },
              child: Text(
                'Register Now',
                style: Constant().h4Style(),
              )),
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
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone number';
              } else {}
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

  Row password(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              } else {}
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
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your E-mail';
              } else {}
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
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your lastname';
              } else {}
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
          padding: EdgeInsets.only(top: 30, bottom: 10),
          width: size * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your firstname';
              } else {}
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
      padding: EdgeInsets.only(left: 20, top: 10),
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

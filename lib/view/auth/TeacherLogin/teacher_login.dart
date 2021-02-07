import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:imparoo_hackathon/core/constants/button_images.dart';
import 'package:imparoo_hackathon/core/models/Teacher.dart';
import 'package:imparoo_hackathon/core/components/background_container.dart';
import 'package:imparoo_hackathon/core/components/imparoo_image_container.dart';

// ignore: must_be_immutable
class TeacherLogin extends StatefulWidget {
  List<Teacher> teachers;
  TeacherLogin(this.teachers, {Key key}) : super(key: key);

  @override
  _TeacherLoginState createState() => _TeacherLoginState();
}

class _TeacherLoginState extends State<TeacherLogin> {
  String loginMsg;
  TextEditingController phoneText = TextEditingController();
  TextEditingController passText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              BackgroundContainer(),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 70, bottom: 20),
                    child: Center(
                      child: Text(
                        'HOŞGELDİN',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ImparooContainer(),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text(
                        'Öğretmen Girişi',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900),
                      ),
                    ),
                  ),
                  buildLoginFormField(context),
                  buildLoginButton(),
                  SizedBox(
                    height: 10,
                  ),
                  buildBackButton(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: always_declare_return_types
  loginControl() {
    for (var i = 0; i < widget.teachers?.length; i++) {
      if (phoneText.text == widget.teachers[i].phone &&
          passText.text == widget.teachers[i].pass) {
        setState(() {
          loginMsg = 'GİRİŞ BAŞARILI :)';
        });
        break;
      }
      setState(() {
        loginMsg = 'GİRİŞ BAŞARISIZ :(';
      });
    }
    showAlertDialog(context);
  }

  // ignore: always_declare_return_types
  showAlertDialog(BuildContext context) {
    // set up the AlertDialog

    var alert = AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        height: 180,
        width: 280,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Container(
          child: Center(
            child: Text(
              loginMsg,
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Comfortaa', fontSize: 20),
            ),
          ),
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: alert,
        );
      },
    );
  }

  FlatButton buildBackButton(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Container(
        color: Colors.transparent,
        height: 60,
        width: 180,
        child: Image.asset(
          ButtonImages.GERIBUTTON,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  FlatButton buildLoginButton() {
    return FlatButton(
      onPressed: () {
        //loginControl();
      },
      child: Container(
        height: 60,
        width: 180,
        child: Image.asset(
          ButtonImages.GIRISBUTTON,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Column buildLoginFormField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 160,
          padding: EdgeInsets.only(top: 60, left: 60, right: 60),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 60, bottom: 10),
                child: Text(
                  'Telefon Numarası',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                height: 60,
                child: TextField(
                  controller: phoneText,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(right: 10, left: 10)),
                  onSubmitted: (value) {
                    setState(() {
                      phoneText.text = value;
                    });
                  },
                ),
              )
            ],
          ),
        ),
        Container(
          height: 160,
          padding: EdgeInsets.only(top: 30, left: 60, right: 60),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 60, bottom: 10),
                child: Text(
                  'Şifre',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                height: 60,
                child: TextField(
                  controller: passText,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(right: 10, left: 10)),
                  onSubmitted: (value) {
                    setState(() {
                      passText.text = value;
                    });
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imparoo_hackathon/core/constants/button_images.dart';
import 'package:imparoo_hackathon/core/models/Student.dart';
import 'package:imparoo_hackathon/core/components/background_container.dart';
import 'package:imparoo_hackathon/core/components/imparoo_image_container.dart';
import 'package:imparoo_hackathon/core/widget/login_flat_button/student_flat_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class StudentLogin extends StatefulWidget {
  StudentLogin(this.students, {Key key}) : super(key: key);
  List<Student> students;

  @override
  _StudentLoginState createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
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
                        'Öğrenci Girişi',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildPhoneNumberField(context),
                      buildPasswordField(context)
                    ],
                  ),
                  StudentLoginButton(iconUrl: ButtonImages.GIRISBUTTON),
                  SizedBox(
                    height: 10,
                  ),
                  StudentLoginButton(iconUrl: ButtonImages.GERIBUTTON),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: always_declare_return_types
  loginControl() async {
    var prefs = await SharedPreferences.getInstance();

    for (var i = 0; i < widget.students?.length; i++) {
      if (phoneText.text == widget.students[i].phone &&
          passText.text == widget.students[i].pass) {
        setState(() {
          loginMsg = 'GİRİŞ BAŞARILI :)';
        });
        await prefs.setBool('isLogged', true);
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

  Container buildPhoneNumberField(BuildContext context) {
    return Container(
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
    );
  }

  Container buildPasswordField(BuildContext context) {
    return Container(
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
    );
  }
}

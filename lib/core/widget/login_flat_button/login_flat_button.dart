import 'package:flutter/material.dart';

import '../../../view/auth/StudentLogin/student_login.dart';
import '../../models/Student.dart';

class LoginFlatButton extends StatelessWidget {
  final String iconUrl;
  final List<Student> students;

  const LoginFlatButton({Key key, @required this.iconUrl, this.students})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        if (iconUrl == 'assets/images/ogretmenGirisButon.png') {
          // Navigator.push( context,MaterialPageRoute( builder: (_) => TeacherLogin(teachers))); // Ogretmen giris ekranina yonlendirilecek

        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => StudentLogin(students)));
        }
      },
      child: Container(
        color: Colors.transparent,
        height: 60,
        width: 180,
        child: Image.asset(
          iconUrl == 'assets/images/ogretmenGirisButon.png'
              ? 'assets/images/ogretmenGirisButon.png'
              : 'assets/images/ogrenciGirisButon.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

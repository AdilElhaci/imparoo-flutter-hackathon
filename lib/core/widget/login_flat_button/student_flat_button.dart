import 'package:flutter/material.dart';
import '../../../view/lesson/student_lessons.dart';

class StudentLoginButton extends StatelessWidget {
  final String iconUrl;
  const StudentLoginButton({Key key, @required this.iconUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        if (iconUrl == 'assets/images/geributon.png') {
          Navigator.pop(context);
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => StudentLessons()));
        }
      },
      child: Container(
        color: Colors.transparent,
        height: 60,
        width: 180,
        child: Image.asset(
          iconUrl == 'assets/images/geributon.png'
              ? 'assets/images/geributon.png'
              : 'assets/images/girisbuton.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

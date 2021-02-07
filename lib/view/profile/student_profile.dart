import 'package:flutter/material.dart';
import 'package:imparoo_hackathon/core/components/background_container.dart';
import 'package:imparoo_hackathon/view/auth/StudentLogin/student_login.dart';
import 'package:imparoo_hackathon/view/lesson/student_lessons.dart';
import 'package:imparoo_hackathon/core/constants/images_links.dart';

class StudentProfile extends StatefulWidget {
  StudentProfile({Key key}) : super(key: key);

  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundContainer(),
          buildProfileOptions(context),
        ],
      ),
    );
  }

  Column buildProfileOptions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 70, bottom: 20),
          child: Center(
            child: Text(
              'HOŞGELDİN ',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          ),
        ),
        Container(
          height: 130,
          width: 130,
          child: Image.asset(
            ImageGetir.AVATARIMAGE,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 180,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Text(
              'AVATAR DEGISTIR',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => StudentLessons()));
          },
          child: Container(
            width: MediaQuery.of(context).size.width - 60,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Text(
                'DERSLERİM',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 60,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.pink[100],
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Text(
              'ÖDEVLERİM',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 60,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.pink[100],
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Text(
              'SORULARIM',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 60,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.pink[100],
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Text(
              'GEÇMİŞ DERSLER',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 60,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.pink[100],
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Text(
              'BAŞARIMLAR',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => StudentLogin([])));
          },
          child: Container(
            width: MediaQuery.of(context).size.width - 200,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.red[300],
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Text(
                'ÇIKIŞ YAP',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

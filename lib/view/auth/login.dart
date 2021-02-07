import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:imparoo_hackathon/core/constants/button_images.dart';
import 'package:imparoo_hackathon/core/models/Student.dart';
import 'package:imparoo_hackathon/core/models/Teacher.dart';
import 'package:imparoo_hackathon/core/components/background_container.dart';
import 'package:imparoo_hackathon/core/components/imparoo_image_container.dart';
import 'package:imparoo_hackathon/core/widget/login_flat_button/login_flat_button.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<Student> students;
  List<Teacher> teachers;

  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    students = <Student>[];
    teachers = <Teacher>[];
    getStudents();
    getTeachers();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //alertdialog gelecek
        return null;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                BackgroundContainer(),
                buildLoginView(),
                buildStudentLoginButton(),
                buildTeacherLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getStudents() async {
    await db.collection('student').get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            setState(() {
              var item = Student(
                  name: doc['name'].toString(),
                  pass: doc['pass'].toString(),
                  phone: doc['phone'].toString(),
                  surname: doc['surname'].toString());
              students?.insert(0, item);
            });
          }),
        });
  }

  Future<void> getTeachers() async {
    await db.collection('teacher').get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            setState(() {
              var item = Teacher(
                  name: doc['name'].toString(),
                  pass: doc['pass'].toString(),
                  phone: doc['phone'].toString(),
                  surname: doc['surname'].toString());
              teachers?.insert(0, item);
            });
          }),
        });
  }

  Positioned buildTeacherLoginButton() {
    return Positioned(
        bottom: 140,
        left: 30,
        right: 30,
        child: LoginFlatButton(iconUrl: ButtonImages.OGRETMENGIRISBUTTON));
  }

  Positioned buildStudentLoginButton() {
    return Positioned(
        bottom: 230,
        left: 30,
        right: 30,
        child: LoginFlatButton(
          iconUrl: ButtonImages.OGRENCIGIRISBUTTON,
          students: students,
        ));
  }

  Column buildLoginView() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 70, bottom: 20),
          child: Center(
            child: Text(
              'GİRİŞ',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ImparooContainer(),
      ],
    );
  }
}

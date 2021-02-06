import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:imparoo_hackathon/view/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/lesson/student_lessons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  Future<bool> getPrefs() async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.getBool('isLogged');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imparoo',
      home: FutureBuilder<bool>(
        future: getPrefs(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.data == false || snapshot.data == null) {
            return Login();
          } else {
            return StudentLessons();
          }
        },
      ),
    );
  }
}

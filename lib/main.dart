import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:imparoo_hackathon/view/auth/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imparoo',
      home: Login(),
    );
  }
}

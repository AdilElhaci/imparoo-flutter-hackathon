import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:imparoo_hackathon/feature/components/video_conference_container.dart';
import 'package:imparoo_hackathon/view/lesson-records/student_recorded_lessons.dart';
import 'package:imparoo_hackathon/view/lesson/student_lessons.dart';
import 'package:imparoo_hackathon/view/questions/student_questions.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore: must_be_immutable
class MyNavBar extends StatefulWidget {
  String button1, button2, button3, button4, button5;
  MyNavBar(
    String button1,
    String button2,
    String button3,
    String button4,
    String button5, {
    Key key,
  }) {
    this.button1 = button1;
    this.button2 = button2;
    this.button3 = button3;
    this.button4 = button4;
    this.button5 = button5;
  }

  @override
  MyNavBarState createState() => MyNavBarState();
}

class MyNavBarState extends State<MyNavBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => StudentLessons()));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  width: 80,
                  height: 80,
                  child: Center(
                    child: Image.asset(
                      widget.button1,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 0),
                  child: Text(
                    'Derslerim',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => StudentQuestions()));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  width: 80,
                  height: 80,
                  child: Center(
                    child: Image.asset(
                      widget.button2,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 0),
                  child: Text(
                    'Sorular',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => StudentRecordedLesson()));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  width: 80,
                  height: 80,
                  child: Center(
                    child: Image.asset(
                      widget.button3,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 0),
                  child: Text(
                    'Kayıt',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  width: 80,
                  height: 80,
                  child: Center(
                    child: Image.asset(
                      widget.button4,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 0),
                  child: Text(
                    'Ödevler',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  width: 80,
                  height: 80,
                  child: Center(
                    child: Image.asset(
                      widget.button5,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 0),
                  child: Text(
                    'Başarımlar',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

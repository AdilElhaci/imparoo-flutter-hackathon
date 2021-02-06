import 'package:flutter/material.dart';
import 'package:imparoo_hackathon/view/lesson/student_lessons.dart';
import 'package:imparoo_hackathon/view/play-time/student_play_time.dart';

class StudentOnlineClass extends StatefulWidget {
  StudentOnlineClass({Key key}) : super(key: key);

  @override
  _StudentOnlineClassState createState() => _StudentOnlineClassState();
}

class _StudentOnlineClassState extends State<StudentOnlineClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildAppBar(context),
      body: buildOnlineClass(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildOnlinClassBottomNavBar(),
    );
  }

  Container buildOnlineClass(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => StudentPlayTime()));
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              width: 114,
              height: 44,
              decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(
                  'Teneffüs',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                child:
                    Image.asset('assets/images/imparo-sinif-siralar(1) 2.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 64.0, left: 89),
                child: Container(
                  height: 87,
                  width: 59,
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 64.0, left: 150),
                child: Container(
                  height: 87,
                  width: 59,
                  color: Colors.orange,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 154.0, left: 89),
                child: Container(
                  height: 87,
                  width: 59,
                  color: Colors.pink,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 154.0, left: 150),
                child: Container(
                  height: 87,
                  width: 59,
                  color: Colors.purple,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 50,
      backgroundColor: Colors.black,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => StudentLessons()));
                },
                child: Icon(
                  Icons.exit_to_app,
                  size: 40,
                  color: Colors.red,
                ),
              ),
              Icon(
                Icons.settings,
                size: 40,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
      leading: Container(),
    );
  }

  Container buildOnlinClassBottomNavBar() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Container(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'assets/images/emoji-el 1.png',
                      fit: BoxFit.fill,
                    )),
                Text(
                  'El Kaldır',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Container(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'assets/images/mikrofon.png',
                      fit: BoxFit.fill,
                    )),
                Text(
                  'Mikrofon',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Container(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'assets/images/camera.png',
                      fit: BoxFit.fill,
                    )),
                Text(
                  'Kamera',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Container(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'assets/images/emoji-gulme 1.png',
                      fit: BoxFit.fill,
                    )),
                Text(
                  'ifade',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

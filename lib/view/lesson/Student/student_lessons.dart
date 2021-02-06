import 'package:flutter/material.dart';
import 'package:imparoo_hackathon/core/components/bottom-nav-bar/my_bottom_navbar.dart';

class StudentLessons extends StatefulWidget {
  StudentLessons({Key key}) : super(key: key);

  @override
  _StudentLessonsState createState() => _StudentLessonsState();
}

class _StudentLessonsState extends State<StudentLessons> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Container(
        padding: EdgeInsets.all(20),
        child: buildLessonCard(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyNavBar(
          'assets/images/sayfalar-buton-dersler-2.png',
          'assets/images/sayfalar-buton-sorular-1.png',
          'assets/images/sayfalar-buton-kayit 1.png',
          'assets/images/sayfalar-buton-odevler 1.png',
          'assets/images/sayfalar-buton-basarim 1.png'),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => null /* StudentProfile() */));
                },
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.blue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  'DERSLER',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
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

  Column buildLessonCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 15),
          child: Text(
            'Bugun',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
        ),
        // alttaki container listview in icinde olacak
        buildLessonDetailCard(context, 'Matematik', '13 dakika'),
      ],
    );
  }

  Container buildLessonDetailCard(
      BuildContext context, String lessonName, String remainTime) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(28))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ders',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                Text(
                  lessonName,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Kalan Sure',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text(
                  remainTime,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          buildJoinLessonButton(context)
        ],
      ),
    );
  }

  Column buildJoinLessonButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => null /* StudentOnlineClass() */));
          },
          child: Container(
            width: 114,
            height: 44,
            decoration: BoxDecoration(
                color: Colors.green[700],
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Text(
                'Derse Katıl',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

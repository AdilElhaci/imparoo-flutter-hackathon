import 'package:flutter/material.dart';
import 'package:imparoo_hackathon/core/components/bottom-nav-bar/my_bottom_navbar.dart';

class StudentQuestions extends StatefulWidget {
  StudentQuestions({Key key}) : super(key: key);

  @override
  _StudentQuestionsState createState() => _StudentQuestionsState();
}

class _StudentQuestionsState extends State<StudentQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'DERS SORULARI',
              style: TextStyle(
                  fontSize: 34,
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
            ),
          ),
          buildQuestionCard(context),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyNavBar(
          'assets/images/sayfalar-buton-dersler 1.png',
          'assets/images/sayfalar-buton-sorular-2 1.png',
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

  Padding buildQuestionCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Stack(
        children: [
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
          Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Matematik',
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '0 Soru ',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        '0 Cevap',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              null /* StudentQuestionsOfLesson() */));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  padding: EdgeInsets.only(top: 0),
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      'INCELE',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

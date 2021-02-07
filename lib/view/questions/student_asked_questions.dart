import 'package:flutter/material.dart';
import 'package:imparoo_hackathon/core/components/bottom-nav-bar/my_bottom_navbar.dart';
import 'package:imparoo_hackathon/core/constants/button_images.dart';
import 'package:imparoo_hackathon/view/profile/student_profile.dart';

class StudentQuestionsOfLesson extends StatefulWidget {
  StudentQuestionsOfLesson({Key key}) : super(key: key);

  @override
  _StudentQuestionsOfLessonState createState() =>
      _StudentQuestionsOfLessonState();
}

class _StudentQuestionsOfLessonState extends State<StudentQuestionsOfLesson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: buildAskedQuestions(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyNavBar(
          ButtonImages.DERSLERBUTTON,
          ButtonImages.SORULARBUTTONCLICKED,
          ButtonImages.KAYITBUTTON,
          ButtonImages.ODEVLERBUTTON,
          ButtonImages.BASARIMBUTTON),
    );
  }

  Column buildAskedQuestions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: 200,
            child: Center(
              child: Text(
                'MATEMATİK',
                style: TextStyle(
                    fontSize: 34,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            width: 200,
            child: Center(
              child: Text(
                'SORULARI',
                style: TextStyle(
                    fontSize: 34,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {},
          child: Container(
            height: 30,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.greenAccent[700],
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                'SORU SOR',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
        buildSampleQuestion(context)
      ],
    );
  }

  Container buildSampleQuestion(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width - 20,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('12 deste arti 6 duzine kac yapar?',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.w900)),
          SizedBox(height: 20),
          Text('3 cevap',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.w900))
        ],
      ),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => StudentProfile()));
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
}

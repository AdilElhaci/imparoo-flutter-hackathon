import 'package:flutter/material.dart';
import 'package:imparoo_hackathon/view/online-class/student_online_class.dart';

class StudentPlayTime extends StatefulWidget {
  StudentPlayTime({Key key}) : super(key: key);

  @override
  _StudentPlayTimeState createState() => _StudentPlayTimeState();
}

class _StudentPlayTimeState extends State<StudentPlayTime> {
  String playTimeOn = 'assets/images/playtimeground.png';
  double leftMargin = 10;
  double rightMargin = 0;
  double upMargin = 200;
  double downMargin = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: buildPlayArena(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildBottomNavBar(),
    );
  }

  Container buildPlayArena(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              playTimeOn,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: upMargin,
                left: leftMargin,
                right: rightMargin,
                bottom: downMargin),
            height: 150,
            width: 46,
            child: Image.asset(
              'assets/images/student_girl.png',
              fit: BoxFit.fill,
            ),
          ),
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
                      MaterialPageRoute(builder: (_) => StudentOnlineClass()));
                },
                child: Icon(
                  Icons.exit_to_app,
                  size: 40,
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 34.0),
                child: Text(
                  'TENEFFÜS',
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

  Container buildBottomNavBar() {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[400],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 100,
              width: 70,
              color: Colors.orange,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 100,
              width: 70,
              color: Colors.red,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (upMargin >= 200) upMargin -= 10;
                  });
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey),
                  child: Center(
                    child: Icon(Icons.arrow_upward),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (leftMargin >= 10) leftMargin -= 10;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.grey),
                      child: Center(
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        leftMargin += 10;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.grey),
                      child: Center(
                        child: Icon(Icons.arrow_forward),
                      ),
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (upMargin < 400) upMargin += 10;
                  });
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey),
                  child: Center(
                    child: Icon(Icons.arrow_downward),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

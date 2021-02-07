import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:imparoo_hackathon/core/constants/images_links.dart';
import 'package:imparoo_hackathon/feature/components/video_conference_container.dart';
import 'package:imparoo_hackathon/view/play-time/student_play_time.dart';

class StudentOnlineClass extends StatefulWidget {
  StudentOnlineClass({Key key}) : super(key: key);

  @override
  _StudentOnlineClassState createState() => _StudentOnlineClassState();
}

class _StudentOnlineClassState extends State<StudentOnlineClass> {
  RtcEngine _engine;
  bool muted = false;

  @override
  void dispose() {
    // clear users
    // destroy sdk
    _engine.leaveChannel();
    _engine.destroy();
    super.dispose();
  }

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
                child: Image.asset(ImageGetir.IMPORASINIFSIRALAR),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 64.0, left: 89),
                child: Container(
                  height: 87,
                  width: 59,
                  color: Colors.orange,
                  child: CallPage(
                    channelName: 'test',
                    role: ClientRole.Broadcaster,
                    screenNo: 0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 64.0, left: 150),
                child: Container(
                  height: 87,
                  width: 59,
                  color: Colors.orange,
                  child: CallPage(
                    channelName: 'test',
                    role: ClientRole.Broadcaster,
                    screenNo: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 154.0, left: 89),
                child: Container(
                  height: 87,
                  width: 59,
                  color: Colors.pink,
                  child: CallPage(
                    channelName: 'test',
                    role: ClientRole.Broadcaster,
                    screenNo: 2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 154.0, left: 150),
                child: Container(
                  height: 87,
                  width: 59,
                  color: Colors.purple,
                  child: CallPage(
                    channelName: 'test',
                    role: ClientRole.Broadcaster,
                    screenNo: 3,
                  ),
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
                  _onCallEnd(context);
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
                      ImageGetir.EMOJIEL,
                      fit: BoxFit.fill,
                    )),
                Text(
                  'El Kaldır',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: _onToggleMute,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Container(
                      height: 30,
                      width: 30,
                      child: muted
                          ? Icon(Icons.mic_external_off)
                          : Image.asset(
                              ImageGetir.MIKROFON,
                              fit: BoxFit.fill,
                            )),
                  Text(
                    'Mikrofon',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: _onSwitchCamera,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Container(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        ImageGetir.CAMERAA,
                        fit: BoxFit.fill,
                      )),
                  Text(
                    'Kamera',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                  )
                ],
              ),
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
                      ImageGetir.EMOJIGULME,
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

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine.muteLocalAudioStream(muted);
  }

  void _onSwitchCamera() {
    _engine.switchCamera();
  }
}

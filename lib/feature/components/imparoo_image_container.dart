import 'package:flutter/material.dart';

class ImparooContainer extends StatelessWidget {
  const ImparooContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 00),
        height: 80,
        width: 280,
        child: Image.asset(
          'assets/images/imparoo.png',
          fit: BoxFit.fill,
        ));
  }
}

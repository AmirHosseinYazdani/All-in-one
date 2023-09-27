import 'package:flutter/material.dart';

class ScreenThree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScreenThreeState();
  }
}

class _ScreenThreeState extends State<ScreenThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: new Color(0xff622f74),
              gradient: LinearGradient(
                colors: [
                  new Color(0xffc471ed),
                  new Color(0xff12c2e9),
                ],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 75.0,
                child: Icon(
                  Icons.verified_user,
                  color: new Color(0xff12c2e9),
                  size: 50.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
              Text(
                // FlutterI18n.translate(context, "screen_three"),
                "screen_three",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

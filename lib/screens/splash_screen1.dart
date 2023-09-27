import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScreenOneState();
  }
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //   Duration(seconds: 4),
    //   () => Navigator.pushNamed(context, "/home"),
    // );
  }

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
                colors: [new Color(0xff0F2027), new Color(0xff203A43)],
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
                  Icons.account_balance,
                  color: new Color(0xff0F2027),
                  size: 50.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
              Text(
                // FlutterI18n.translate(context, "screen_one"),
                "screen_one",
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

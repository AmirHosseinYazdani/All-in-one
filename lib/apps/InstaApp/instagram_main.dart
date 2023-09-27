import 'package:flutter/material.dart';
import 'package:multi_app/apps/InstaApp/my_home_page.dart';

class InstagramMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'INSTAGRAM',
      theme: new ThemeData(
        fontFamily: 'Vazir',
        primaryColor: Colors.black,
        primaryIconTheme: IconThemeData(color: Colors.black),
        primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.black)),
      ),
      home: new MyHomePages(),
    );
  }
}

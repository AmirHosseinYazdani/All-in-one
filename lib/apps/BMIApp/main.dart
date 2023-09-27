import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_app/apps/BMIApp/screens/results_page.dart';

import 'screens/input_page.dart';

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0A0E21),
        scaffoldBackgroundColor: Color(0xff0A0E21),
      ),
      home: Directionality(
        child: InputPage(),
        textDirection: TextDirection.rtl,
      ),
      routes: {
        '/home': (context) => InputPage(),
        '/results_page': (context) => ResultsPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';

import 'price_screen.dart';

class CurrencyTickerMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff1b1c22),
        scaffoldBackgroundColor: Color(0xff1b1c22),
        cardColor: Color(0x22D7D7DB),
      ),
      home: PriceScreen(),
    );
  }
}

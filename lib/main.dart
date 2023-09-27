import 'package:flutter/material.dart';
import 'package:multi_app/apps/BMIApp/main.dart';
import 'package:multi_app/apps/CryptoTicker/currency_ticker_main.dart';
import 'package:multi_app/apps/FunsyCalculator/funzy_cal_main.dart';
import 'package:multi_app/apps/InstaApp/instagram_main.dart';
import 'package:multi_app/apps/LoginDemo/loginDemo_main.dart';
import 'package:multi_app/apps/XylophoneApp/xylophone_main.dart';
import 'package:multi_app/apps/bike_store/bike_store_main.dart';
import 'package:multi_app/screens/splash_screen3.dart';

import 'apps/BurstCounter/burst_counter_main.dart';
import 'apps/DiceeApp/dicee_main.dart';
import 'screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All in one',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0x40575757),
        // primaryColor: Color(0xFFE05E5E),
        appBarTheme: AppBarTheme(color: Color(0xFF000000)),
      ),
      home: ScreenTwo(),
      // home: MyHomePage(),
      routes: {
        '/home': (context) => MyHomePage(),
        '/currency': (context) => CurrencyTickerMain(),
        '/bmi': (context) => BMICalculator(),
        '/burst_counter': (context) => BurstCounter(),
        '/dicee': (context) => Dice(),
        '/xylophone': (context) => XylophoneApp(),
        '/funzy_cal': (context) => FunzyCalculatorApp(),
        '/instagram': (context) => InstagramMain(),
        // '/supermarket': (context) => SuperMarketMain(),
        '/login': (context) => LoginDemoMain(),
        '/bike_store': (context) => BikeStoreMain(),
        // '/flash_chat': (context) => FlashChat(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:multi_app/apps/bike_store/screens/home_screen.dart';
import 'package:multi_app/apps/bike_store/screens/splash_screen.dart';

class BikeStoreMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bicycle Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Bicycle Shop'),
      home: const SplashScreen(),
      // home: CartScreen(),
      routes: {
        'home': (context) => const MyHomePage(title: 'Bicycle Shop'),
      },
    );
  }
}

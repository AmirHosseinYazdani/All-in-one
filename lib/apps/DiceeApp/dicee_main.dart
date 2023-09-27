import 'dart:math';

import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDicNum = 2;
  int rightDicNum = 6;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TextButton(
                onPressed: () {
                  initRandonNum();
                },
                child: Image.asset('assets/images/dice$leftDicNum.png'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: TextButton(
                onPressed: () {
                  initRandonNum();
                },
                child: Image.asset('assets/images/dice$rightDicNum.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initRandonNum() {
    setState(() {
      leftDicNum = Random().nextInt(6) + 1;
      rightDicNum = Random().nextInt(6) + 1;
    });
  }
}

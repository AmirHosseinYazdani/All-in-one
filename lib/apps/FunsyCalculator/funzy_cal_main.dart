//https://search.muz.li/search/calculator%20app
import 'dart:async';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_app/apps/FunsyCalculator/draw_arc.dart';
import 'package:multi_app/apps/FunsyCalculator/functioning_circle_button.dart';
import 'package:multi_app/apps/FunsyCalculator/funzy_cal_constants.dart';
import 'package:multi_app/apps/FunsyCalculator/funzy_cal_data_change_notifier.dart';
import 'package:multi_app/apps/FunsyCalculator/number_lines.dart';
import 'package:provider/provider.dart';

import 'line_painter.dart';

class FunzyCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataChangeNotifier>(
      create: (context) => DataChangeNotifier(),
      builder: (context, child) => MaterialApp(
        title: 'Calculator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor:
              Provider.of<DataChangeNotifier>(context, listen: true).isNightMode ? Colors.black : Colors.white,
        ),
        home: FunzyCalHomePage(
          title: 'Calculator Home Page',
        ),
      ),
    );
  }
}

class FunzyCalHomePage extends StatefulWidget {
  final String? title;
  FunzyCalHomePage({this.title});

  @override
  _FunzyCalHomePageState createState() => _FunzyCalHomePageState();

  static _FunzyCalHomePageState? of(BuildContext context) => context.findAncestorStateOfType<_FunzyCalHomePageState>();
}

class _FunzyCalHomePageState extends State<FunzyCalHomePage> with TickerProviderStateMixin {
  String? _firstNumber = "0", _secondNumber, _result, _operator = '', lastItem;

  bool _isSecondNumber = false,
      _dotForFirstNumber = true,
      _dotForSecondNumber = false,
      _plusLineSelected = false,
      _minusLineSelected = false,
      _timesLineSelected = false,
      _divideLineSelected = false;

  late bool _firstButtonChangeColor = false,
      _secondButtonChangeColor,
      _thirdButtonChangeColor,
      _4thButtonChangeColor,
      _5thButtonChangeColor,
      _6thButtonChangeColor,
      _7thButtonChangeColor,
      _8thButtonChangeColor,
      _9thButtonChangeColor,
      _0thButtonChangeColor;

  bool _CButtonChangeColor = false,
      _percentageButtonChangeColor = false,
      _deleteButtonChangeColor = false,
      _dotButtonChangeColor = false,
      _equalsButtonChangeColor = false;

  double? numberSizeNormal, numberSizeBold;
  double? _firstButtonSize,
      _secondButtonSize,
      _thirdButtonSize,
      _4thButtonSize,
      _5thButtonSize,
      _6thButtonSize,
      _7thButtonSize,
      _8thButtonSize,
      _9thButtonSize,
      _0thButtonSize;

  Color? numberColor;

  int? _steps;

  set signString(String value) => setState(() => _operator = value);

  set isSecondNumber(bool value) => setState(() => _isSecondNumber = value);

  set isPlusLineSelected(bool value) => setState(() => _plusLineSelected = value);
  set isMinusLineSelected(bool value) => setState(() => _minusLineSelected = value);
  set isTimesLineSelected(bool value) => setState(() => _timesLineSelected = value);
  set isDivideLineSelected(bool value) => setState(() => _divideLineSelected = value);

  late Animation _animation;
  late AnimationController _animationController;
  late Timer timer;
  final double fps = 1 / 24;

  @override
  void initState() {
    _firstButtonChangeColor = false;
    _secondButtonChangeColor = false;
    _thirdButtonChangeColor = false;
    _4thButtonChangeColor = false;
    _5thButtonChangeColor = false;
    _6thButtonChangeColor = false;
    _7thButtonChangeColor = false;
    _8thButtonChangeColor = false;
    _9thButtonChangeColor = false;
    _0thButtonChangeColor = false;

    _animationController = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    _animation = Tween(begin: 3.0, end: 0.5)
        .animate(new CurvedAnimation(parent: _animationController, curve: Curves.fastLinearToSlowEaseIn));

    // _flexAnimationController = AnimationController(
    //     duration: Duration(milliseconds: 1500), vsync: this);
    // _flexAnimation = IntTween(begin: 1, end: 2).animate(new CurvedAnimation(
    //     parent: _flexAnimationController, curve: Curves.linear));

    timer = Timer.periodic(
      Duration(milliseconds: (fps * 1000).floor()),
      frameBuilder,
    );

    super.initState();
  }

  frameBuilder(dynamic timer) {
    setState(() {});
  }

  @override
  void dispose() {
    timer.cancel();
    _animationController.removeListener(_animationListener);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSizeHeight = MediaQuery.of(context).size.height;
    var screenSizeWidth = MediaQuery.of(context).size.width;
    // print("screenSize.height : $screenSizeHeight");
    // print("screenSize.width : $screenSizeWidth");

    numberSizeNormal = (screenSizeWidth * 5) / 100;
    numberSizeBold = (screenSizeWidth * 11) / 100;

    if (Provider.of<DataChangeNotifier>(context, listen: true).resetAllSelectedButtons == true) {
      setState(() {
        _firstButtonSize = numberSizeNormal;
        _secondButtonSize = numberSizeNormal;
        _thirdButtonSize = numberSizeNormal;
        _4thButtonSize = numberSizeNormal;
        _5thButtonSize = numberSizeNormal;
        _6thButtonSize = numberSizeNormal;
        _7thButtonSize = numberSizeNormal;
        _8thButtonSize = numberSizeNormal;
        _9thButtonSize = numberSizeNormal;
        _0thButtonSize = numberSizeNormal;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator".toUpperCase(),
          style: TextStyle(color: Color(0xffe14ecf), fontSize: 25),
        ),
        leading: IconButton(
          icon: GestureDetector(
            onTap: () {
              late AwesomeDialog dialog;
              dialog = AwesomeDialog(
                body: Text(
                  "No More Calculations? Wanna get out?",
                  // style: TextStyle(color: Colors.white, fontSize: 24),
                  style: TextStyle(color: Colors.white, fontSize: (screenSizeWidth * 5) / 100),
                  textAlign: TextAlign.center,
                ),
                context: context,
                dialogType: DialogType.question,
                headerAnimationLoop: false,
                animType: AnimType.topSlide,
                buttonsTextStyle: TextStyle(color: Colors.white, fontSize: 26),
                dialogBackgroundColor: Color(0x51FF00B7),
                dismissOnBackKeyPress: true,
                btnCancel: Container(
                  // height: 50,
                  // width: 100,
                  height: (screenSizeHeight * 6.2) / 100,
                  width: (screenSizeWidth * 23.6) / 100,
                  child: Center(
                    child: GestureDetector(
                      child: Text(
                        "stay :)",
                        // style: TextStyle(color: Colors.white, fontSize: 26),
                        style: TextStyle(color: Colors.white, fontSize: (screenSizeWidth * 6) / 100),
                      ),
                      onTap: () {
                        dialog.dismiss();
                      },
                    ),
                  ),
                ),
                btnOk: Container(
                  // height: 50,
                  // width: 100,
                  height: (screenSizeHeight * 6.2) / 100,
                  width: (screenSizeWidth * 23.6) / 100,
                  child: Center(
                    child: GestureDetector(
                      child: Text(
                        "I'm done :(",
                        // style: TextStyle(color: Colors.white, fontSize: 26),
                        style: TextStyle(color: Colors.white, fontSize: (screenSizeWidth * 6) / 100),
                      ),
                      onTap: () {
                        exit(0);
                      },
                    ),
                  ),
                ),
              )..show();
            },
            child: Icon(
              Icons.close,
              size: 35,
              color: Color(0xffe14ecf),
            ),
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Align(
            child: MyArc(
              circleName: Constants.shadowCircleName,
              diameter: (screenSizeWidth * 45) / 100,
            ),
            alignment: Alignment.centerLeft,
          ),
          DrawWhiteCircle(
              screenSizeWidth: screenSizeWidth,
              screenSizeHeight: screenSizeHeight,
              plusLineSelected: _plusLineSelected,
              minusLineSelected: _minusLineSelected,
              timesLineSelected: _timesLineSelected,
              divideLineSelected: _divideLineSelected),
          Align(
            child: MyArc(
                circleName: Constants.topCircleName,
                diameter: ((screenSizeWidth * 82.6) / 100)), //Constants.topCircleDiameter = 350
            alignment: Alignment.centerLeft,
          ),
          Align(
              //text fields
              child: Container(
                // height: 150,
                // width: 150,
                height: (screenSizeHeight * 18.7) / 100,
                width: (screenSizeWidth * 35.4) / 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _firstNumber != null && _isSecondNumber == false
                          ? _firstNumber!
                          : _firstNumber != null && _isSecondNumber == true
                              ? _firstNumber!
                              : "0",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      _operator != null ? _operator! : "",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      _secondNumber != null && _isSecondNumber == true ? _secondNumber! : "",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                    Text(
                      _result == null ? "" : _result!,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
              ),
              alignment: Alignment.centerLeft),
          Align(
            child: Stack(
              children: [
                MyArc(
                  circleName: Constants.borderCircleName,
                  diameter: (screenSizeWidth * 188.8) / 100, //Constants.borderCircleDiameter = 800
                ),
              ],
            ),
          ),
          FunctioningCircleButtons(smallButtonSize: (screenSizeWidth * 13.2) / 100),
          NumberLines(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                // height: 55,
                height: (screenSizeHeight * 6.8) / 100,
              ),
              buildNumber(
                text: "1",
                // width: 70,
                width: (screenSizeWidth * 16) / 100,
                degree: -35,
                color: _firstButtonChangeColor ? Colors.pink : Colors.grey,
                size: _firstButtonChangeColor ? numberSizeBold : numberSizeNormal,
                scaleSize: _firstButtonChangeColor ? _animation.value : 1,
              ),
              SizedBox(
                // height: 10,
                height: (screenSizeHeight * 1.25) / 100,
              ),
              buildNumber(
                text: "2",
                // width: 35,
                width: (screenSizeWidth * 8.2) / 100,
                degree: -30,
                color: _secondButtonChangeColor ? Colors.pink : Colors.grey,
                size: _secondButtonChangeColor ? numberSizeBold : numberSizeNormal,
                scaleSize: _secondButtonChangeColor ? _animation.value : 1,
              ),
              SizedBox(
                // height: 10,
                height: (screenSizeHeight * 1.25) / 100,
              ),
              buildNumber(
                text: "3",
                // width: 20,
                width: (screenSizeWidth * 4.7) / 100,
                degree: -25,
                color: _thirdButtonChangeColor ? Colors.pink : Colors.grey,
                size: _thirdButtonChangeColor ? numberSizeBold : numberSizeNormal,
                scaleSize: _thirdButtonChangeColor ? _animation.value : 1,
              ),
              SizedBox(
                // height: 10,
                height: (screenSizeHeight * 1.25) / 100,
              ),
              buildNumber(
                text: "4",
                // width: 10,
                width: (screenSizeWidth * 2.35) / 100,
                degree: -20,
                color: _4thButtonChangeColor ? Colors.pink : Colors.grey,
                size: _4thButtonChangeColor ? numberSizeBold : numberSizeNormal,
                scaleSize: _4thButtonChangeColor ? _animation.value : 1,
              ),
              SizedBox(
                // height: 10,
                height: (screenSizeHeight * 1.25) / 100,
              ),
              buildNumber(
                text: "5",
                // width: 5,
                width: (screenSizeWidth * 1.1) / 100,
                degree: 0,
                color: _5thButtonChangeColor ? Colors.pink : Colors.grey,
                size: _5thButtonChangeColor ? numberSizeBold : numberSizeNormal,
                scaleSize: _5thButtonChangeColor ? _animation.value : 1,
              ),
              SizedBox(
                // height: 10,
                height: (screenSizeHeight * 1.25) / 100,
              ),
              buildNumber(
                text: "6",
                // width: 6,
                width: (screenSizeWidth * 1.4) / 100,
                degree: 10,
                color: _6thButtonChangeColor ? Colors.pink : Colors.grey,
                size: _6thButtonChangeColor ? numberSizeBold : numberSizeNormal,
                scaleSize: _6thButtonChangeColor ? _animation.value : 1,
              ),
              SizedBox(
                // height: 10,
                height: (screenSizeHeight * 1.25) / 100,
              ),
              buildNumber(
                text: "7",
                // width: 10,
                width: (screenSizeWidth * 2.35) / 100,
                degree: 20,
                color: _7thButtonChangeColor ? Colors.pink : Colors.grey,
                size: _7thButtonChangeColor ? numberSizeBold : numberSizeNormal,
                scaleSize: _7thButtonChangeColor ? _animation.value : 1,
              ),
              SizedBox(
                // height: 10,
                height: (screenSizeHeight * 1.25) / 100,
              ),
              buildNumber(
                text: "8",
                // width: 30,
                width: (screenSizeWidth * 6.5) / 100,
                degree: 30,
                color: _8thButtonChangeColor ? Colors.pink : Colors.grey,
                size: _8thButtonChangeColor ? numberSizeBold : numberSizeNormal,
                scaleSize: _8thButtonChangeColor ? _animation.value : 1,
              ),
              SizedBox(
                // height: 10,
                height: (screenSizeHeight * 1.25) / 100,
              ),
              buildNumber(
                text: "9",
                // width: 50,
                width: (screenSizeWidth * 11.8) / 100,
                degree: 40,
                color: _9thButtonChangeColor ? Colors.pink : Colors.grey,
                size: _9thButtonChangeColor ? numberSizeBold : numberSizeNormal,
                scaleSize: _9thButtonChangeColor ? _animation.value : 1,
              ),
              SizedBox(
                // height: 10,
                height: (screenSizeHeight * 1.25) / 100,
              ),
              buildNumber(
                text: "0",
                // width: 100,
                width: (screenSizeWidth * 23.6) / 100,
                degree: 50,
                color: _0thButtonChangeColor ? Colors.pink : Colors.grey,
                size: _0thButtonChangeColor ? numberSizeBold : numberSizeNormal,
                scaleSize: _0thButtonChangeColor ? _animation.value : 1,
              ),
              SizedBox(
                // height: 50,
                height: (screenSizeHeight * 6.2) / 100,
              ),
            ],
          ),
          Padding(
            // padding: const EdgeInsets.only(bottom: 15),
            padding: EdgeInsets.only(bottom: (screenSizeHeight * 1.87) / 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: (screenSizeHeight * 2) / 100,
                ),
                Expanded(
                  flex: _CButtonChangeColor ? 2 : 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Provider.of<DataChangeNotifier>(context, listen: false).updateAllSelectedButtons(true);
                            _CButtonChangeColor = true;
                            _dotButtonChangeColor = false;
                            _deleteButtonChangeColor = false;
                            _percentageButtonChangeColor = false;
                            _equalsButtonChangeColor = false;
                            _firstNumber = "0";
                            _operator = '';
                            _secondNumber = "";
                            _result = "";
                            _isSecondNumber = false;
                            _plusLineSelected = false;
                            _minusLineSelected = false;
                            _timesLineSelected = false;
                            _divideLineSelected = false;
                            _firstButtonChangeColor = false;
                            _secondButtonChangeColor = false;
                            _thirdButtonChangeColor = false;
                            _4thButtonChangeColor = false;
                            _5thButtonChangeColor = false;
                            _6thButtonChangeColor = false;
                            _7thButtonChangeColor = false;
                            _8thButtonChangeColor = false;
                            _9thButtonChangeColor = false;
                            _0thButtonChangeColor = false;
                            Provider.of<DataChangeNotifier>(context, listen: false).update1stLineColor(false);
                            Provider.of<DataChangeNotifier>(context, listen: false).update2ndLineColor(false);
                            Provider.of<DataChangeNotifier>(context, listen: false).update3rdLineColor(false);
                            Provider.of<DataChangeNotifier>(context, listen: false).update4thLineColor(false);
                            Provider.of<DataChangeNotifier>(context, listen: false).update5thLineColor(false);
                            Provider.of<DataChangeNotifier>(context, listen: false).update6thLineColor(false);
                            Provider.of<DataChangeNotifier>(context, listen: false).update7thLineColor(false);
                            Provider.of<DataChangeNotifier>(context, listen: false).update8thLineColor(false);
                            Provider.of<DataChangeNotifier>(context, listen: false).update9thLineColor(false);
                            Provider.of<DataChangeNotifier>(context, listen: false).update0thLineColor(false);
                          });
                        },
                        child: buildBottomButtons(
                          color: _CButtonChangeColor ? Constants.activeFunctionColor : Constants.deactiveFunctionColor,
                          height: _CButtonChangeColor ? (screenSizeHeight * 6.2) / 100 : 35,
                          child: Center(
                            child: Text(
                              "C",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  // width: 10,
                  width: (screenSizeHeight * 2.3) / 100,
                ),
                Expanded(
                  flex: _percentageButtonChangeColor ? 2 : 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _CButtonChangeColor = false;
                        _percentageButtonChangeColor = true;
                        _dotButtonChangeColor = false;
                        _deleteButtonChangeColor = false;
                        _equalsButtonChangeColor = false;

                        _operator = String.fromCharCode(0x25); //percentage
                        _isSecondNumber = true;
                      });
                    },
                    child: buildBottomButtons(
                      color: _percentageButtonChangeColor
                          ? Constants.activeFunctionColor
                          : Constants.deactiveFunctionColor,
                      height: _percentageButtonChangeColor ? (screenSizeHeight * 6.2) / 100 : 35,
                      child: Icon(
                        FontAwesomeIcons.percent,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  // width: 10,
                  width: (screenSizeHeight * 2.3) / 100,
                ),
                Expanded(
                  flex: _deleteButtonChangeColor ? 2 : 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _CButtonChangeColor = false;
                        _dotButtonChangeColor = false;
                        _deleteButtonChangeColor = true;
                        _percentageButtonChangeColor = false;
                        _equalsButtonChangeColor = false;
                        if (_steps == 0) {
                          _firstNumber = "0";
                        } else {
                          _secondNumber = "";
                          _operator = "";
                        }
                      });
                    },
                    child: buildBottomButtons(
                      color: _deleteButtonChangeColor ? Constants.activeFunctionColor : Constants.deactiveFunctionColor,
                      // height: 50,
                      height: _deleteButtonChangeColor ? (screenSizeHeight * 6.2) / 100 : 35,
                      child: Center(
                        child: Text(
                          "Delete",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: _deleteButtonChangeColor ? 22 : 15,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  // width: 10,
                  width: (screenSizeHeight * 2.3) / 100,
                ),
                Expanded(
                  flex: _dotButtonChangeColor ? 2 : 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _CButtonChangeColor = false;
                        _deleteButtonChangeColor = false;
                        _percentageButtonChangeColor = false;
                        _dotButtonChangeColor = true;
                        _equalsButtonChangeColor = false;

                        if (_isSecondNumber == true && _dotForSecondNumber == true) {
                          if (_secondNumber!.contains(".")) {
                            _secondNumber = _secondNumber! + ".";
                          }
                        }
                        if (_isSecondNumber == false && _dotForFirstNumber == true) {
                          _dotForSecondNumber = true;
                          if (_firstNumber!.contains(".")) {
                            _firstNumber = _firstNumber! + ".";
                          }
                        }
                      });
                    },
                    child: buildBottomButtons(
                      color: _dotButtonChangeColor ? Constants.activeFunctionColor : Constants.deactiveFunctionColor,
                      height: _dotButtonChangeColor ? (screenSizeHeight * 6.2) / 100 : 35,
                      child: Icon(
                        Icons.circle,
                        size: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  // width: 10,
                  width: (screenSizeHeight * 2.3) / 100,
                ),
                Expanded(
                  flex: _equalsButtonChangeColor ? 2 : 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _CButtonChangeColor = false;
                        _dotButtonChangeColor = false;
                        _deleteButtonChangeColor = false;
                        _percentageButtonChangeColor = false;
                        _equalsButtonChangeColor = true;

                        double a = double.parse(_firstNumber!);
                        double b = double.parse(_secondNumber!);
                        if (_operator == String.fromCharCode(0x25)) {
                          _result = isInteger(a % b) ? (a % b).toStringAsFixed(0) : (a % b).toStringAsFixed(4);
                        } else if (_operator == "+") {
                          _result = isInteger(a + b) ? (a + b).toStringAsFixed(0) : (a + b).toStringAsFixed(4);
                        } else if (_operator == "-") {
                          _result = isInteger(a - b) ? (a - b).toStringAsFixed(0) : (a - b).toStringAsFixed(4);
                        } else if (_operator == String.fromCharCode(0x00D7)) {
                          _result = isInteger(a * b) ? (a * b).toStringAsFixed(0) : (a * b).toStringAsFixed(4);
                        } else if (_operator == String.fromCharCode(0x00F7)) {
                          _result = isInteger(a / b) ? (a / b).toStringAsFixed(0) : (a / b).toStringAsFixed(4);
                        }
                      });
                    },
                    child: buildBottomButtons(
                      color: _equalsButtonChangeColor ? Constants.activeFunctionColor : Constants.deactiveFunctionColor,
                      height: _equalsButtonChangeColor ? (screenSizeHeight * 6.2) / 100 : 35,
                      child: Icon(
                        FontAwesomeIcons.equals,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: (screenSizeHeight * 2) / 100,
                ),
              ],
            ),
          ),
          Align(
            child: Padding(
              // padding: const EdgeInsets.only(right: 18.0),
              padding: EdgeInsets.only(right: (screenSizeWidth * 4.2) / 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Provider.of<DataChangeNotifier>(context, listen: true).isNightMode
                        ? Icons.wb_sunny_outlined
                        : Icons.nightlight_round,
                    size: 32,
                    color:
                        Provider.of<DataChangeNotifier>(context, listen: true).isNightMode ? Colors.white : Colors.grey,
                  ),
                  SizedBox(
                    // width: 10,
                    width: (screenSizeWidth * 2.3) / 100,
                  ),
                  CupertinoSwitch(
                    value: Provider.of<DataChangeNotifier>(context, listen: true).isNightMode,
                    onChanged: (value) {
                      setState(() {
                        Provider.of<DataChangeNotifier>(context, listen: false).updateNightMode(value);
                      });
                    },
                    activeColor: Colors.pinkAccent,
                  ),
                ],
              ),
            ),
            alignment: Alignment.topRight,
          ),
        ],
      ),
    );
  }

  bool isInteger(double value) {
    if (value - value.roundToDouble() != 0) {
      return false;
    } else {
      return true;
    }
  }

  Widget buildBottomButtons({double height = 35, double? width, Widget? child, Color? color}) {
    return AnimatedSize(
      curve: Curves.easeInToLinear,
      duration: Duration(milliseconds: 600),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(35),
        ),
        child: child,
      ),
    );
  }

  _animationListener() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    }
  }

  Widget buildNumber(
      {required int degree, double? width, required String text, Color? color, double? size, double? scaleSize}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RotationTransition(
            turns: AlwaysStoppedAnimation(degree / 360),
            child: TextButton(
              onPressed: () {
                _animationController.forward();
                _animationController.addListener(_animationListener);
                setState(() {
                  updateNumberLineColorsAndSizes(text: text);
                  doTheRest(text: text);
                });
              },
              child: FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  text,
                  textScaleFactor: scaleSize,
                  style: TextStyle(
                    fontSize: numberSizeNormal,
                    // fontSize: _numberSize,
                    color: color,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: width,
          ),
        ],
      ),
    );
  }

  void updateNumberLineColorsAndSizes({String? text}) {
    if (text == '0') {
      _0thButtonChangeColor = true;
      _firstButtonChangeColor = false;
      _secondButtonChangeColor = false;
      _thirdButtonChangeColor = false;
      _4thButtonChangeColor = false;
      _5thButtonChangeColor = false;
      _6thButtonChangeColor = false;
      _7thButtonChangeColor = false;
      _8thButtonChangeColor = false;
      _9thButtonChangeColor = false;

      _0thButtonSize = numberSizeBold;
      _firstButtonSize = numberSizeNormal;
      _secondButtonSize = numberSizeNormal;
      _thirdButtonSize = numberSizeNormal;
      _4thButtonSize = numberSizeNormal;
      _5thButtonSize = numberSizeNormal;
      _6thButtonSize = numberSizeNormal;
      _7thButtonSize = numberSizeNormal;
      _8thButtonSize = numberSizeNormal;
      _9thButtonSize = numberSizeNormal;

      Provider.of<DataChangeNotifier>(context, listen: false).update0thLineColor(true);
      Provider.of<DataChangeNotifier>(context, listen: false).update1stLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update2ndLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update3rdLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update4thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update5thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update6thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update7thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update8thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update9thLineColor(false);
    } else if (text == '1') {
      _0thButtonChangeColor = false;
      _firstButtonChangeColor = true;
      _secondButtonChangeColor = false;
      _thirdButtonChangeColor = false;
      _4thButtonChangeColor = false;
      _5thButtonChangeColor = false;
      _6thButtonChangeColor = false;
      _7thButtonChangeColor = false;
      _8thButtonChangeColor = false;
      _9thButtonChangeColor = false;

      _0thButtonSize = numberSizeNormal;
      _firstButtonSize = numberSizeBold;
      _secondButtonSize = numberSizeNormal;
      _thirdButtonSize = numberSizeNormal;
      _4thButtonSize = numberSizeNormal;
      _5thButtonSize = numberSizeNormal;
      _6thButtonSize = numberSizeNormal;
      _7thButtonSize = numberSizeNormal;
      _8thButtonSize = numberSizeNormal;
      _9thButtonSize = numberSizeNormal;

      Provider.of<DataChangeNotifier>(context, listen: false).update0thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update1stLineColor(true);
      Provider.of<DataChangeNotifier>(context, listen: false).update2ndLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update3rdLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update4thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update5thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update6thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update7thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update8thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update9thLineColor(false);
    } else if (text == '2') {
      _0thButtonChangeColor = false;
      _firstButtonChangeColor = false;
      _secondButtonChangeColor = true;
      _thirdButtonChangeColor = false;
      _4thButtonChangeColor = false;
      _5thButtonChangeColor = false;
      _6thButtonChangeColor = false;
      _7thButtonChangeColor = false;
      _8thButtonChangeColor = false;
      _9thButtonChangeColor = false;

      _0thButtonSize = numberSizeNormal;
      _firstButtonSize = numberSizeNormal;
      _secondButtonSize = numberSizeBold;
      _thirdButtonSize = numberSizeNormal;
      _4thButtonSize = numberSizeNormal;
      _5thButtonSize = numberSizeNormal;
      _6thButtonSize = numberSizeNormal;
      _7thButtonSize = numberSizeNormal;
      _8thButtonSize = numberSizeNormal;
      _9thButtonSize = numberSizeNormal;

      Provider.of<DataChangeNotifier>(context, listen: false).update0thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update1stLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update2ndLineColor(true);
      Provider.of<DataChangeNotifier>(context, listen: false).update3rdLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update4thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update5thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update6thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update7thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update8thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update9thLineColor(false);
    } else if (text == '3') {
      _0thButtonChangeColor = false;
      _firstButtonChangeColor = false;
      _secondButtonChangeColor = false;
      _thirdButtonChangeColor = true;
      _4thButtonChangeColor = false;
      _5thButtonChangeColor = false;
      _6thButtonChangeColor = false;
      _7thButtonChangeColor = false;
      _8thButtonChangeColor = false;
      _9thButtonChangeColor = false;

      _0thButtonSize = numberSizeNormal;
      _firstButtonSize = numberSizeNormal;
      _secondButtonSize = numberSizeNormal;
      _thirdButtonSize = numberSizeBold;
      _4thButtonSize = numberSizeNormal;
      _5thButtonSize = numberSizeNormal;
      _6thButtonSize = numberSizeNormal;
      _7thButtonSize = numberSizeNormal;
      _8thButtonSize = numberSizeNormal;
      _9thButtonSize = numberSizeNormal;

      Provider.of<DataChangeNotifier>(context, listen: false).update0thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update1stLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update2ndLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update3rdLineColor(true);
      Provider.of<DataChangeNotifier>(context, listen: false).update4thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update5thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update6thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update7thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update8thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update9thLineColor(false);
    } else if (text == '4') {
      _0thButtonChangeColor = false;
      _firstButtonChangeColor = false;
      _secondButtonChangeColor = false;
      _thirdButtonChangeColor = false;
      _4thButtonChangeColor = true;
      _5thButtonChangeColor = false;
      _6thButtonChangeColor = false;
      _7thButtonChangeColor = false;
      _8thButtonChangeColor = false;
      _9thButtonChangeColor = false;

      _0thButtonSize = numberSizeNormal;
      _firstButtonSize = numberSizeNormal;
      _secondButtonSize = numberSizeNormal;
      _thirdButtonSize = numberSizeNormal;
      _4thButtonSize = numberSizeBold;
      _5thButtonSize = numberSizeNormal;
      _6thButtonSize = numberSizeNormal;
      _7thButtonSize = numberSizeNormal;
      _8thButtonSize = numberSizeNormal;
      _9thButtonSize = numberSizeNormal;

      Provider.of<DataChangeNotifier>(context, listen: false).update0thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update1stLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update2ndLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update3rdLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update4thLineColor(true);
      Provider.of<DataChangeNotifier>(context, listen: false).update5thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update6thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update7thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update8thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update9thLineColor(false);
    } else if (text == '5') {
      _0thButtonChangeColor = false;
      _firstButtonChangeColor = false;
      _secondButtonChangeColor = false;
      _thirdButtonChangeColor = false;
      _4thButtonChangeColor = false;
      _5thButtonChangeColor = true;
      _6thButtonChangeColor = false;
      _7thButtonChangeColor = false;
      _8thButtonChangeColor = false;
      _9thButtonChangeColor = false;

      _0thButtonSize = numberSizeNormal;
      _firstButtonSize = numberSizeNormal;
      _secondButtonSize = numberSizeNormal;
      _thirdButtonSize = numberSizeNormal;
      _4thButtonSize = numberSizeNormal;
      _5thButtonSize = numberSizeBold;
      _6thButtonSize = numberSizeNormal;
      _7thButtonSize = numberSizeNormal;
      _8thButtonSize = numberSizeNormal;
      _9thButtonSize = numberSizeNormal;

      Provider.of<DataChangeNotifier>(context, listen: false).update0thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update1stLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update2ndLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update3rdLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update4thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update5thLineColor(true);
      Provider.of<DataChangeNotifier>(context, listen: false).update6thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update7thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update8thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update9thLineColor(false);
    } else if (text == '6') {
      _0thButtonChangeColor = false;
      _firstButtonChangeColor = false;
      _secondButtonChangeColor = false;
      _thirdButtonChangeColor = false;
      _4thButtonChangeColor = false;
      _5thButtonChangeColor = false;
      _6thButtonChangeColor = true;
      _7thButtonChangeColor = false;
      _8thButtonChangeColor = false;
      _9thButtonChangeColor = false;

      _0thButtonSize = numberSizeNormal;
      _firstButtonSize = numberSizeNormal;
      _secondButtonSize = numberSizeNormal;
      _thirdButtonSize = numberSizeNormal;
      _4thButtonSize = numberSizeNormal;
      _5thButtonSize = numberSizeNormal;
      _6thButtonSize = numberSizeBold;
      _7thButtonSize = numberSizeNormal;
      _8thButtonSize = numberSizeNormal;
      _9thButtonSize = numberSizeNormal;

      Provider.of<DataChangeNotifier>(context, listen: false).update0thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update1stLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update2ndLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update3rdLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update4thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update5thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update6thLineColor(true);
      Provider.of<DataChangeNotifier>(context, listen: false).update7thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update8thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update9thLineColor(false);
    } else if (text == '7') {
      _0thButtonChangeColor = false;
      _firstButtonChangeColor = false;
      _secondButtonChangeColor = false;
      _thirdButtonChangeColor = false;
      _4thButtonChangeColor = false;
      _5thButtonChangeColor = false;
      _6thButtonChangeColor = false;
      _7thButtonChangeColor = true;
      _8thButtonChangeColor = false;
      _9thButtonChangeColor = false;

      _0thButtonSize = numberSizeNormal;
      _firstButtonSize = numberSizeNormal;
      _secondButtonSize = numberSizeNormal;
      _thirdButtonSize = numberSizeNormal;
      _4thButtonSize = numberSizeNormal;
      _5thButtonSize = numberSizeNormal;
      _6thButtonSize = numberSizeNormal;
      _7thButtonSize = numberSizeBold;
      _8thButtonSize = numberSizeNormal;
      _9thButtonSize = numberSizeNormal;

      Provider.of<DataChangeNotifier>(context, listen: false).update0thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update1stLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update2ndLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update3rdLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update4thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update5thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update6thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update7thLineColor(true);
      Provider.of<DataChangeNotifier>(context, listen: false).update8thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update9thLineColor(false);
    } else if (text == '8') {
      _0thButtonChangeColor = false;
      _firstButtonChangeColor = false;
      _secondButtonChangeColor = false;
      _thirdButtonChangeColor = false;
      _4thButtonChangeColor = false;
      _5thButtonChangeColor = false;
      _6thButtonChangeColor = false;
      _7thButtonChangeColor = false;
      _8thButtonChangeColor = true;
      _9thButtonChangeColor = false;

      _0thButtonSize = numberSizeNormal;
      _firstButtonSize = numberSizeNormal;
      _secondButtonSize = numberSizeNormal;
      _thirdButtonSize = numberSizeNormal;
      _4thButtonSize = numberSizeNormal;
      _5thButtonSize = numberSizeNormal;
      _6thButtonSize = numberSizeNormal;
      _7thButtonSize = numberSizeNormal;
      _8thButtonSize = numberSizeBold;
      _9thButtonSize = numberSizeNormal;

      Provider.of<DataChangeNotifier>(context, listen: false).update0thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update1stLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update2ndLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update3rdLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update4thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update5thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update6thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update7thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update8thLineColor(true);
      Provider.of<DataChangeNotifier>(context, listen: false).update9thLineColor(false);
    } else if (text == '9') {
      _0thButtonChangeColor = false;
      _firstButtonChangeColor = false;
      _secondButtonChangeColor = false;
      _thirdButtonChangeColor = false;
      _4thButtonChangeColor = false;
      _5thButtonChangeColor = false;
      _6thButtonChangeColor = false;
      _7thButtonChangeColor = false;
      _8thButtonChangeColor = false;
      _9thButtonChangeColor = true;

      _0thButtonSize = numberSizeNormal;
      _firstButtonSize = numberSizeNormal;
      _secondButtonSize = numberSizeNormal;
      _thirdButtonSize = numberSizeNormal;
      _4thButtonSize = numberSizeNormal;
      _5thButtonSize = numberSizeNormal;
      _6thButtonSize = numberSizeNormal;
      _7thButtonSize = numberSizeNormal;
      _8thButtonSize = numberSizeNormal;
      _9thButtonSize = numberSizeBold;

      Provider.of<DataChangeNotifier>(context, listen: false).update0thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update1stLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update2ndLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update3rdLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update4thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update5thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update6thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update7thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update8thLineColor(false);
      Provider.of<DataChangeNotifier>(context, listen: false).update9thLineColor(true);
    }
  }

  void doTheRest({required String text}) {
    int inputNumber = int.parse(text);
    if (_isSecondNumber == false) {
      if (_firstNumber == null && inputNumber == 0) {
        _firstNumber = '0';
      } else if (_firstNumber != null && _firstNumber != "0") {
        _firstNumber = _firstNumber! + inputNumber.toString();
      } else {
        _firstNumber = inputNumber.toString();
      }
    } else {
      if (_secondNumber == null && inputNumber == 0) {
        _secondNumber = '0';
      } else if (_secondNumber != null && _secondNumber != "0") {
        _secondNumber = _secondNumber! + inputNumber.toString();
        _steps = _steps! + 1;
      } else {
        _secondNumber = inputNumber.toString();
      }
    }
  }
}

class DrawWhiteCircle extends StatelessWidget {
  const DrawWhiteCircle({
    Key? key,
    this.screenSizeWidth,
    this.screenSizeHeight,
    bool? plusLineSelected,
    bool? minusLineSelected,
    bool? timesLineSelected,
    bool? divideLineSelected,
  })  : _plusLineSelected = plusLineSelected,
        _minusLineSelected = minusLineSelected,
        _timesLineSelected = timesLineSelected,
        _divideLineSelected = divideLineSelected,
        super(key: key);

  final double? screenSizeWidth;
  final double? screenSizeHeight;
  final bool? _plusLineSelected;
  final bool? _minusLineSelected;
  final bool? _timesLineSelected;
  final bool? _divideLineSelected;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Stack(
        children: [
          MyArc(
              circleName: Constants.whiteCircleName,
              diameter: (screenSizeWidth! * 94.4) / 100), //Constants.whiteCircleDiameter = 400
          CustomPaint(
            //1
            foregroundPainter: LinePainter(
              startPointX: (screenSizeWidth! * 35.4) / 100, //150
              startPointY: (screenSizeHeight! * 20) / 100, //160
              endPointX: (screenSizeWidth! * 46) / 100, //195
              endPointY: (screenSizeHeight! * 17.5) / 100, //140
              color: _plusLineSelected! ? Colors.pink : null,
            ),
          ),
          CustomPaint(
            foregroundPainter: LinePainter(
              // startPointX: whiteCircleDiameter * 1 / 6,//66
              // startPointY: whiteCircleDiameter * 1 / 2,//200
              // endPointX: whiteCircleDiameter * 5 / 6 - 135,//198.3
              // endPointY: whiteCircleDiameter * 1 / 2,//200
              startPointX: (screenSizeWidth! * 15.5) / 100,
              startPointY: (screenSizeHeight! * 25) / 100,
              endPointX: (screenSizeWidth! * 46.6) / 100,
              endPointY: (screenSizeHeight! * 25) / 100,
              color: _minusLineSelected! ? Colors.pink : null,
              // color: Colors.pink,
            ),
          ),
          CustomPaint(
            foregroundPainter: LinePainter(
              startPointX: (screenSizeWidth! * 43.8) / 100, //188
              startPointY: (screenSizeHeight! * 31.2) / 100, //250
              endPointX: (screenSizeWidth! * 1.6) / 100, //7
              endPointY: (screenSizeHeight! * 18.7) / 100, //150
              color: _timesLineSelected! ? Colors.pink : null,
            ),
          ),
          CustomPaint(
            foregroundPainter: LinePainter(
              startPointX: (screenSizeWidth! * 30.6) / 100, //130
              startPointY: (screenSizeHeight! * 28.7) / 100, //230
              endPointX: (screenSizeWidth! * 37.3) / 100, //160
              endPointY: (screenSizeHeight! * 37.5) / 100, //300
              color: _divideLineSelected! ? Colors.pink : null,
            ),
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    );
  }
}

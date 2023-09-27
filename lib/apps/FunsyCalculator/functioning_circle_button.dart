import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_app/apps/FunsyCalculator/funzy_cal_constants.dart';
import 'package:multi_app/apps/FunsyCalculator/funzy_cal_data_change_notifier.dart';
import 'package:multi_app/apps/FunsyCalculator/funzy_cal_main.dart';
import 'package:provider/provider.dart';

class FunctioningCircleButtons extends StatefulWidget {
  final double? smallButtonSize;

  FunctioningCircleButtons({this.smallButtonSize});

  @override
  _FunctioningCircleButtonsState createState() =>
      _FunctioningCircleButtonsState();

  static _FunctioningCircleButtonsState? of(BuildContext context) =>
      context.findAncestorStateOfType<_FunctioningCircleButtonsState>();
}

class _FunctioningCircleButtonsState extends State<FunctioningCircleButtons> {
  Color? color;
  bool _plusSelected = false,
      _minusSelected = false,
      _timesSelected = false,
      _divideSelected = false;

  // double _smallSize = 56.0, _bigSize = 70.0;
  double? _smallSize, _bigSize;

  double? _plusSizeSelected,
      _minusSizeSelected,
      _timesSizeSelected,
      _divideSizeSelected;

  bool _large = false;

  @override
  void initState() {
    super.initState();

    _plusSizeSelected = widget.smallButtonSize;
    _minusSizeSelected = widget.smallButtonSize;
    _timesSizeSelected = widget.smallButtonSize;
    _divideSizeSelected = widget.smallButtonSize;
  }

  @override
  Widget build(BuildContext context) {
    var screenSizeHeight = MediaQuery.of(context).size.height;
    var screenSizeWidth = MediaQuery.of(context).size.width;

    _smallSize = (screenSizeWidth * 13.2) / 100;
    _bigSize = (screenSizeWidth * 16.5) / 100;

    if (Provider.of<DataChangeNotifier>(context, listen: true)
            .resetAllSelectedButtons ==
        true) {
      setState(() {
        _plusSelected = false;
        _minusSelected = false;
        _timesSelected = false;
        _divideSelected = false;

        _plusSizeSelected = _smallSize;
        _minusSizeSelected = _smallSize;
        _timesSizeSelected = _smallSize;
        _divideSizeSelected = _smallSize;

        Provider.of<DataChangeNotifier>(context, listen: false)
            .updateAllSelectedButtons(false);
      });
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          // height: 100,
          height: (screenSizeHeight * 12.5) / 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // width: 35,
              width: (screenSizeWidth * 8.2) / 100,
            ),
            buildClipOval(FontAwesomeIcons.plus, context, _plusSelected,
                _plusSizeSelected),
          ],
        ),
        SizedBox(
          // height: 20,
          height: (screenSizeHeight * 2.5) / 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // width: 45,
              width: (screenSizeWidth * 10.6) / 100,
            ),
            buildClipOval(FontAwesomeIcons.minus, context, _minusSelected,
                _minusSizeSelected),
          ],
        ),
        SizedBox(
          // height: 20,
          height: (screenSizeHeight * 2.5) / 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // width: 15,
              width: (screenSizeWidth * 3.5) / 100,
            ),
            buildClipOval(FontAwesomeIcons.times, context, _timesSelected,
                _timesSizeSelected),
          ],
        ),
        SizedBox(
          // height: 10,
          height: (screenSizeHeight * 1.25) / 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              // width: 150,
              width: (screenSizeWidth * 35.4) / 100,
            ),
            buildClipOval(FontAwesomeIcons.divide, context, _divideSelected,
                _divideSizeSelected),
          ],
        ),
        SizedBox(
          // height: 30,
          height: (screenSizeHeight * 3.7) / 100,
        ),
      ],
    );
  }

  ClipOval buildClipOval(
      IconData icon, BuildContext context, bool isSelected, double? btnSize) {
    var screenWidth = MediaQuery.of(context).size.width;

    return ClipOval(
      child: Material(
        color: !isSelected
            ? Constants.deactiveFunctionColor
            : Constants.activeFunctionColor,
        child: InkWell(
          splashColor: Colors.red,
          onTap: () {
            setState(
              () {
                updateButtonsSizeAndColor(icon: icon);
              },
            );
          },
          child: AnimatedSize(
            curve: Curves.decelerate,
            duration: Duration(milliseconds: 500),
            child: SizedBox(
              // width: 56,
              // height: 56,
              width: btnSize,
              height: btnSize,
              // width: (screenWidth * 13.2) / 100,
              // height: (screenHeight * 7) / 100,
              child: Center(
                child: FaIcon(
                  icon,
                  color: Colors.white,
                  // size: 20,
                  size: (screenWidth * 4.7) / 100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void updateButtonsSizeAndColor({IconData? icon}) {
    if (icon == FontAwesomeIcons.plus) {
      FunzyCalHomePage.of(context)!.signString = "+";
      FunzyCalHomePage.of(context)!.isSecondNumber = true;
      FunzyCalHomePage.of(context)!.isPlusLineSelected = true;
      FunzyCalHomePage.of(context)!.isMinusLineSelected = false;
      FunzyCalHomePage.of(context)!.isTimesLineSelected = false;
      FunzyCalHomePage.of(context)!.isDivideLineSelected = false;
      _plusSelected = true;
      _minusSelected = false;
      _timesSelected = false;
      _divideSelected = false;
      _plusSizeSelected = _bigSize;
      _minusSizeSelected = _smallSize;
      _timesSizeSelected = _smallSize;
      _divideSizeSelected = _smallSize;
    } else if (icon == FontAwesomeIcons.minus) {
      FunzyCalHomePage.of(context)!.signString = "-";
      FunzyCalHomePage.of(context)!.isSecondNumber = true;
      FunzyCalHomePage.of(context)!.isPlusLineSelected = false;
      FunzyCalHomePage.of(context)!.isMinusLineSelected = true;
      FunzyCalHomePage.of(context)!.isTimesLineSelected = false;
      FunzyCalHomePage.of(context)!.isDivideLineSelected = false;
      _plusSelected = false;
      _minusSelected = true;
      _timesSelected = false;
      _divideSelected = false;
      _plusSizeSelected = _smallSize;
      _minusSizeSelected = _bigSize;
      _timesSizeSelected = _smallSize;
      _divideSizeSelected = _smallSize;
    } else if (icon == FontAwesomeIcons.times) {
      FunzyCalHomePage.of(context)!.signString = String.fromCharCode(0x00D7);
      FunzyCalHomePage.of(context)!.isSecondNumber = true;
      FunzyCalHomePage.of(context)!.isPlusLineSelected = false;
      FunzyCalHomePage.of(context)!.isMinusLineSelected = false;
      FunzyCalHomePage.of(context)!.isTimesLineSelected = true;
      FunzyCalHomePage.of(context)!.isDivideLineSelected = false;
      _plusSelected = false;
      _minusSelected = false;
      _timesSelected = true;
      _divideSelected = false;
      _plusSizeSelected = _smallSize;
      _minusSizeSelected = _smallSize;
      _timesSizeSelected = _bigSize;
      _divideSizeSelected = _smallSize;
    } else if (icon == FontAwesomeIcons.divide) {
      FunzyCalHomePage.of(context)!.signString = String.fromCharCode(0x00F7);
      FunzyCalHomePage.of(context)!.isSecondNumber = true;
      FunzyCalHomePage.of(context)!.isPlusLineSelected = false;
      FunzyCalHomePage.of(context)!.isMinusLineSelected = false;
      FunzyCalHomePage.of(context)!.isTimesLineSelected = false;
      FunzyCalHomePage.of(context)!.isDivideLineSelected = true;
      _plusSelected = false;
      _minusSelected = false;
      _timesSelected = false;
      _divideSelected = true;
      _plusSizeSelected = _smallSize;
      _minusSizeSelected = _smallSize;
      _timesSizeSelected = _smallSize;
      _divideSizeSelected = _bigSize;
    }
  }
}

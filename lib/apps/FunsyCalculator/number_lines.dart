import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_app/apps/FunsyCalculator/funzy_cal_constants.dart';
import 'package:multi_app/apps/FunsyCalculator/funzy_cal_data_change_notifier.dart';
import 'package:multi_app/apps/FunsyCalculator/line_painter.dart';
import 'package:provider/provider.dart';

class NumberLines extends StatefulWidget {
  @override
  _NumberLinesState createState() => _NumberLinesState();

  static _NumberLinesState? of(BuildContext context) =>
      context.findAncestorStateOfType<_NumberLinesState>();
}

class _NumberLinesState extends State<NumberLines> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CustomPaint(
          //0
          foregroundPainter: LinePainter(
            // startPointX: 240,
            // startPointY: 580,
            // endPointX: 270,
            // endPointY: 605,
            startPointX: (screenWidth * 56.6) / 100,
            startPointY: (screenHeight * 72.6) / 100,
            endPointX: (screenWidth * 63.7) / 100,
            endPointY: (screenHeight * 75.7) / 100,
            color: Provider.of<DataChangeNotifier>(context, listen: true)
                    .zeroLineSelected
                ? Constants.activeFunctionColor
                : Constants.deactiveFunctionColor,
          ),
        ),
        CustomPaint(
          //9
          foregroundPainter: LinePainter(
            // startPointX: 280,
            // startPointY: 530,
            // endPointX: 315,
            // endPointY: 550,
            startPointX: (screenWidth * 66.1) / 100,
            startPointY: (screenHeight * 66.3) / 100,
            endPointX: (screenWidth * 74.3) / 100,
            endPointY: (screenHeight * 68.8) / 100,
            color: Provider.of<DataChangeNotifier>(context, listen: true)
                    .ninthLineSelected
                ? Constants.activeFunctionColor
                : Constants.deactiveFunctionColor,
          ),
        ),
        CustomPaint(
          //8
          foregroundPainter: LinePainter(
            // startPointX: 310,
            // startPointY: 480,
            // endPointX: 345,
            // endPointY: 495,
            startPointX: (screenWidth * 73.1) / 100,
            startPointY: (screenHeight * 60) / 100,
            endPointX: (screenWidth * 81.4) / 100,
            endPointY: (screenHeight * 61.9) / 100,
            color: Provider.of<DataChangeNotifier>(context, listen: true)
                    .eightLineSelected
                ? Constants.activeFunctionColor
                : Constants.deactiveFunctionColor,
          ),
        ),
        CustomPaint(
          //7
          foregroundPainter: LinePainter(
            // startPointX: 328,
            // startPointY: 430,
            // endPointX: 365,
            // endPointY: 440,
            startPointX: (screenWidth * 77.4) / 100,
            startPointY: (screenHeight * 53.8) / 100,
            endPointX: (screenWidth * 86.1) / 100,
            endPointY: (screenHeight * 55) / 100,
            color: Provider.of<DataChangeNotifier>(context, listen: true)
                    .seventhLineSelected
                ? Constants.activeFunctionColor
                : Constants.deactiveFunctionColor,
          ),
        ),
        CustomPaint(
          //6
          foregroundPainter: LinePainter(
            // startPointX: 335,
            // startPointY: 380,
            // endPointX: 370,
            // endPointY: 385,
            startPointX: (screenWidth * 79) / 100,
            startPointY: (screenHeight * 47.5) / 100,
            endPointX: (screenWidth * 87.3) / 100,
            endPointY: (screenHeight * 48.1) / 100,
            color: Provider.of<DataChangeNotifier>(context, listen: true)
                    .sixthLineSelected
                ? Constants.activeFunctionColor
                : Constants.deactiveFunctionColor,
          ),
        ),
        CustomPaint(
          //5
          foregroundPainter: LinePainter(
            // startPointX: 335,
            // startPointY: 330,
            // endPointX: 370,
            // endPointY: 330,
            startPointX: (screenWidth * 79) / 100,
            startPointY: (screenHeight * 41.3) / 100,
            endPointX: (screenWidth * 87.3) / 100,
            endPointY: (screenHeight * 41.3) / 100,
            color: Provider.of<DataChangeNotifier>(context, listen: true)
                    .fifthLineSelected
                ? Constants.activeFunctionColor
                : Constants.deactiveFunctionColor,
          ),
        ),
        CustomPaint(
          //4
          foregroundPainter: LinePainter(
            // startPointX: 330,
            // startPointY: 280,
            // endPointX: 365,
            // endPointY: 270,
            startPointX: (screenWidth * 77.9) / 100,
            startPointY: (screenHeight * 35) / 100,
            endPointX: (screenWidth * 86.1) / 100,
            endPointY: (screenHeight * 33.7) / 100,
            color: Provider.of<DataChangeNotifier>(context, listen: true)
                    .fourthLineSelected
                ? Constants.activeFunctionColor
                : Constants.deactiveFunctionColor,
          ),
        ),
        CustomPaint(
          //3
          foregroundPainter: LinePainter(
            // startPointX: 315,
            // startPointY: 230,
            // endPointX: 350,
            // endPointY: 215,
            startPointX: (screenWidth * 74.3) / 100,
            startPointY: (screenHeight * 28.7) / 100,
            endPointX: (screenWidth * 82.6) / 100,
            endPointY: (screenHeight * 26.9) / 100,
            color: Provider.of<DataChangeNotifier>(context, listen: true)
                    .thirdLineSelected
                ? Constants.activeFunctionColor
                : Constants.deactiveFunctionColor,
          ),
        ),
        CustomPaint(
          //2
          foregroundPainter: LinePainter(
            // startPointX: 295,
            // startPointY: 180,
            // endPointX: 330,
            // endPointY: 160,
            startPointX: (screenWidth * 69.6) / 100,
            startPointY: (screenHeight * 22.5) / 100,
            endPointX: (screenWidth * 77.9) / 100,
            endPointY: (screenHeight * 20) / 100,
            color: Provider.of<DataChangeNotifier>(context, listen: true)
                    .secondLineSelected
                ? Constants.activeFunctionColor
                : Constants.deactiveFunctionColor,
          ),
        ),
        CustomPaint(
          //1
          foregroundPainter: LinePainter(
            // startPointX: 270,
            // startPointY: 140,
            // endPointX: 300,
            // endPointY: 115,
            startPointX: (screenWidth * 63.7) / 100,
            startPointY: (screenHeight * 17.5) / 100,
            endPointX: (screenWidth * 70.8) / 100,
            endPointY: (screenHeight * 14.3) / 100,
            color: Provider.of<DataChangeNotifier>(context, listen: true)
                    .firstLineSelected
                ? Constants.activeFunctionColor
                : Constants.deactiveFunctionColor,
          ),
        ),
      ],
    );
  }
}

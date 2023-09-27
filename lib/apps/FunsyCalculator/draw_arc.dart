import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:multi_app/apps/FunsyCalculator/funzy_cal_constants.dart';
import 'package:multi_app/apps/FunsyCalculator/funzy_cal_data_change_notifier.dart';
import 'package:provider/provider.dart';

class MyArc extends StatelessWidget {
  final double? diameter;
  final String? circleName;

  const MyArc({this.circleName, this.diameter});

  @override
  Widget build(BuildContext context) {
    var screenSizeHeight = MediaQuery.of(context).size.height;
    var screenSizeWidth = MediaQuery.of(context).size.width;
    return CustomPaint(
      painter: MyPainter(
        screenSizeHeight: screenSizeHeight,
        screenSizeWidth: screenSizeWidth,
        circleName: circleName,
        color:
            Provider.of<DataChangeNotifier>(context, listen: true).isNightMode
                ? Colors.grey
                : Colors.white,
        borderCircleColor:
            Provider.of<DataChangeNotifier>(context, listen: true).isNightMode
                ? Colors.grey
                : Color(0x8b535353),
      ),
      // painter: MyPainter(circleName: circleName),
      size: Size(diameter!, diameter!),
    );
  }
}

class MyPainter extends CustomPainter {
  final double? screenSizeHeight, screenSizeWidth;
  final String? circleName;
  final Color? color, borderCircleColor;

  MyPainter(
      {this.circleName,
      this.screenSizeHeight,
      this.color,
      this.borderCircleColor,
      this.screenSizeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint;
    // print(
    //     "circle name : $circleName, size.height : ${size.height}, size.width : ${size.width}");
    if (circleName == Constants.topCircleName) {
      paint = Paint()
        ..shader = ui.Gradient.linear(
          // Offset(size.height / 1.5, size.width / 1),
          // Offset(size.height / 2, size.width / 2),
          // Offset(349.8 / 1.5, 349.8),
          // Offset(349.8 / 2, 349.8 / 2),
          // Offset(233.2, 349.8),
          // Offset(174.9, 174.9),
          // Offset(140, 260),
          // Offset(174.9, 174.9),
          Offset(
              (screenSizeWidth! * 33) / 100, (screenSizeHeight! * 32.5) / 100),
          Offset((screenSizeWidth! * 41.2) / 100,
              (screenSizeHeight! * 21.8) / 100),
          [
            Color(0xffec258c),
            Color(0xffe14ecf),
          ],
        );
      canvas.drawArc(
        Rect.fromCenter(
          // center: Offset(size.height / 2, size.width / 2),
          // center: Offset(0, screenSizeHeight - 640),
          // center: Offset(0, 158.8),
          center: Offset(0, (screenSizeHeight! * 19.8) / 100),
          // height: size.height,
          // width: size.width,
          // height: 349.8,
          // width: 349.8,
          height: (screenSizeHeight! * 43.7) / 100,
          width: (screenSizeWidth! * 82.5) / 100,
        ),
        4.713, //was math.pi
        4.713, //was math.pi
        true,
        paint,
      );
    } else if (circleName == Constants.whiteCircleName) {
      paint = Paint()..color = color!;

      canvas.drawArc(
        Rect.fromCenter(
          // center: Offset(0, screenSizeHeight - 620),
          // center: Offset(0, 178.8),
          center: Offset(0, (screenSizeHeight! * 22.3) / 100),
          // height: size.height,
          // width: size.width,
          // height: 399.8,
          // width: 399.8,
          height: (screenSizeHeight! * 50) / 100,
          width: (screenSizeWidth! * 94.3) / 100,
        ),
        4.713,
        4.713,
        true,
        paint,
      );
    } else if (circleName == Constants.shadowCircleName) {
      var path = Path();
      // var center = Offset(0, screenSizeHeight - 725);
      // var center = Offset(0, 73.8);
      // var center = Offset(0, (screenSizeHeight * 9.2) / 100);
      var center = Offset(0, (screenSizeHeight! * 9) / 100);
      // path.addOval(Rect.fromCircle(center: center, radius: 200.0));
      // path.addOval(Rect.fromCircle(
      //     center: center, radius: (screenSizeWidth * 47.2) / 100));
      path.addOval(Rect.fromCircle(
          center: center, radius: (screenSizeWidth! * 46.5) / 100));
      canvas.drawShadow(path, Color(0xff000000), 8, true);
    } else if (circleName == Constants.borderCircleName) {
      paint = Paint()
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke
        ..color = borderCircleColor!;

      canvas.drawArc(
        Rect.fromCenter(
          // center: Offset(0, size.width - 80),
          // center: Offset(0, 343.5),
          // center: Offset(0, (screenSizeWidth * 81.1) / 100),
          center: Offset(0, (screenSizeWidth! * 80) / 100),
          // height: 650,
          // width: 650,
          // height: (screenSizeHeight * 81.3) / 100,
          // width: (screenSizeWidth * 153.4) / 100,
          height: (screenSizeHeight! * 80) / 100,
          width: (screenSizeWidth! * 153.4) / 100,
        ),
        4,
        4,
        true,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

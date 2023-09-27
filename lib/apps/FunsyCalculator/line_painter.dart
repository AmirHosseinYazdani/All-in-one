import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final double? startPointX, startPointY, endPointX, endPointY;
  final Color? color;

  LinePainter(
      {this.startPointX,
      this.startPointY,
      this.endPointX,
      this.endPointY,
      this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..color = color != null ? color! : Colors.grey;

    canvas.drawLine(
      Offset(startPointX!, startPointY!), //start point
      Offset(endPointX!, endPointY!), //end point
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

import 'dart:math';

import 'package:flutter/cupertino.dart';

class ComputeBMI {
  ComputeBMI({required this.weight, required this.height});

  final int height, weight;

  late double bmi;

  String getBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25.0) {
      return 'اضافه وزن';
    } else if (bmi > 18.5) {
      return 'مناسب';
    } else {
      return 'کم وزن';
    }
  }

  String getRecommend() {
    if (bmi >= 25.0) {
      return 'توصیه می شود تا تحرک خود را افزایش داده و از پر خوری اجتناب کنید';
    } else if (bmi > 18.5) {
      return 'شاخص شما در وضعیت مناسبی قرار دارد :)';
    } else {
      return 'توصیه می شود تا با یک برنامه غذایی مناسب کمبود وزن خود را جبران کنید';
    }
  }
}

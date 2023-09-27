import 'package:flutter/material.dart';

class PVector {
  double x = 0.0, y = 0.0;

  PVector(x, y) {
    // ignore: prefer_initializing_formals
    this.x = x;
    // ignore: prefer_initializing_formals
    this.y = y;
  }
}

enum ParticleType { TEXT, CIRCLE }

class Particle {
  ParticleType type = ParticleType.CIRCLE;
  String text = "";
  PVector position = PVector(0.0, 0.0);
  PVector velocity = PVector(0.0, 0.0);
  double mass = 10.0; //kg
  double radius = 10 / 100; //1 meter = 100 px or pt
  Color color = Colors.green;
  double area = 0.0314; // PI x r x r
  double jumpFactor = -0.6;
}

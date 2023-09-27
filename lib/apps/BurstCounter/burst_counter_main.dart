import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:multi_app/apps/BurstCounter/particle.dart';

class BurstCounter extends StatelessWidget {
  const BurstCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BCounterHomePage(title: 'Burst Counter'),
    );
  }
}

class BCounterHomePage extends StatefulWidget {
  const BCounterHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BCounterHomePage> createState() => _BCounterHomePageState();
}

class _BCounterHomePageState extends State<BCounterHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  final List<Color> colors = [
    const Color(0xffffc100),
    const Color(0xffff8c00),
    const Color(0xffff3c00),
    const Color(0xffff0000)
  ];
  final GlobalKey _boxKey = GlobalKey();
  final Random random = Random();
  dynamic counterText = {"count": 1, "color": const Color(0xffffc100)};
  Rect boxSize = Rect.zero;
  List<Particle> particles = [];
  final double fps = 1 / 24; // refresh the ui 24 times per second
  late Timer timer;
  final double gravity = 9.81, dragCof = 0.47, airDensity = 1.1644;
  bool isNumber = false;

  @override
  void dispose() {
    timer.cancel();
    _animationController.removeListener(_animationListener);
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // AnimationController for initial Burst Animation of Text
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _animation = Tween(begin: 1.0, end: 3.0).animate(_animationController);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Size? size = _boxKey.currentContext!.size;
      boxSize = Rect.fromLTRB(0, 0, size!.width, size.height);
      print(boxSize);
    });

    timer = Timer.periodic(
      Duration(milliseconds: (fps * 1000).floor()),
      frameBuilder,
    );

    super.initState();
  }

  _animationListener() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    }
  }

  frameBuilder(dynamic timer) {
    particles.forEach((pt) {
      double dragForceX =
          0.5 * airDensity * pow(pt.velocity.x, 2) * dragCof * pt.area;
      double dragForceY =
          0.5 * airDensity * pow(pt.velocity.y, 2) * dragCof * pt.area;

      dragForceX = dragForceX.isInfinite ? 0.0 : dragForceX;
      dragForceY = dragForceY.isInfinite ? 0.0 : dragForceY;

      double accX = dragForceX / pt.mass; //F = m * a
      double accY = dragForceY / pt.mass + gravity;

      pt.velocity.x += accX * fps;
      pt.velocity.y += accY * fps;

      pt.position.x += pt.velocity.x * fps * 100;
      pt.position.y += pt.velocity.y * fps * 100;

      boxCollision(pt);
    });
    setState(() {});
  }

  boxCollision(Particle pt) {
    //Collision to right
    if (pt.position.x > boxSize.width - pt.radius) {
      pt.position.x = boxSize.width - pt.radius;
      pt.velocity.x *= pt.jumpFactor;
    }

    //Collision to left
    if (pt.position.x < pt.radius) {
      pt.position.x = pt.radius;
      pt.velocity.x *= pt.jumpFactor;
    }

    //Collision to bottom
    if (pt.position.y > boxSize.height - pt.radius) {
      pt.position.y = boxSize.height - pt.radius;
      pt.velocity.y *= pt.jumpFactor;
    }
  }

  burstParticles() {
    if (particles.length > 200) {
      particles.removeRange(0, 75);
    }

    _animationController.forward();
    _animationController.addListener(_animationListener);

    Color color = colors[random.nextInt(colors.length)];
    counterText["count"] += 1;
    counterText["color"] = color;

    String previousCount = "${counterText['count']}";

    int count = random.nextInt(25).clamp(7, 25);
    for (int x = 0; x < count; x++) {
      Particle p = Particle();
      p.position = PVector(boxSize.center.dx, boxSize.center.dy);
      double randomX = random.nextDouble() * 4.0;
      if (x % 2 == 0) {
        randomX = -randomX;
      }
      double randomY = random.nextDouble() * -7.0;
      p.velocity = PVector(randomX, randomY);
      p.radius = (random.nextDouble() * 10.0).clamp(2.0, 10.0);
      p.color = color;
      // p.number = Number(counterText["count"]);
      particles.add(p);
    }

    List<String> numbers = previousCount.split("");
    for (int x = 0; x < numbers.length; x++) {
      double randomX = random.nextDouble();
      if (x % 2 == 0) {
        randomX = -randomX;
      }
      double randomY = random.nextDouble() * -7.0;
      Particle p = Particle();
      p.type = ParticleType.TEXT;
      p.text = numbers[x];
      p.radius = 25;
      p.color = color;
      p.position = PVector(boxSize.center.dx, boxSize.center.dy);
      p.velocity = PVector(randomX * 4.0, randomY);
      particles.add(p);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: counterText["color"],
        title: Text(widget.title),
      ),
      body: Container(
        key: _boxKey,
        child: Stack(
          children: [
            Center(
              child: Text(
                "${counterText["count"]}",
                textScaleFactor: _animation.value,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: counterText["color"]),
              ),
            ),
            ...particles.map((pt) {
              if (pt.type == ParticleType.TEXT) {
                return Positioned(
                    top: pt.position.y,
                    left: pt.position.x,
                    child: Text(
                      pt.text,
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: pt.color),
                    ));
              } else {
                return Positioned(
                    top: pt.position.y,
                    left: pt.position.x,
                    child: Container(
                      width: pt.radius * 2,
                      height: pt.radius * 2,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: pt.color),
                    ));
              }
            }).toList()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: burstParticles,
        tooltip: 'Increment',
        backgroundColor: counterText["color"],
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

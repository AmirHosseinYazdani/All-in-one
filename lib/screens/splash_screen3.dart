import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScreenTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScreenTwoState();
  }
}

class _ScreenTwoState extends State<ScreenTwo> with TickerProviderStateMixin {
  late AnimationController _animationController,
      _bikeAnimationController,
      _bitcoinAnimationController,
      _calAnimationController,
      _xiloAnimationController;
  late Animation _animation,
      _bitAnimation,
      _bikeAnimation,
      _calAnimation,
      _xiloAnimation;

  late Timer timer;

  final GlobalKey _boxKey = GlobalKey();
  Rect boxSize = Rect.zero;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Size? size = _boxKey.currentContext!.size;
      boxSize = Rect.fromLTRB(0, 0, size!.width, size.height);
      print(boxSize.width);
    });

    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1));

    _bikeAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1));

    _calAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1));

    _bitcoinAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1));

    _xiloAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1));

    timer = Timer.periodic(
      // Duration(milliseconds: ((1 / 24) * 1000).floor()),
      Duration(milliseconds: (1000).floor()),
      frameBuilder,
    );

    _animationController.addListener(_animationListener);
    _bikeAnimationController.addListener(_animationListener);
    _calAnimationController.addListener(_animationListener);
    _bitcoinAnimationController.addListener(_animationListener);
    _xiloAnimationController.addListener(_animationListener);
  }

  frameBuilder(dynamic timer) {
    setState(() {});
  }

  _animationListener() {
    if (_animationController.isCompleted &&
        _bikeAnimationController.isCompleted &&
        _calAnimationController.isCompleted &&
        _bitcoinAnimationController.isCompleted &&
        _xiloAnimationController.isCompleted) {
      Future.delayed(Duration(seconds: 5), () {
        Navigator.pushNamed(context, "/home");
      });
    }
  }

  @override
  void dispose() {
    timer.cancel();
    _animationController.removeListener(_animationListener);
    _bikeAnimationController.removeListener(_animationListener);
    _calAnimationController.removeListener(_animationListener);
    _bitcoinAnimationController.removeListener(_animationListener);
    _xiloAnimationController.removeListener(_animationListener);
    _animationController.dispose();
    _bikeAnimationController.dispose();
    _calAnimationController.dispose();
    _bitcoinAnimationController.dispose();
    _xiloAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animation =
        Tween<double>(begin: 0.0, end: 200.0).animate(_animationController);

    _bikeAnimation = Tween<double>(begin: -80.0, end: boxSize.width)
        .animate(_bikeAnimationController);

    _calAnimation = Tween<double>(begin: -130.0, end: 10.0)
        .animate(_calAnimationController);

    _xiloAnimation = Tween<double>(begin: -110.0, end: 30.0)
        .animate(_xiloAnimationController);

    _bitAnimation = Tween<double>(begin: -130.0, end: 20.0)
        .animate(_bitcoinAnimationController);

    _animationController.forward();
    _bikeAnimationController.forward();
    _calAnimationController.forward();
    _bitcoinAnimationController.forward();
    _xiloAnimationController.forward();

    return Scaffold(
      key: _boxKey,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: new Color(0xff622f74),
              gradient: LinearGradient(
                colors: [
                  new Color(0xff6dd5ed),
                  new Color(0xff2193b0),
                ],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
          ),
          buildStackOfAnimations(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,//TODO:REMEMBER that BoxShape.circle not comes with below
                  borderRadius:
                      BorderRadius.all(Radius.circular(_animation.value)),
                  image: DecorationImage(
                    image: AssetImage('assets/images/All_in_One.png'),
                  ),
                  color: Colors.white,
                ),
                width: _animation.value,
                height: _animation.value,
                curve: Curves.fastOutSlowIn,
                duration: Duration(seconds: 3),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
              Text(
                // FlutterI18n.translate(context, "screen_two"),
                "All In One",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Stack buildStackOfAnimations() {
    return Stack(
      children: [
        MakeAnimatedPositioned('Bike'),
        MakeAnimatedPositioned('Bitcoin'),
        MakeAnimatedPositioned('calculator'),
        MakeAnimatedPositioned('xilo'),
      ],
    );
  }

  Widget MakeAnimatedPositioned(String animationName) {
    if (animationName == 'Bike') {
      return AnimatedPositioned(
        top: 20,
        left: _bikeAnimation.value,
        duration: Duration(seconds: 5),
        child: SizedBox(
          width: 100,
          height: 100,
          child: Lottie.asset("assets/animations/bike_rider.json"),
        ),
      );
    } else if (animationName == 'Bitcoin') {
      return AnimatedPositioned(
        duration: Duration(seconds: 3),
        bottom: _bitAnimation.value,
        right: 20,
        child: SizedBox(
          width: 150,
          height: 150,
          child: Lottie.asset("assets/animations/bitcoin.json"),
        ),
      );
    } else if (animationName == 'calculator') {
      return AnimatedPositioned(
        duration: Duration(seconds: 4),
        bottom: 10,
        left: _calAnimation.value,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: 100,
            height: 100,
            child: Lottie.asset("assets/animations/calculator.json"),
          ),
        ),
      );
    } else if (animationName == 'xilo') {
      return AnimatedPositioned(
        duration: Duration(seconds: 2),
        top: 5,
        right: _xiloAnimation.value,
        child: Padding(
          padding: const EdgeInsets.only(top: 150.0, right: 18.0),
          child: SizedBox(
            width: 100,
            height: 100,
            child: Lottie.asset("assets/animations/xilophone.json"),
          ),
        ),
      );
    }
    return Container();
  }
}

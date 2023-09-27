import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_app/carousel_categories_scroller.dart';
import 'package:multi_app/categories_scoller.dart';
import 'package:multi_app/constants/constants.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  late AnimationController animationController;
  late Animation animation;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = APP_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(
        GestureDetector(
          onTap: () {
            if (post['name'] == 'Currency') {
              goToApp('/currency');
            } else if (post['name'] == 'flash_chat') {
              goToApp('/flash_chat');
            } else if (post['name'] == 'BMI Calculator') {
              goToApp('/bmi');
            } else if (post['name'] == 'تاس') {
              goToApp('/dicee');
            } else if (post['name'] == 'زایلوفون') {
              goToApp('/xylophone');
            } else if (post['name'] == 'Instagram Demo') {
              goToApp('/instagram');
            } else if (post['name'] == 'نمونه صفحه احراز هویت') {
              goToApp('/login');
            } else if (post['name'] == 'Burst Counter') {
              goToApp('/burst_counter');
            } else if (post['name'] == 'Funsy Calculator') {
              goToApp('/funzy_cal');
            } else if (post['name'] == 'فروشگاه دوچرخه') {
              goToApp('/bike_store');
            }
          },
          child: Container(
            height: 300,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff00ffea)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xa400ffea),
                  Color(0x5e00c4ff),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              // color: Color(0xa400fff7),
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 5.0),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      post["name"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: ExactAssetImage("assets/images/${post["image"]}")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });

    animationController = AnimationController(duration: Duration(seconds: 4), vsync: this);

    animation = ColorTween(
      begin: Color(0xff023a5c),
      end: Color(0xff00cfd7),
    ).animate(animationController);

    animationController.repeat(reverse: true);

    animationController.addListener(() {
      setState(() {});
      // print(animation.value);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    return (await (showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('قصد خروج از برنامه رو دارید؟'),
            content: new Text('خروج از برنامه '),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('نه هنوز'),
              ),
              TextButton(
                onPressed: () => exit(0),
                child: new Text('آره'),
              ),
            ],
          ),
        ) as FutureOr<bool>?)) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: animation.value,
          body: Container(
            height: size.height,
            child: Column(
              children: <Widget>[
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: closeTopContainer ? 0 : 1,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer ? 0 : categoryHeight,
                    // child: categoriesScroller,
                    child: CarouselCategoriesScroller(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                    controller: controller,
                    itemCount: itemsData.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return itemsData[index];
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void goToApp(String s) {
    Navigator.pushNamed(context, s);
  }
}

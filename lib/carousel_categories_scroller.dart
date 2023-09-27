import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:multi_app/constants/constants.dart';

class CarouselCategoriesScroller extends StatelessWidget {
  CarouselCategoriesScroller({Key? key}) : super(key: key);

  // final List<Widget> _images = [];

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;

    void goToApp(String s) {
      Navigator.pushNamed(context, s);
    }

    return Container(
      child: CarouselSlider.builder(
        enableAutoSlider: true,
        viewportFraction: 0.9,
        initialPage: 0,
        unlimitedMode: true,
        autoSliderDelay: Duration(seconds: 4),
        autoSliderTransitionCurve: Curves.fastLinearToSlowEaseIn,
        autoSliderTransitionTime: Duration(seconds: 3),
        slideTransform: FlipHorizontalTransform(),
        slideIndicator: CircularSlideIndicator(
          indicatorBorderColor: Colors.lightBlueAccent,
          currentIndicatorColor: Colors.lightBlue,
          indicatorBackgroundColor: Colors.blueGrey,
          indicatorRadius: 8,
          itemSpacing: 30,
        ),
        itemCount: APP_DATA.length,
        slideBuilder: (index) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: () {
                if (APP_DATA[index]['name'] == 'Currency') {
                  goToApp('/currency');
                } else if (APP_DATA[index]['name'] == 'flash_chat') {
                  goToApp('/flash_chat');
                } else if (APP_DATA[index]['name'] == 'BMI Calculator') {
                  goToApp('/bmi');
                } else if (APP_DATA[index]['name'] == 'تاس') {
                  goToApp('/dicee');
                } else if (APP_DATA[index]['name'] == 'زایلوفون') {
                  goToApp('/xylophone');
                } else if (APP_DATA[index]['name'] == 'Instagram Demo') {
                  goToApp('/instagram');
                } else if (APP_DATA[index]['name'] == 'نمونه صفحه احراز هویت') {
                  goToApp('/login');
                } else if (APP_DATA[index]['name'] == 'Burst Counter') {
                  goToApp('/burst_counter');
                } else if (APP_DATA[index]['name'] == 'Funsy Calculator') {
                  goToApp('/funzy_cal');
                } else if (APP_DATA[index]['name'] == 'فروشگاه دوچرخه') {
                  goToApp('/bike_store');
                }
              },
              child: Container(
                // width: 10,
                margin: EdgeInsets.only(right: 20),
                // height: categoryHeight,
                // height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff00ffda), width: 5),
                  color: Color(0x225cbeff),
                  // borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  borderRadius: BorderRadius.circular(60.0),
                  image: DecorationImage(
                      fit: BoxFit.fitHeight, image: ExactAssetImage('assets/images/${APP_DATA[index]['image']}')),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

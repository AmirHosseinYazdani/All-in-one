import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multi_app/constants/constants.dart';

// ignore: must_be_immutable
class CategoriesScroller extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CategoriesScroller();
}

class _CategoriesScroller extends State<CategoriesScroller> {
  List<Widget> cardsList = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < APP_DATA.length; i++) {
      cardsList.add(Cards(index: i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: cardsList,
          ),
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  Cards({this.index});

  final int? index;

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;

    void goToApp(String s) {
      Navigator.pushNamed(context, s);
    }

    return GestureDetector(
      onTap: () {
        if (APP_DATA[index!]['name'] == 'Currency') {
          goToApp('/currency');
        } else if (APP_DATA[index!]['name'] == 'flash_chat') {
          goToApp('/flash_chat');
        } else if (APP_DATA[index!]['name'] == 'BMI Calculator') {
          goToApp('/bmi');
        } else if (APP_DATA[index!]['name'] == 'تاس') {
          goToApp('/dicee');
        } else if (APP_DATA[index!]['name'] == 'زایلوفون') {
          goToApp('/xylophone');
        } else if (APP_DATA[index!]['name'] == 'Instagram Demo') {
          goToApp('/instagram');
        } else if (APP_DATA[index!]['name'] == 'نمونه صفحه احراز هویت') {
          goToApp('/login');
        } else if (APP_DATA[index!]['name'] == 'Burst Counter') {
          goToApp('/burst_counter');
        } else if (APP_DATA[index!]['name'] == 'Funsy Calculator') {
          goToApp('/funzy_cal');
        }
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(right: 20),
        height: categoryHeight,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff00ffda), width: 5),
          color: Color(0xff00ffd9),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: ExactAssetImage(
                  'assets/images/${APP_DATA[index!]['image']}')),
        ),
      ),
    );
  }
}

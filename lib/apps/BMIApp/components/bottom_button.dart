import 'package:flutter/material.dart';
import 'package:multi_app/apps/BMIApp/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.title, this.onTap});

  final String? title;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: GestureDetector(
        onTap: onTap as void Function()?,
        child: Container(
          decoration: BoxDecoration(
            color: kBotmContainerColor,
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(
              color: Color(0xff00ffc3),
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          child: Center(
            child: Text(
              title!,
              style: kLargeBtnStyle,
            ),
          ),
          width: double.infinity,
          height: kBotmContainerHght,
        ),
      ),
    );
  }
}

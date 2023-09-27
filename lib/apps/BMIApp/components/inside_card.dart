import 'package:flutter/material.dart';
import 'package:multi_app/apps/BMIApp/constants.dart';

class ReusableInsideCard extends StatelessWidget {
  ReusableInsideCard({this.iconData, this.iconName});

  final IconData? iconData;
  final String? iconName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          iconName!,
          style: kLableUnitTxtStyle,
        )
      ],
    );
  }
}

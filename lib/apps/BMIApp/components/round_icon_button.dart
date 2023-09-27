import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPress});

  final Icon? icon;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress as void Function()?,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 58, height: 58),
      fillColor: Color(0xff4c4f5e),
      child: icon,
      elevation: 0.0,
    );
  }
}

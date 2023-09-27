import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.onPress});

  final Icon icon;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(width: 58, height: 58),
      fillColor: const Color(0x00ffffff),
      splashColor: Colors.red,
      focusColor: Colors.black,
      elevation: 0,
      child: icon,
    );
  }
}

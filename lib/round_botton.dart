import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData? icon;
  final void Function()? onPress;
  final void Function()? onLongPress;

  RoundIconButton({this.icon, this.onPress, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      onLongPress: onLongPress,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF4C4F5E),
      elevation: 0.0,
      child: Icon(icon),
    );
  }
}

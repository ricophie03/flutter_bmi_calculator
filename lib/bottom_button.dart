import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final void Function()? onPress;
  final String? name;

  BottomButton({this.onPress, this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: kBottomContainerHeight,
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        child: Center(
            child: Text(
          name ?? '',
          style: TextStyle(fontSize: 24.0, letterSpacing: 4.0),
        )),
      ),
    );
  }
}

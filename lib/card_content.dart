import 'package:flutter/material.dart';
import 'constants.dart';

class cardContent extends StatelessWidget {
  final String? label;
  final IconData? icon;

  cardContent({this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Color(0xFF8D8E98),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label ?? '',
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

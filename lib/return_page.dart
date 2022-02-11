import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';

class ReturnPage extends StatelessWidget {
  final String? result;
  final String? bmi;
  final String? interpretation;

  ReturnPage(
      {required this.result, required this.bmi, required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kHeightTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ReusableCard(
              colour: kCardColourActive,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result ?? ''.toUpperCase(), style: kResultHeadStyle),
                  Text(bmi ?? '', style: kResultMainStyle),
                  Text(
                    interpretation ?? '',
                    style: kResultTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              onPress: () {
                Navigator.pop(context);
              },
              name: "Re-Calculate",
            ),
          ),
        ],
      ),
    );
  }
}

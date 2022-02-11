import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bmi_calculator/reusable_card.dart';
import 'package:flutter_bmi_calculator/card_content.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'return_page.dart';
import 'round_botton.dart';
import 'calculate_brain.dart';

enum SexType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  SexType? selectedGender;
  int height = 160;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = SexType.male;
                        });
                      },
                      colour: selectedGender == SexType.male
                          ? kCardColourActive
                          : kCardColourInActive,
                      cardChild: cardContent(
                        label: "MALE",
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = SexType.female;
                        });
                      },
                      colour: selectedGender == SexType.female
                          ? kCardColourActive
                          : kCardColourInActive,
                      cardChild: cardContent(
                        label: "FEMALE",
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                      colour: kCardColourActive,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "HEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: kHeightTextStyle,
                              ),
                              Text("cm"),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                thumbColor: Color(0xFFEB1555),
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Color(0xFF8D8E98),
                                overlayColor: Color(0x29EB1555),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0)),
                            child: Slider(
                              value: height.toDouble(),
                              min: kMinHeight,
                              max: kMaxHeight,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: ReusableCard(
                      colour: kCardColourActive,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kHeightTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: ReusableCard(
                      colour: kCardColourActive,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kHeightTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              onPress: () {
                CalculateBrain calc =
                    CalculateBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReturnPage(
                              bmi: calc.CalculateBMI(),
                              result: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              },
              name: "Calculate",
            ),
          ],
        ),
      ),
    );
  }
}

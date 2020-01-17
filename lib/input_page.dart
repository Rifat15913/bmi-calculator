import 'package:bmi_calculator/button_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onTapCallback: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      backgroundColor: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onTapCallback: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      backgroundColor: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                backgroundColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      child: Slider(
                        onChanged: (double value) {
                          setState(() {
                            height = value.round();
                          });
                        },
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                      ),
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: kSliderActiveColor,
                        inactiveTrackColor: kSliderInactiveColor,
                        thumbColor: kSliderThumbColor,
                        overlayColor: kSliderOverlayColor,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      backgroundColor: kActiveCardColor,
                      cardChild: ButtonContent(
                        title: 'WEIGHT',
                        quantity: weight.toString(),
                        leftIcon: FontAwesomeIcons.minus,
                        onLeftPressCallback: () {
                          setState(() {
                            weight--;
                          });
                        },
                        rightIcon: FontAwesomeIcons.plus,
                        onRightPressCallback: () {
                          setState(() {
                            weight++;
                          });
                        },
                        buttonBackgroundColor: kRoundIconButtonBackgroundColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      backgroundColor: kActiveCardColor,
                      cardChild: ButtonContent(
                        title: 'AGE',
                        quantity: age.toString(),
                        leftIcon: FontAwesomeIcons.minus,
                        onLeftPressCallback: () {
                          setState(() {
                            age--;
                          });
                        },
                        rightIcon: FontAwesomeIcons.plus,
                        onRightPressCallback: () {
                          setState(() {
                            age++;
                          });
                        },
                        buttonBackgroundColor: kRoundIconButtonBackgroundColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: kBottomContainerColor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          ],
        ),
      ),
    );
  }
}

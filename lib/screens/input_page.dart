import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/button_content.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            BottomButton(
              onTapCallback: () {
                CalculatorBrain calculator = CalculatorBrain(
                  height: height,
                  weight: weight,
                );

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResult: calculator.calculateBMI(),
                              resultText: calculator.getResult(),
                              interpretation: calculator.getInterpretation(),
                            )));
              },
              title: 'CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}

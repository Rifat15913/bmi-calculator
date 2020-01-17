import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';

const BOTTOM_CONTAINER_HEIGHT = 80.0;
const ACTIVE_CARD_COLOR = Color(0xFF1D1E33);
const INACTIVE_CARD_COLOR = Color(0xFF111328);
const BOTTOM_CONTAINER_COLOR = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = INACTIVE_CARD_COLOR;
  Color femaleCardColor = INACTIVE_CARD_COLOR;

  // 1 = male, 2 = female
  void updateCardColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == INACTIVE_CARD_COLOR) {
        maleCardColor = ACTIVE_CARD_COLOR;
        femaleCardColor = INACTIVE_CARD_COLOR;
      } else {
        maleCardColor = INACTIVE_CARD_COLOR;
      }
    } else {
      if (femaleCardColor == INACTIVE_CARD_COLOR) {
        femaleCardColor = ACTIVE_CARD_COLOR;
        maleCardColor = INACTIVE_CARD_COLOR;
      } else {
        femaleCardColor = INACTIVE_CARD_COLOR;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateCardColor(1);
                        });
                      },
                      child: ReusableCard(
                        backgroundColor: maleCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateCardColor(2);
                        });
                      },
                      child: ReusableCard(
                        backgroundColor: femaleCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                backgroundColor: ACTIVE_CARD_COLOR,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      backgroundColor: ACTIVE_CARD_COLOR,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      backgroundColor: ACTIVE_CARD_COLOR,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: BOTTOM_CONTAINER_COLOR,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: BOTTOM_CONTAINER_HEIGHT,
            ),
          ],
        ),
      ),
    );
  }
}

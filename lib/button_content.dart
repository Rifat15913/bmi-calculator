import 'package:flutter/material.dart';

import 'constants.dart';
import 'round_icon_button.dart';

class ButtonContent extends StatelessWidget {
  ButtonContent(
      {@required this.title,
      @required this.quantity,
      @required this.leftIcon,
      @required this.onLeftPressCallback,
      @required this.rightIcon,
      @required this.onRightPressCallback,
      @required this.buttonBackgroundColor});

  final String title;
  final String quantity;
  final IconData leftIcon;
  final IconData rightIcon;
  final Function onLeftPressCallback;
  final Function onRightPressCallback;
  final Color buttonBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: kLabelTextStyle,
        ),
        Text(
          quantity,
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: leftIcon,
              onPressCallback: onLeftPressCallback,
              backgroundColor: buttonBackgroundColor,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              icon: rightIcon,
              onPressCallback: onRightPressCallback,
              backgroundColor: buttonBackgroundColor,
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    @required this.icon,
    this.backgroundColor,
    this.onPressCallback,
  });

  final IconData icon;
  final Function onPressCallback;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: backgroundColor,
      onPressed: onPressCallback,
    );
  }
}

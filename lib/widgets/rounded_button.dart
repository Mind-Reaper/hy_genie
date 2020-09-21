import 'package:flutter/material.dart';
import 'package:hy_genie/theme_state.dart';
import 'package:time/time.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onClicked;
  final double height;
  final bool inverted;

  RoundedButton({
    this.text,
    this.height,
    this.onClicked,
    this.inverted,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: inverted == null
            ? appTheme
            : inverted == true ? Colors.white : appTheme,
        child: Container(
          height: height == null ? 40 : height,
          width: height == null ? 120 : height * 3,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10, vertical: height == null ? 10 : 6),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                text,
                style: TextStyle(
                  color: inverted == null
                      ? Colors.white
                      : inverted == true ? appTheme : Colors.white,
                  // fontSize: height == null ? 15 : height / 2.5,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

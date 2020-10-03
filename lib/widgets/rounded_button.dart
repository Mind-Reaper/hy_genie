import 'package:flutter/material.dart';
import 'package:hy_genie/theme_state.dart';
import 'package:time/time.dart';
import 'package:circular_countdown/circular_countdown.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onClicked;
  final double height;
  final bool inverted;
  final bool countdown;
  final bool timerButton;
  final int time;
  final Function onFinished;
  final Function onCanceled;

  RoundedButton({
    this.text,
    this.height,
    this.onClicked,
    this.inverted,
    this.countdown = false,
    this.timerButton = false,
    this.time,
    this.onFinished,
    this.onCanceled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
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
              child: timerButton == false
                  ? FittedBox(
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
                    )
                  : countdown == false
                      ? FittedBox(
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
                        )
                      : TimeCircularCountdown(
                          unit: CountdownUnit.second,
                          countdownTotal: time,
                          diameter: 20,
                          countdownRemainingColor: appTheme,
                          isClockwise: false,
                          onFinished: onFinished),
            ),
          ),
        ),
      ),
    );
  }
}

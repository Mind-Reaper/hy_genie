import 'package:flutter/material.dart';
import 'package:hy_genie/screens/home_screen.dart';
import 'package:hy_genie/widgets/rounded_button.dart';

class Reference extends StatelessWidget {
  final String buttonText;
  final String title;
  final int goto;

  Reference({this.title, this.buttonText, this.goto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).accentColor,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(width: 10),
                if (buttonText != null)
                  RoundedButton(
                    text: buttonText,
                    height: 25,
                    onClicked: () {
                      HomeScreen.of(context).changeIndex(goto);
                    },
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
